%{
    #include "IOMngr.h"
    #include "SymTab.h"
    #include "Semantics.h"
    #include "CodeGen.h"

    #include <string.h>
    #include <stdio.h>
    #include <stdbool.h>

    extern int yylex();
    extern char *yytext;
    extern int yyerror(char *s);
%}

%union {
    unsigned int count;
    long val;
    char *string;
    struct expr_res_t *ExprRes;
    struct instr_t *InstrSeq;
    struct type_desc_t *TypeDesc;
    struct arr_expr_t *ArrExpr;
    int Bool;
}

%type <ExprRes> Expr
%type <ExprRes> ExprA
%type <ExprRes> ExprB
%type <ExprRes> ExprC
%type <ExprRes> ExprD
%type <ExprRes> ExprE
%type <ExprRes> ExprF
%type <InstrSeq> StmtSeq
%type <InstrSeq> Stmt
%type <InstrSeq> Func
%type <TypeDesc> Type
%type <TypeDesc> Arr
%type <TypeDesc> ArrSeq
%type <InstrSeq> PrintSeq
%type <InstrSeq> ReadSeq
%type <string> StrLit
%type <string> IntLit
%type <InstrSeq> Assign
%type <string> Ident
%type <ArrExpr> ArrExpr
%type <ArrExpr> ArrSeqExpr
%type <InstrSeq> Body
%type <InstrSeq> Arg
%type <InstrSeq> ArgSeq
%type <InstrSeq> CallExprSeq
%type <InstrSeq> Return

%token IDENT
%token INT_LIT
%token EQUALS
%token IF
%token PRINT
%token VAR
%token LT
%token LTE
%token GT
%token GTE
%token N_EQUALS
%token AND
%token OR
%token READ
%token PR_LINES
%token PR_SPACES
%token STR_LIT
%token ELSE
%token WHILE
%token FOR
%token RETURN
%token FUN
%token REF
%token RUN

%%
Prog            : { push(); } StmtSeq                       { accept_body($2); print_reg_claims(); }
StmtSeq         : Stmt StmtSeq                              { $$ = append($1, $2); }
                |                                           { $$ = NULL; }
Stmt            : PRINT '(' PrintSeq ')' ';'                { $$ = $3; }
                | READ '(' ReadSeq ')' ';'                  { $$ = $3; }
                | PR_LINES '(' Expr ')' ';'                 { $$ = do_print_l($3); }
                | PR_SPACES '(' Expr ')' ';'                { $$ = do_print_s($3); }
                | Assign ';'                                { $$ = $1; }
                | IF '(' Expr ')' Body                      { $$ = do_if($3, $5); }
                | IF '(' Expr ')' Body ELSE Body            { $$ = do_if_else($3, $5, $7); }
                | WHILE '(' Expr ')' Body                   { $$ = do_while($3, $5); }
                | FOR { push(); } '(' Assign ';' Expr ';' Assign ')'
                  Body                                      { $$ = append(do_for($4, $6, $8, $10), pop()); }
                | Func                                      { $$ = $1; }
                | Return                                    { $$ = $1; }
                | Ident '('                                 { incidental_offset = 0; $<InstrSeq>$ = save_seq(); }
                  CallExprSeq ')' ';'                       { expr_res_t *inv = do_invoke(/*$<ExprRes>3,*/ $<InstrSeq>3, $1, $4); $$ = inv->body; free_reg(inv->reg); free(inv); incidental_offset = 0; }
CallExprSeq     : CallExprSeq ',' Expr                      { $$ = append($1, do_call_expr($3)); }
                | Expr                                      { $$ = do_call_expr($1); }
                |                                           { $$ = NULL; }
Body            : '{' { push(); } StmtSeq '}'               { $$ = append($3, pop()); }
Func            : FUN                                       { push(); return_label = gen_label(); }
                  Ident '(' ArgSeq ')' ':' Type             { $<InstrSeq>$ = declare("_ret", do_type_desc("Int", 0, NULL, false)); }
                  Body                                      { $$ = do_func($3, /*append(*/$<InstrSeq>9/*, $5)*/, $8, $10); }
Arg             : Ident ':' Type                            { $$ = declare($1, $3); }
ArgSeq          : ArgSeq ',' Arg                            { $$ = append($1, $3); }
                | Arg                                       { $$ = $1; }
                |                                           { $$ = NULL; }
Return          : RETURN '=' Expr ';'                       { $$ = do_return($3); }
             /* | RETURN ';'                                { $$ = do_return(NULL); } */
