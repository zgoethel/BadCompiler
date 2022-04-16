#include <string.h>
#include <strings.h>
#include <stdlib.h>
#include <stdbool.h>

#include "CodeGen.h"
#include "Semantics.h"
#include "SymTab.h"
#include "IOMngr.h"

expr_res_t *do_int_lit(char *digits)
{ 
    expr_res_t *res;
  
    res = (expr_res_t *)malloc(sizeof(expr_res_t));
    res->reg = avail_reg();
    res->body = gen_instr(NULL, "li", reg_name(res->reg), digits, NULL);

    return res;
}

expr_res_t *alloc_expr()
{
    expr_res_t *result;
    result = (expr_res_t *)malloc(sizeof(expr_res_t));
    result->reg = avail_reg();
    result->body = NULL;

    return result;
}

expr_res_t *do_load(char *name, arr_expr_t *arr) 
{ 
    expr_res_t *var = resolve(name);
    expr_res_t *res = (expr_res_t *)malloc(sizeof(expr_res_t));
    memset(res, 0, sizeof(expr_res_t));

    if (arr != NULL && var->type->arr_dim_c != arr->arr_dim_c)
    {
        put_warning(NULL);
        put_marker(col_num());
        put_warning("Array dimensionality does not match that of the accessor");
        return res;
    }

    if (arr != NULL)
    {
        for (int i = 0; i < arr->arr_dim_c; i++)
            res->body = append(res->body, arr->arr_dim[i]->body);
    }
    res->body = append(res->body, var->body);
    res->reg = var->reg;
        
    int mult = 1;
    int extra = avail_reg();

    if (arr != NULL)
        for (int i = 0; i < arr->arr_dim_c; i++)
        {
            char mult_c[32];
            sprintf(mult_c, "%d", mult);
            
            append(res->body, gen_instr(NULL, "li", reg_name(extra), strdup(mult_c), NULL));
            append(res->body, gen_instr(NULL, "mul", reg_name(extra), reg_name(extra), reg_name(arr->arr_dim[i]->reg)));
            append(res->body, gen_instr(NULL, "sll", reg_name(extra), reg_name(extra), "2"));
            append(res->body, gen_instr(NULL, "add", reg_name(res->reg), reg_name(res->reg), reg_name(extra)));
            
            mult *= var->type->arr_dim[i];
            free_reg(arr->arr_dim[i]->reg);
        }

    char offset[32];
    sprintf(offset, "%d(%s)", 0, reg_name(res->reg));
    append(res->body, gen_instr(NULL, "lw", reg_name(res->reg), strdup(offset), NULL));

    free_reg(extra);
    free(var);

    return res;
}

instr_t *do_store(char *name, arr_expr_t *arr, expr_res_t *expr)
{ 
    expr_res_t *var = resolve(name);
    instr_t *code = NULL;// = var->body;

    if (arr != NULL && var->type->arr_dim_c != arr->arr_dim_c)
    {
        put_warning(NULL);
        put_marker(col_num());
        put_warning("Array dimensionality does not match that of the assignment");

        return expr->body;
    }
    
    if (arr != NULL)
    {
        for (int i = 0; i < arr->arr_dim_c; i++)
            code = append(code, arr->arr_dim[i]->body);
    }
    code = append(code, expr->body);
    append(code, var->body);
    
    int mult = 1;
    int extra = avail_reg();

    if (arr != NULL)
        for (int i = 0; i < arr->arr_dim_c; i++)
        {
            char mult_c[32];
            sprintf(mult_c, "%d", mult);
            
            append(code, gen_instr(NULL, "li", reg_name(extra), strdup(mult_c), NULL));
            append(code, gen_instr(NULL, "mul", reg_name(extra), reg_name(extra), reg_name(arr->arr_dim[i]->reg)));
            append(code, gen_instr(NULL, "sll", reg_name(extra), reg_name(extra), "2"));
            append(code, gen_instr(NULL, "add", reg_name(var->reg), reg_name(var->reg), reg_name(extra)));

            mult *= var->type->arr_dim[i];
            free_reg(arr->arr_dim[i]->reg);
        }

    char offset[32];
    sprintf(offset, "%d(%s)", 0, reg_name(var->reg));
    append(code, gen_instr(NULL, "sw", reg_name(expr->reg), strdup(offset), NULL));

    free_reg(expr->reg);
    free_reg(extra);
    free_reg(var->reg);
    free(expr);
    free(var);
    
    return code;
}

expr_res_t *do_add(expr_res_t *l, expr_res_t *r)
{ 
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "add",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));

    free_reg(r->reg);
    free(r);

    return l;
}

