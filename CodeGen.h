#pragma once

#include <stdio.h>

extern FILE *asm_file;

/**
 * @brief Linked node containing variable stack layout data.
 */
struct variable_t
{
    /**
     * @brief Variable name within the current scope.
     */
    char *name;
    /**
     * @brief Type data associated with the variable.
     */
    struct type_desc_t *type;
    /**
     * @brief Stored calculated size for offset partial sums.
     */
    size_t size;
    /**
     * @brief Next variable in order in the stack frame.
     */
    struct variable_t *next;
};
typedef struct variable_t variable_t;

struct instr_t
{
    char *label;
    char *op;
    char *rd;
    char *rs;
    char *rt;
    struct instr_t *next;
    struct variable_t *vars;
    struct instr_t *to_free;
};
typedef struct instr_t   instr_t;

void init_codegen(char *name);
instr_t *gen_instr(char *Label, char *op, char *rd, char *rs, char *rt);
instr_t *append(instr_t *a, instr_t *b);
void  write_seq(instr_t *body);
char *gen_label();
int avail_reg();
char *reg_name(int index);
void free_reg(int index);
void reset_regs();
instr_t *save_seq();
instr_t *restore_seq();
char *imm(int val);
char *reg_off(int offset, char *reg);