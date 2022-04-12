#include <string.h>
#include <strings.h>
#include <stdlib.h>

#include "CodeGen.h"
#include "Semantics.h"
#include "SymTab.h"
#include "IOMngr.h"

struct ExprRes *doIntLit(char * digits)
{ 
    struct ExprRes *res;
  
    res = (struct ExprRes *)malloc(sizeof(struct ExprRes));
    res->Reg = AvailTmpReg();
    res->Instrs = GenInstr(NULL, "li", TmpRegName(res->Reg), digits, NULL);

    return res;
}

struct ExprRes *doRval(char *name) 
{ 
    struct ExprRes *res;
    
    if (!findName(table, name))
    {
        writeIndicator(getCurrentColumnNum());
        writeMessage("Undeclared variable");
    }

    res = (struct ExprRes *)malloc(sizeof(struct ExprRes));
    res->Reg = AvailTmpReg();
    res->Instrs = GenInstr(NULL, "lw", TmpRegName(res->Reg), name, NULL);

    return res;
}

struct ExprRes *doAdd(struct ExprRes *Res1, struct ExprRes *Res2)
{ 
    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "add",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

struct ExprRes *doSubtract(struct ExprRes *Res1, struct ExprRes *Res2)
{ 
    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "sub",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

struct ExprRes *doDivide(struct ExprRes *Res1, struct ExprRes *Res2)
{ 
    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "div",
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg),
        NULL));
    AppendSeq(Res1->Instrs, GenInstr(NULL, "mflo",
        TmpRegName(reg),
        NULL,
        NULL));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

struct ExprRes *doPower(struct ExprRes *Res1, struct ExprRes *Res2)
{ 
    int reg = AvailTmpReg();
    int counter = AvailTmpReg();
    char *l = GenLabel(), *s = GenLabel();

    AppendSeq(Res1->Instrs, Res2->Instrs);

    AppendSeq(Res1->Instrs, GenInstr(NULL, "li", TmpRegName(counter), "0", NULL));
    AppendSeq(Res1->Instrs, GenInstr(NULL, "li", TmpRegName(reg), "1", NULL));
    AppendSeq(Res1->Instrs, GenInstr(s, NULL, NULL, NULL, NULL));
    AppendSeq(Res1->Instrs, GenInstr(NULL, "beq", TmpRegName(counter), TmpRegName(Res2->Reg), l));

    AppendSeq(Res1->Instrs, GenInstr(NULL, "mul",
        TmpRegName(reg),
        TmpRegName(reg),
        TmpRegName(Res1->Reg)));

    AppendSeq(Res1->Instrs, GenInstr(NULL, "addi", TmpRegName(counter), TmpRegName(counter), "1"));
    AppendSeq(Res1->Instrs, GenInstr(NULL, "jal", s, NULL, NULL));
    AppendSeq(Res1->Instrs, GenInstr(l, NULL, NULL, NULL, NULL));

    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    ReleaseTmpReg(counter);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

struct ExprRes *doModulo(struct ExprRes *Res1, struct ExprRes *Res2)
{ 
    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "div",
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg),
        NULL));
    AppendSeq(Res1->Instrs, GenInstr(NULL, "mfhi",
        TmpRegName(reg),
        NULL,
        NULL));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

struct ExprRes *doMult(struct ExprRes *Res1, struct ExprRes *Res2)
{ 
    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "mul",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

struct InstrSeq *doPrint(struct ExprRes *Expr)
{ 
    struct InstrSeq *code;
    code = Expr->Instrs;
  
    AppendSeq(code, GenInstr(NULL, "li", "$v0", "1", NULL));
    AppendSeq(code, GenInstr(NULL, "move", "$a0", TmpRegName(Expr->Reg), NULL));
    AppendSeq(code, GenInstr(NULL, "syscall", NULL, NULL, NULL));

    AppendSeq(code, GenInstr(NULL, "li", "$v0", "4", NULL));
    AppendSeq(code, GenInstr(NULL, "la", "$a0", "_sp", NULL));
    AppendSeq(code, GenInstr(NULL, "syscall", NULL, NULL, NULL));