Assign          : VAR Ident ':' Type                        { $<InstrSeq>$ = declare($2, $4); }
                  '=' Expr                                  { $$ = append($<InstrSeq>5, do_store(resolve($2), NULL, $7)); }
                | VAR Ident ':' Type                        { $$ = declare($2, $4); }
                | Ident ArrSeqExpr '=' Expr                 { $$ = do_store(resolve($1), $2, $4); }
                | '*' Ident ArrSeqExpr '=' Expr             { $$ = do_store(do_load(resolve($2), NULL), $3, $5); }
ReadSeq         : ReadSeq ',' Ident                         { $$ = append($1, do_read($3)); }
                | Ident                                     { $$ = do_read($1); }
PrintSeq        : PrintSeq ',' Expr                         { $$ = append($1, do_print($3)); }
                | Expr                                      { $$ = do_print($1); }
                | PrintSeq ',' StrLit                       { $$ = append($1, do_print_str($3)); }
                | StrLit                                    { $$ = do_print_str($1); }
                | PrintSeq ',' LT Ident GT                  { $$ = append($1, do_read($4)); }
                | LT Ident GT                               { $$ = do_read($2); }
StrLit          : STR_LIT                                   { $$ = do_str_lit(yytext); } 
// Top of expression tree (lowest precedence)
Expr            : ExprA AND ExprA                           { $$ = do_and($1, $3); }
                | ExprA OR ExprA                            { $$ = do_or($1, $3); }
                | ExprA                                     { $$ = $1; }
ExprA           : ExprB EQUALS ExprB                        { $$ = do_compare($1, $3); }
                | ExprB LT ExprB                            { $$ = do_less_than($1, $3); }
                | ExprB LTE ExprB                           { $$ = do_less_than_e($1, $3); }
                | ExprB GT ExprB                            { $$ = do_greater_than($1, $3); }
                | ExprB GTE ExprB                           { $$ = do_greater_than_e($1, $3); }
                | ExprB N_EQUALS ExprB                      { $$ = do_not_eq($1, $3); }
                | ExprB                                     { $$ = $1; }
ExprB           : ExprB '+' ExprC                           { $$ = do_add($1, $3); }
                | ExprB '-' ExprC                           { $$ = do_sub($1, $3); }
                | ExprC                                     { $$ = $1; }
ExprC           : ExprC '*' ExprD                           { $$ = do_mult($1, $3); }
                | ExprC '/' ExprD                           { $$ = do_div($1, $3); }
                | ExprC '%' ExprD                           { $$ = do_modulo($1, $3); }
                | ExprD                                     { $$ = $1; }
ExprD           : ExprE '^' ExprD                           { $$ = do_pow($1, $3); }
                | ExprE                                     { $$ = $1; }
ExprE           : '-' ExprF                                 { $$ = do_negate($2); }
                | '!' ExprF                                 { $$ = do_not($2); }
                | ExprF                                     { $$ = $1; }
ExprF           : IntLit                                    { $$ = do_int_lit($1); }
                | Ident ArrSeqExpr                          { $$ = do_load(resolve($1), $2); }
                | '(' ExprA ')'                             { $$ = $2; }
                | '&' Ident                                 { $$ = resolve($2); }
                | '*' Ident ArrSeqExpr                      { $$ = do_load(do_load(resolve($2), NULL), $3); }
                | Ident '('                                 { incidental_offset = 0; $<InstrSeq>$ = save_seq(); }
                  CallExprSeq ')'                           { $$ = do_invoke(/*$<ExprRes>4,*/ $<InstrSeq>3, $1, $4); incidental_offset = 0; }
// Bottom of expression tree (highest precedence)
Type            : REF LT Ident ArrSeq GT                    { if ($4 != NULL) { $4->name = $3; $4->is_reference = true; $$ = $4; } else $$ = do_type_desc($3, 0, NULL, true); }
                |        Ident ArrSeq                       { if ($2 != NULL) { $2->name = $1; $2->is_reference = false; $$ = $2; } else $$ = do_type_desc($1, 0, NULL, false); }
ArrSeq          : ArrSeq Arr                                { $$ = do_arr_seq($1, $2, 0); }
                |                                           { $$ = NULL; }
Arr             : '[' IntLit ']'                            { int i; sscanf($2, "%d", &i); $$ = do_arr_seq(NULL, NULL, i); }
ArrSeqExpr      : ArrSeqExpr ArrExpr                        { $$ = do_arr_expr($1, $2, NULL); }
                |                                           { $$ = NULL; }
ArrExpr         : '[' Expr ']'                              { $$ = do_arr_expr(NULL, NULL, $2); }
IntLit          : INT_LIT                                   { $$ = strdup(yytext); }
Ident           : IDENT                                     { $$ = strdup(yytext); }

%%

int yyerror(char *s) {
    put_warning(NULL);
    put_marker(col_num() - 1);
    put_warning("Syntax error; unexpected token near here");
    put_warning(yytext);

    return 1;
}