expr_res_t *do_sub(expr_res_t *l, expr_res_t *r)
{ 
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "sub",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));

    free_reg(r->reg);
    free(r);

    return l;
}

expr_res_t *do_div(expr_res_t *l, expr_res_t *r)
{ 
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "div",
        reg_name(l->reg),
        reg_name(r->reg),
        NULL));
    append(l->body, gen_instr(NULL, "mflo",
        reg_name(l->reg),
        NULL,
        NULL));

    free_reg(r->reg);
    free(r);

    return l;
}

expr_res_t *do_pow(expr_res_t *l, expr_res_t *r)
{ 
    int reg = avail_reg();
    int counter = avail_reg();
    char *_l = gen_label(), *_s = gen_label();

    append(l->body, r->body);

    append(l->body, gen_instr(NULL, "li", reg_name(counter), "0", NULL));
    append(l->body, gen_instr(NULL, "li", reg_name(reg), "1", NULL));
    append(l->body, gen_instr(_s, NULL, NULL, NULL, NULL));
    append(l->body, gen_instr(NULL, "beq", reg_name(counter), reg_name(r->reg), _l));

    append(l->body, gen_instr(NULL, "mul",
        reg_name(reg),
        reg_name(reg),
        reg_name(l->reg)));

    append(l->body, gen_instr(NULL, "addi", reg_name(counter), reg_name(counter), "1"));
    append(l->body, gen_instr(NULL, "j", _s, NULL, NULL));
    append(l->body, gen_instr(_l, NULL, NULL, NULL, NULL));

    free_reg(l->reg);
    free_reg(r->reg);
    free_reg(counter);
    free(r);
    l-> reg = reg;
    //free(_l);
    //free(_s);

    return l;
}

expr_res_t *do_modulo(expr_res_t *l, expr_res_t *r)
{ 
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "div",
        reg_name(l->reg),
        reg_name(r->reg),
        NULL));
    append(l->body, gen_instr(NULL, "mfhi",
        reg_name(l->reg),
        NULL,
        NULL));

    free_reg(r->reg);
    free(r);

    return l;
}

expr_res_t *do_mult(expr_res_t *l, expr_res_t *r)
{ 
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "mul",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

instr_t *do_print(expr_res_t *expr)
{ 
    instr_t *code = expr->body;
    append(code, gen_instr(NULL, "li", "$v0", "1", NULL));
    append(code, gen_instr(NULL, "move", "$a0", reg_name(expr->reg), NULL));
    append(code, gen_instr(NULL, "syscall", NULL, NULL, NULL));

    free_reg(expr->reg);
    free(expr);

    return code;
}

unsigned int str_lit_c = 0;

char *do_str_lit(char *chars)
{
    char *_l = (char *)malloc(32);
    sprintf(_l, "_str_%u", str_lit_c++);

    enter_name(str_lits, _l);
    set_attr(str_lits, strdup(chars));

    return _l;
}

instr_t *do_print_str(char *label)
{ 
    instr_t *code = gen_instr(NULL, "li", "$v0", "4", NULL);
    append(code, gen_instr(NULL, "la", "$a0", label, NULL));
    append(code, gen_instr(NULL, "syscall", NULL, NULL, NULL));

    return code;
}

extern expr_res_t *do_compare(expr_res_t* l,  expr_res_t* r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "seq",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));

    free_reg(r->reg);
    free(r);

    return l;
}

extern expr_res_t *do_negate(expr_res_t* expr)
{
    append(expr->body, gen_instr(NULL, "sub",
        reg_name(expr->reg),
        "$zero",
        reg_name(expr->reg)));

    return expr;
}

extern expr_res_t *do_not(expr_res_t* expr)
{
    append(expr->body, gen_instr(NULL, "seq",
        reg_name(expr->reg),
        "$zero",
        reg_name(expr->reg)));

    return expr;
}

extern instr_t *do_if(expr_res_t *expr, instr_t *seq)
{
    char *_e = gen_label();
    instr_t *code = expr->body;

    append(code, gen_instr(NULL, "beq", reg_name(expr->reg), "$zero", _e));
	append(code, seq);
	append(code, gen_instr(_e, NULL, NULL, NULL, NULL));
    
    free_reg(expr->reg);
    free(expr);
    //free(_e);

	return code;
}

