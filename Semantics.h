#include "SymTab.h"

struct IdList
{
    struct SymEntry *TheEntry;
    struct IdList *Next;
};

struct ExprRes
{
    int Reg;
    struct InstrSeq *Instrs;
    char *Label;
};

struct ExprResList
{
    struct ExprRes *Expr;
    struct ExprResList *Next;
};

struct type_descriptor_t
{
    char *name;
    int arr_dim_c;
    int *arr_dim;
};

struct arr_expr_t
{
    int arr_dim_c;
    struct ExprRes **arr_dim;
};

extern struct ExprRes *doIntLit(char *digits);
extern struct ExprRes *doRval(char *name, struct arr_expr_t *arr);
extern struct InstrSeq *doAssign(char *name, struct arr_expr_t *arr, struct ExprRes *Expr);
extern struct ExprRes *doAdd(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doMult(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doSubtract(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doDivide(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doModulo(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct InstrSeq *doPrint(struct ExprRes *Expr);
extern struct ExprRes *doBExpr(struct ExprRes *Res1,  struct ExprRes *es2);
extern struct ExprRes *doNegate(struct ExprRes *Res);
extern struct ExprRes *doPower(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doLessThan(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doLessEquals(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doGreaterThan(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doGreaterEquals(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doAnd(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doOr(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doNotEquals(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doLogNegate(struct ExprRes *Res);

extern struct InstrSeq *doReadId(char *name);
extern struct InstrSeq *doPrintLines(struct ExprRes *Res);
extern struct InstrSeq *doPrintSpaces(struct ExprRes *Res);
extern char *doStringLit(char *value);
extern struct InstrSeq *doPrintStr(char *stringLit);

extern struct InstrSeq *doIf(struct ExprRes *bRes, struct InstrSeq *seq);
extern struct InstrSeq *doIfElse(struct ExprRes *bRes, struct InstrSeq *seq, struct InstrSeq *seqElse);
extern struct InstrSeq *doWhile(struct ExprRes *Res, struct InstrSeq *seq);
extern struct InstrSeq *doFor(struct InstrSeq *stmtA, struct ExprRes *expr, struct InstrSeq *stmtB, struct InstrSeq *body);

extern struct type_descriptor_t *doTypeDescriptor(char *name, int dimensionality, int *dimensions);
extern struct type_descriptor_t *doArrSeq(struct type_descriptor_t *a, struct type_descriptor_t *b, int this_d);
extern struct arr_expr_t *doArrSeqExpr(struct arr_expr_t *a, struct arr_expr_t *b, struct ExprRes *this_d);

extern void Finish(struct InstrSeq *Code);

extern SymTab *table;
extern SymTab *stringLiterals;