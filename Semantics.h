#pragma once

#include "SymTab.h"
#include "CodeGen.h"

/**
 * @brief Defines a type name and its array dimensionality and size.
 */
struct type_desc_t
{
    /**
     * @brief Type name of the described variable "datatype."
     */
    char *name;
    /**
     * @brief Count of dimensions of the array (e.g., 1D or 3D).
     * 
     */
    int arr_dim_c;
    /**
     * @brief Array of integers containing the array size in every dimension.
     */
    int *arr_dim;
    /**
     * @brief Whether this type is a pointer or an actual value.
     */
    int is_reference;
};
typedef struct type_desc_t type_desc_t;

/**
 * @brief Contains sequence of commands for and the index of the register
 *      holding results of an operation.
 */
struct expr_res_t
{
    /**
     * @brief Register holding expression result's value after excecution.
     */
    int reg;
    /**
     * @brief First node of the linked sequence of assembly instructions used to
     *      perform the expression calculation.
     */
    struct instr_t *body;
    /**
     * @brief Optional label field; I do not use this value for any purpose.
     */
    char *label;
    /**
     * @brief Field for storing resolved variable type definitions.
     */
    type_desc_t *type;
    /**
     * @brief Marks something as an array pass-by-value expression.
     */
    int is_array_by_val;
};
typedef struct expr_res_t expr_res_t;

/**
 * @brief Collection of expression results for indexing into a multi-dimensional
 *      array datatype during runtime.
 */
struct arr_expr_t
{
    /**
     * @brief Count of dimensions of the array (e.g., 1D or 3D).
     */
    int arr_dim_c;
    /**
     * @brief Array of expression result structs for the array indices.
     */
    struct expr_res_t **arr_dim;
};
typedef struct arr_expr_t arr_expr_t;

// Mappings for generating integer expression sequences
expr_res_t *do_int_lit(char *digits);
expr_res_t *do_add(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_mult(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_sub(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_div(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_modulo(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_negate(expr_res_t *expr);
expr_res_t *do_pow(expr_res_t *l,  expr_res_t *r);

// Mappings for performing comparisons and logic
expr_res_t *do_compare(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_less_than(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_less_than_e(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_greater_than(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_greater_than_e(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_and(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_or(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_not_eq(expr_res_t *l,  expr_res_t *r);
expr_res_t *do_not(expr_res_t *expr);

// Mappings for generating memory load/store operations
expr_res_t *do_load(expr_res_t *var, arr_expr_t *arr);
instr_t *do_store(expr_res_t *var, arr_expr_t *arr, expr_res_t *expr);

// Mappings for generating I/O operations and syscalls
instr_t *do_print(expr_res_t *expr);
instr_t *do_read(char *name);
instr_t *do_print_l(expr_res_t *expr);
instr_t *do_print_s(expr_res_t *expr);
char *do_str_lit(char *chars);
instr_t *do_print_str(char *label);

// Mappings for generating control structures and loops
instr_t *do_if(expr_res_t *expr, instr_t *body);
instr_t *do_if_else(expr_res_t *expr, instr_t *body, instr_t *b_else);
instr_t *do_while(expr_res_t *expr, instr_t *body);
instr_t *do_for(instr_t *pre, expr_res_t *expr, instr_t *post, instr_t *body);

// Mappings for types and multi-dimensional array index operators
type_desc_t *do_type_desc(char *name, int dims, int *sizes, int is_reference);
type_desc_t *do_arr_seq(type_desc_t *l, type_desc_t *r, int size);
arr_expr_t *do_arr_expr(arr_expr_t *l, arr_expr_t *r, expr_res_t *size);

// Final accept state action to print out the final sequence
void accept_body(instr_t *Code);

// Mappings for generating method bodies
instr_t *do_func(char *name, instr_t *decl, type_desc_t *type, instr_t *body);

/**
 * @brief Stores global variables and their type descriptors for reference.
 */
extern SymTab *table;
/**
 * @brief Contains string literals for the data section during acceptance.
 */
SymTab *str_lits;

/**
 * @brief Stack for tracking variable scopes
 */
extern variable_t scope_stack[];
/**
 * @brief Index of the active stack frame in the scope stack.
 */
extern int scope_index;

// Mappings for operating the scope stack for scoped bodies of code
instr_t *declare(char *name, type_desc_t *type);
void push();
expr_res_t *alloc_expr();
instr_t *peek();
instr_t *pop();
expr_res_t *resolve(char *name);
expr_res_t *do_invoke(instr_t *s_s, char *name, instr_t *args);
instr_t *do_call_expr(expr_res_t *expr);
instr_t *do_return(expr_res_t *expr);

extern unsigned int incidental_offset;
extern char *return_label;