extern instr_t *do_if_else(expr_res_t *expr, instr_t *body, instr_t *b_else)
{
    instr_t *code = expr->body;
    char *_exit = gen_label();
    char *_else = gen_label();

    append(code, gen_instr(NULL, "beq", reg_name(expr->reg), "$zero", _else));
	append(code, body);
    append(code, gen_instr(NULL, "j", _exit, NULL, NULL));
	append(code, gen_instr(_else, NULL, NULL, NULL, NULL));
    append(code, b_else);
	append(code, gen_instr(_exit, NULL, NULL, NULL, NULL));

    free_reg(expr->reg);
    free(expr);
    //free(_else);
    //free(_exit);

	return code;
}

extern instr_t *do_while(expr_res_t *expr, instr_t *body)
{
    instr_t *result = expr->body;
    char *_start = gen_label();
    char *_exit = gen_label();

	result = append(gen_instr(_start, NULL, NULL, NULL, NULL), result);
    append(result, gen_instr(NULL, "beq", reg_name(expr->reg), "$zero", _exit));
	append(result, body);
	append(result, gen_instr(NULL, "j", _start, NULL, NULL));
	append(result, gen_instr(_exit, NULL, NULL, NULL, NULL));

    free_reg(expr->reg);
    free(expr);
    //free(_start);
    //free(_exit);

	return result;
}

extern instr_t *do_for(instr_t *pre, expr_res_t *expr, instr_t *post, instr_t *body)
{
    instr_t *result = pre;
    char *_start = gen_label();
    char *_exit = gen_label();

	append(result, gen_instr(_start, NULL, NULL, NULL, NULL));
    append(result, expr->body);
    append(result, gen_instr(NULL, "beq", reg_name(expr->reg), "$zero", _exit));
	append(result, body);
    append(result, post);
	append(result, gen_instr(NULL, "j", _start, NULL, NULL));
	append(result, gen_instr(_exit, NULL, NULL, NULL, NULL));
    append(result, body->to_free);

    free_reg(expr->reg);
    free(expr);
    //free(_start);
    //free(_exit);

	return result;
}

