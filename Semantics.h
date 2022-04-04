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

extern struct ExprRes *doIntLit(char *digits);
extern struct ExprRes *doRval(char *name);
extern struct InstrSeq *doAssign(char *name,  struct ExprRes *Res1);
extern struct ExprRes *doAdd(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doMult(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doSubtract(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doDivide(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct ExprRes *doModulo(struct ExprRes *Res1,  struct ExprRes *Res2);
extern struct InstrSeq *doPrint(struct ExprRes *Expr);
extern struct ExprRes *doBExpr(struct ExprRes *Res1,  struct ExprRes *es2);
extern struct InstrSeq *doIf(struct ExprRes *bRes, struct InstrSeq *seq);
extern struct ExprRes *doNegate(struct ExprRes *Res);
extern struct ExprRes *doPower(struct ExprRes *Res1,  struct ExprRes *Res2);

extern void Finish(struct InstrSeq *Code);

extern SymTab *table;