    ReleaseTmpReg(Expr->Reg);
    free(Expr);

    return code;
}

unsigned int stringLiteralCounter = 0;

char *doStringLit(char *value)
{
    char *_l = (char *)malloc(16);
    sprintf(_l, "_str_%u", stringLiteralCounter++);

    enterName(stringLiterals, _l);

    findName(stringLiterals, _l);
    setCurrentAttr(stringLiterals, strdup(value));

    return _l;
}

struct InstrSeq *doPrintStr(char *stringLit)
{ 
    struct InstrSeq *code = GenInstr(NULL, "li", "$v0", "4", NULL);
    AppendSeq(code, GenInstr(NULL, "la", "$a0", stringLit, NULL));
    AppendSeq(code, GenInstr(NULL, "syscall", NULL, NULL, NULL));

    return code;
}

struct InstrSeq *doAssign(char *name, struct ExprRes *Expr)
{ 
    struct InstrSeq *code;
  
    if (!findName(table, name))
    {
        writeIndicator(getCurrentColumnNum());
        writeMessage("Undeclared variable");
    }

    code = Expr->Instrs;
    
    AppendSeq(code, GenInstr(NULL, "sw", TmpRegName(Expr->Reg), name, NULL));

    ReleaseTmpReg(Expr->Reg);
    free(Expr);
    