extern expr_res_t *do_less_than(expr_res_t *l,  expr_res_t *r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "slt",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

extern expr_res_t *do_less_than_e(expr_res_t *l,  expr_res_t *r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "sle",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

extern expr_res_t *do_greater_than(expr_res_t *l,  expr_res_t *r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "sgt",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

extern expr_res_t *do_greater_than_e(expr_res_t *l,  expr_res_t *r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "sge",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

extern expr_res_t *do_and(expr_res_t *l,  expr_res_t *r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "and",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

extern expr_res_t *do_or(expr_res_t *l,  expr_res_t *r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "or",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

extern expr_res_t *do_not_eq(expr_res_t *l,  expr_res_t *r)
{
    append(l->body, r->body);
    append(l->body, gen_instr(NULL, "sne",
        reg_name(l->reg),
        reg_name(l->reg),
        reg_name(r->reg)));
        
    free_reg(r->reg);
    free(r);

    return l;
}

extern instr_t *do_read(char *name)
{
    expr_res_t *var = resolve(name);
    instr_t *code = append(var->body, gen_instr(NULL, "li", "$v0", "5", NULL));
    append(code, gen_instr(NULL, "syscall", NULL, NULL, NULL));

    char offset[32];
    sprintf(offset, "%d(%s)", 0, reg_name(var->reg));
    append(code, gen_instr(NULL, "sw", "$v0", strdup(offset), NULL));

    free_reg(var->reg);
    free(var);
    
    return code;
}

instr_t *do_print_l(expr_res_t *expr)
{ 
    int counter = avail_reg();
    char *_l = gen_label(), *_s = gen_label();
    instr_t *code = expr->body;

    append(code, gen_instr(NULL, "li", reg_name(counter), "0", NULL));
    append(code, gen_instr(_s, NULL, NULL, NULL, NULL));
    append(code, gen_instr(NULL, "beq", reg_name(counter), reg_name(expr->reg), _l));

    append(code, gen_instr(NULL, "li", "$v0", "4", NULL));
    append(code, gen_instr(NULL, "la", "$a0", "_nl", NULL));
    append(code, gen_instr(NULL, "syscall", NULL, NULL, NULL));

    append(code, gen_instr(NULL, "addi", reg_name(counter), reg_name(counter), "1"));
    append(code, gen_instr(NULL, "j", _s, NULL, NULL));
    append(code, gen_instr(_l, NULL, NULL, NULL, NULL));

    free_reg(expr->reg);
    free_reg(counter);

    //free(_l);
    //free(_s);
    free(expr);

    return code;
}

instr_t *do_print_s(expr_res_t *expr)
{ 
    int counter = avail_reg();
    char *_l = gen_label(), *_s = gen_label();
    instr_t *code = expr->body;

    append(code, gen_instr(NULL, "li", reg_name(counter), "0", NULL));
    append(code, gen_instr(_s, NULL, NULL, NULL, NULL));
    append(code, gen_instr(NULL, "beq", reg_name(counter), reg_name(expr->reg), _l));

    append(code, gen_instr(NULL, "li", "$v0", "4", NULL));
    append(code, gen_instr(NULL, "la", "$a0", "_sp", NULL));
    append(code, gen_instr(NULL, "syscall", NULL, NULL, NULL));

    append(code, gen_instr(NULL, "addi", reg_name(counter), reg_name(counter), "1"));
    append(code, gen_instr(NULL, "j", _s, NULL, NULL));
    append(code, gen_instr(_l, NULL, NULL, NULL, NULL));

    free_reg(expr->reg);
    free_reg(counter);
    free(expr);

    return code;
}


extern type_desc_t *do_type_desc(char *name, int dims, int *sizes)
{
    type_desc_t *result = (type_desc_t *)malloc(sizeof(type_desc_t));
    result->name = name;
    result->arr_dim_c = dims;
    result->arr_dim = sizes;

    return result;
}

extern type_desc_t *do_arr_seq(type_desc_t *a, type_desc_t *b, int this_d)
{
    if (a != NULL && b != NULL)
    {
        a->arr_dim_c += b->arr_dim_c;
        a->arr_dim = (int *)realloc(a->arr_dim, a->arr_dim_c * sizeof(int));
        memcpy(&a->arr_dim[a->arr_dim_c - b->arr_dim_c], b->arr_dim, b->arr_dim_c * sizeof(int));
        free(b);

        return a;
    } else if (a != NULL || b != NULL)
        return a == NULL ? b : a;
    else
    {
        type_desc_t *result = (type_desc_t *)malloc(sizeof(type_desc_t));
        result->arr_dim = (int *)malloc(sizeof(int));
        result->arr_dim[0] = this_d;
        result->arr_dim_c = 1;
        
        return result;
    }
}

extern arr_expr_t *do_arr_expr(arr_expr_t *a, arr_expr_t *b, expr_res_t *this_d)
{
    if (a != NULL && b != NULL)
    {
        a->arr_dim_c += b->arr_dim_c;
        a->arr_dim = (expr_res_t **)realloc(a->arr_dim, a->arr_dim_c * sizeof(expr_res_t *));
        memcpy(&a->arr_dim[a->arr_dim_c - b->arr_dim_c], b->arr_dim, b->arr_dim_c * sizeof(expr_res_t *));
        free(b);

        return a;
    } else if (a != NULL || b != NULL)
        return a == NULL ? b : a;
    else
    {
        arr_expr_t *result = (arr_expr_t *)malloc(sizeof(arr_expr_t));
        result->arr_dim = (expr_res_t **)malloc(sizeof(expr_res_t *));
        result->arr_dim[0] = this_d;
        result->arr_dim_c = 1;
        
        return result;
    }
}

void accept_body(instr_t *body)
{
    instr_t *code;
    struct attr_t *attr;

    code = gen_instr(NULL, ".text", NULL, NULL, NULL);
    append(code, gen_instr(NULL,".globl","main",NULL,NULL));
    append(code, gen_instr("main", NULL, NULL, NULL, NULL));
    append(code, body);
    append(code, gen_instr(NULL, "li", "$v0", "10", NULL)); 
    append(code, gen_instr(NULL, "syscall", NULL, NULL, NULL));
    append(code, gen_instr(NULL, ".data", NULL, NULL, NULL));
    append(code, gen_instr(NULL, ".align", "4", NULL, NULL));
    append(code, gen_instr("_nl", ".asciiz", "\"\\n\"", NULL, NULL));
    append(code, gen_instr("_sp", ".asciiz", "\" \"", NULL, NULL));

    if (start_it(str_lits)) do
    {
        append(code, gen_instr(get_name(str_lits),
            ".asciiz",
            get_attr(str_lits),
            NULL,
            NULL));
        append(code, gen_instr(NULL,
            ".align",
            "4",
            NULL,
            NULL));
    } while (it_next(str_lits));

    if (start_it(table)) do
    {
        type_desc_t *t = get_attr(table);
        int space = 1;
        for (int i = 0; i < t->arr_dim_c; i++)
            space *= t->arr_dim[i];
        space *= 4;
        char space_str[100];
        memset(space_str, 0, 100);
        sprintf(space_str, "%d", space);

        append(code, gen_instr((char *)get_name(table), ".space", space_str, NULL, NULL));
    } while (it_next(table));
    
    write_seq(code);
    
    return;
}

#define STACK_SIZE 128
variable_t scope_stack[STACK_SIZE];
int scope_index = -1;

instr_t *declare(char *name, type_desc_t *type)
{
    if (scope_index == 0)
    {
        enter_name(table, name);
        set_attr(table, (void *)type);

        return gen_instr(NULL, "nop", NULL, NULL, NULL);
    }

    variable_t *copy = (variable_t *)malloc(sizeof(variable_t));
    memcpy(copy, &scope_stack[scope_index], sizeof(variable_t));

    memset(&scope_stack[scope_index], 0, sizeof(variable_t));
    variable_t variable;
    variable.name = name;
    variable.next = copy;
    variable.size = 1;
    for (int i = 0; i < type->arr_dim_c; i++)
        variable.size *= type->arr_dim[i];
    variable.type = type;
    scope_stack[scope_index] = variable;

    char amount[32];
    sprintf(amount, "-%ld", variable.size * 4);

    return gen_instr(NULL, "addi", "$sp", "$sp", strdup(amount));
}

void push()
{
    // Push new frame and zero out memory
    memset(&scope_stack[++scope_index], 0, sizeof(variable_t));
}

instr_t *peek()
{
    variable_t *temp = &scope_stack[scope_index];
    unsigned int pop_amt = 0;
    for (; temp != NULL && temp->name != NULL; temp = temp->next)
        pop_amt += temp->size;

    char offset[32];
    sprintf(offset, "%u", pop_amt * 4);

    return gen_instr(NULL, "addi", "$sp", "$sp", strdup(offset));
}

instr_t *pop()
{   
    instr_t *result = peek();
    // Pop top frame and free its nodes
    //TODO DELETE DYNAMIC NODES
    memset(&scope_stack[scope_index--], 0, sizeof(variable_t));

    return result;
}

expr_res_t *resolve(char *name)
{
    ssize_t partial_sum = 0;
    bool found = false;
    expr_res_t *result = alloc_expr();

    // Start at "most recent" stack level and iterate downwards
    for (int level = scope_index; level >= 0; level--)
    {
        bool br = false;
        // Handle global variables separately
        if (level == 0)
        {
            if (!find_name(table, name))
            {
                br = true;
                found = false;
                break;
            }

            result->type = (type_desc_t *)get_attr(table);
            result->body = gen_instr(NULL, "la", reg_name(result->reg), name, NULL);
            return result;
        }

        // Start at "most recent" variable and step backwards
        variable_t *temp = &scope_stack[level];
        for (; temp != NULL && temp->name != NULL; temp = temp->next)
        {
            // Take partial sum of previous variable sizes
            partial_sum += temp->size;
            if (strcmp(temp->name, name) == 0)
            {
                result->type = temp->type;
                br = true;
                found = true;
                break;
            }
        }
        if (br) break;
    }

    if (!found)
    {
        put_warning(NULL);
        put_marker(col_num());
        put_warning("Identifier not recognized or out of scope");
        put_warning(name);
    }

    char offset[32];
    sprintf(offset, "%ld", partial_sum * 4);
    result->body = gen_instr(NULL, "addi", reg_name(result->reg), "$sp", strdup(offset));

    return result;
}

instr_t *do_func(char *name, instr_t *decl, type_desc_t *type, instr_t *body)
{
    char *_skip = gen_label();

    instr_t *code = gen_instr(NULL, "j", _skip, NULL, NULL);
    append(code, gen_instr(name, NULL, NULL, NULL, NULL));
    append(code, decl);

    expr_res_t *_ra_expr = alloc_expr();
    _ra_expr->body = gen_instr(NULL, "move", reg_name(_ra_expr->reg), "$ra", NULL);
    append(code, do_store("_ret", NULL, _ra_expr));

    free_reg(_ra_expr->reg);

    append(code, body);

    expr_res_t *_ret = do_load("_ret", NULL);
    append(code, _ret->body);
    // Matching push is embedded in midrule
    append(code, pop());
    append(code, gen_instr(NULL, "jr", reg_name(_ret->reg), NULL, NULL));
    append(code, gen_instr(_skip, NULL, NULL, NULL, NULL));
    
    free_reg(_ret->reg);
    free(_ret);

    return code;
}

instr_t *do_invoke(char *name)
{
    instr_t *code = save_seq(); // <-- May be `NULL`
    bool do_restore = code != NULL;
    code = append(code, gen_instr(NULL, "jal", name, NULL, NULL));
    if (do_restore)
        append(code, restore_seq());
    return code;
}