    return code;
}

extern struct ExprRes *doBExpr(struct ExprRes* Res1,  struct ExprRes* Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "seq",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct ExprRes *doNegate(struct ExprRes* Res)
{
    int reg = AvailTmpReg();
    AppendSeq(Res->Instrs, GenInstr(NULL, "sub",
        TmpRegName(reg),
        "$zero",
        TmpRegName(Res->Reg)));
    ReleaseTmpReg(Res->Reg);
    Res->Reg = reg;

    return Res;
}

extern struct ExprRes *doLogNegate(struct ExprRes* Res)
{
    int reg = AvailTmpReg();
    AppendSeq(Res->Instrs, GenInstr(NULL, "seq",
        TmpRegName(reg),
        "$zero",
        TmpRegName(Res->Reg)));
    ReleaseTmpReg(Res->Reg);
    Res->Reg = reg;

    return Res;
}

extern struct InstrSeq *doIf(struct ExprRes *Res, struct InstrSeq *seq)
{
    struct ExprRes *bRes;
    bRes = (struct ExprRes *)malloc(sizeof(struct ExprRes));
    bRes->Label = GenLabel();
    AppendSeq(Res->Instrs, GenInstr(NULL, "beq", TmpRegName(Res->Reg), "$zero", bRes->Label));
    bRes->Instrs = Res->Instrs;
    ReleaseTmpReg(Res->Reg);
    free(Res);

	struct InstrSeq * seq2;
	seq2 = AppendSeq(bRes->Instrs, seq);
	AppendSeq(seq2, GenInstr(bRes->Label, NULL, NULL, NULL, NULL));
    free(bRes->Label);
	free(bRes);

	return seq2;
}

extern struct InstrSeq *doIfElse(struct ExprRes *Res, struct InstrSeq *seq, struct InstrSeq *seqElse)
{
    struct InstrSeq *result = Res->Instrs;
    char *exitLabel = GenLabel();
    char *elseLabel = GenLabel();

    AppendSeq(result, GenInstr(NULL, "beq", TmpRegName(Res->Reg), "$zero", elseLabel));
	AppendSeq(result, seq);
    AppendSeq(result, GenInstr(NULL, "jal", exitLabel, NULL, NULL));
	AppendSeq(result, GenInstr(elseLabel, NULL, NULL, NULL, NULL));
    AppendSeq(result, seqElse);
	AppendSeq(result, GenInstr(exitLabel, NULL, NULL, NULL, NULL));

    ReleaseTmpReg(Res->Reg);
    free(Res);
    free(elseLabel);
    free(exitLabel);

	return result;
}

extern struct InstrSeq *doWhile(struct ExprRes *Res, struct InstrSeq *seq)
{
    struct InstrSeq *result = Res->Instrs;
    char *startLabel = GenLabel();
    char *exitLabel = GenLabel();

	result = AppendSeq(GenInstr(startLabel, NULL, NULL, NULL, NULL), result);
    AppendSeq(result, GenInstr(NULL, "beq", TmpRegName(Res->Reg), "$zero", exitLabel));
	AppendSeq(result, seq);
	AppendSeq(result, GenInstr(NULL, "jal", startLabel, NULL, NULL));
	AppendSeq(result, GenInstr(exitLabel, NULL, NULL, NULL, NULL));

    ReleaseTmpReg(Res->Reg);
    free(Res);
    free(startLabel);
    free(exitLabel);

	return result;
}

extern struct InstrSeq *doFor(struct InstrSeq *stmtA, struct ExprRes *expr, struct InstrSeq *stmtB, struct InstrSeq *body)
{
    struct InstrSeq *result = stmtA;
    char *startLabel = GenLabel();
    char *exitLabel = GenLabel();

	AppendSeq(result, GenInstr(startLabel, NULL, NULL, NULL, NULL));
    AppendSeq(result, expr->Instrs);
    AppendSeq(result, GenInstr(NULL, "beq", TmpRegName(expr->Reg), "$zero", exitLabel));
	AppendSeq(result, body);
    AppendSeq(result, stmtB);
	AppendSeq(result, GenInstr(NULL, "jal", startLabel, NULL, NULL));
	AppendSeq(result, GenInstr(exitLabel, NULL, NULL, NULL, NULL));

    ReleaseTmpReg(expr->Reg);
    free(expr);
    free(startLabel);
    free(exitLabel);

	return result;
}

extern struct ExprRes *doLessThan(struct ExprRes *Res1,  struct ExprRes *Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "slt",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct ExprRes *doLessEquals(struct ExprRes *Res1,  struct ExprRes *Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "sle",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct ExprRes *doGreaterThan(struct ExprRes *Res1,  struct ExprRes *Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "sgt",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct ExprRes *doGreaterEquals(struct ExprRes *Res1,  struct ExprRes *Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "sge",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct ExprRes *doAnd(struct ExprRes *Res1,  struct ExprRes *Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "and",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct ExprRes *doOr(struct ExprRes *Res1,  struct ExprRes *Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "or",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct ExprRes *doNotEquals(struct ExprRes *Res1,  struct ExprRes *Res2)
{
    int reg = AvailTmpReg();
    AppendSeq(Res1->Instrs, Res2->Instrs);
    AppendSeq(Res1->Instrs, GenInstr(NULL, "sne",
        TmpRegName(reg),
        TmpRegName(Res1->Reg),
        TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);

    return Res1;
}

extern struct InstrSeq *doReadId(char *name)
{ 
    struct InstrSeq *code;
  
    if (!findName(table, name))
    {
        writeIndicator(getCurrentColumnNum());
        writeMessage("Undeclared variable");
    }

    // Load "read int" syscall
    code = GenInstr(NULL, "li", "$v0", "5", NULL);
    AppendSeq(code, GenInstr(NULL, "syscall", NULL, NULL, NULL));
    // Store `$v0` to memory
    AppendSeq(code, GenInstr(NULL, "sw", "$v0", name, NULL));
    
    return code;
}

struct InstrSeq *doPrintLines(struct ExprRes *Res)
{ 
    int counter = AvailTmpReg();
    char *l = GenLabel(), *s = GenLabel();

    AppendSeq(Res->Instrs, GenInstr(NULL, "li", TmpRegName(counter), "0", NULL));
    AppendSeq(Res->Instrs, GenInstr(s, NULL, NULL, NULL, NULL));
    AppendSeq(Res->Instrs, GenInstr(NULL, "beq", TmpRegName(counter), TmpRegName(Res->Reg), l));

    AppendSeq(Res->Instrs, GenInstr(NULL, "li", "$v0", "4", NULL));
    AppendSeq(Res->Instrs, GenInstr(NULL, "la", "$a0", "_nl", NULL));
    AppendSeq(Res->Instrs, GenInstr(NULL, "syscall", NULL, NULL, NULL));

    AppendSeq(Res->Instrs, GenInstr(NULL, "addi", TmpRegName(counter), TmpRegName(counter), "1"));
    AppendSeq(Res->Instrs, GenInstr(NULL, "jal", s, NULL, NULL));
    AppendSeq(Res->Instrs, GenInstr(l, NULL, NULL, NULL, NULL));

    ReleaseTmpReg(Res->Reg);
    ReleaseTmpReg(counter);

    struct InstrSeq *result = Res->Instrs;
    free(Res);

    return result;
}

struct InstrSeq *doPrintSpaces(struct ExprRes *Res)
{ 
    int counter = AvailTmpReg();
    char *l = GenLabel(), *s = GenLabel();

    AppendSeq(Res->Instrs, GenInstr(NULL, "li", TmpRegName(counter), "0", NULL));
    AppendSeq(Res->Instrs, GenInstr(s, NULL, NULL, NULL, NULL));
    AppendSeq(Res->Instrs, GenInstr(NULL, "beq", TmpRegName(counter), TmpRegName(Res->Reg), l));

    AppendSeq(Res->Instrs, GenInstr(NULL, "li", "$v0", "4", NULL));
    AppendSeq(Res->Instrs, GenInstr(NULL, "la", "$a0", "_sp", NULL));
    AppendSeq(Res->Instrs, GenInstr(NULL, "syscall", NULL, NULL, NULL));

    AppendSeq(Res->Instrs, GenInstr(NULL, "addi", TmpRegName(counter), TmpRegName(counter), "1"));
    AppendSeq(Res->Instrs, GenInstr(NULL, "jal", s, NULL, NULL));
    AppendSeq(Res->Instrs, GenInstr(l, NULL, NULL, NULL, NULL));

    ReleaseTmpReg(Res->Reg);
    ReleaseTmpReg(counter);

    struct InstrSeq *result = Res->Instrs;
    free(Res);

    return result;
}

void Finish(struct InstrSeq *Code)
{
    struct InstrSeq *code;
    int hasMore;
    struct Attr *attr;

    code = GenInstr(NULL, ".text", NULL, NULL, NULL);
    AppendSeq(code, GenInstr(NULL,".globl","main",NULL,NULL));
    AppendSeq(code, GenInstr("main", NULL, NULL, NULL, NULL));
    AppendSeq(code, Code);
    AppendSeq(code, GenInstr(NULL, "li", "$v0", "10", NULL)); 
    AppendSeq(code, GenInstr(NULL, "syscall", NULL, NULL, NULL));
    AppendSeq(code, GenInstr(NULL, ".data", NULL, NULL, NULL));
    AppendSeq(code, GenInstr(NULL, ".align", "4", NULL, NULL));
    AppendSeq(code, GenInstr("_nl", ".asciiz", "\"\\n\"", NULL, NULL));
    AppendSeq(code, GenInstr("_sp", ".asciiz", "\" \"", NULL, NULL));

    if (startIterator(stringLiterals)) do
    {
        /*
        char *attr = getCurrentAttr(stringLiterals);
        char *wrapped = (char *)malloc(strlen(attr) + 3);
        sprintf(wrapped, "\"%s\"", wrapped);
        */

        AppendSeq(code, GenInstr(getCurrentName(stringLiterals),
            ".asciiz",
            getCurrentAttr(stringLiterals),
            NULL,
            NULL));
        
        //free(wrapped);
    } while (nextEntry(stringLiterals));

    hasMore = startIterator(table);
    while (hasMore)
    {
        AppendSeq(code, GenInstr((char *)getCurrentName(table), ".word", "0", NULL, NULL));
        hasMore = nextEntry(table);
    }
    
    WriteSeq(code);
    
    return;
}