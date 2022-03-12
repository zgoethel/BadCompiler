%{
    #include "IOMngr.h"
    #include "h3Semantics.h"

    #include <string.h>
    #include <stdio.h>
    #include <stdbool.h>

    extern int yylex();
    extern char *yytext;
    extern int yyerror(char *s);
%}

%union {
    void *SymTab;
    char *string;
}

%type <string> Id
%type <string> SetLit
%type <SymTab> Expr
%type <SymTab> Term
%type <SymTab> Factor

%token _IDENT
%token _EQUALS
%token _SEMI_C
%token _OPEN_P
%token _CLOSE_P
%token _UNION
%token _INTERS
%token _EMPTY_SET
%token _SET_LIT

%%
Prog : StmtSeq                  {  __PRINT_TABLE(); };
StmtSeq : Stmt StmtSeq          { };
StmtSeq :                       { };
Stmt : Id _EQUALS Expr _SEMI_C  { __STORE_VAL($1, $3); };
Expr : Expr _INTERS Term        { $$ = __INTERS($1, $3); };
Expr : Term                     { $$ = $1; };
Term : Term _UNION Factor       { $$ = __UNION($1, $3); };
Term : Factor                   { $$ = $1; };
Factor : _OPEN_P Expr _CLOSE_P  { $$ = $2; };
Factor : SetLit                 { $$ = __PARSE_SET_LIT($1); };
SetLit : _SET_LIT               { $$ = strdup(yytext); }
SetLit : _EMPTY_SET             { $$ = strdup(yytext); }
Factor : Id                     { $$ = __LOAD_VAL($1); };
Id : _IDENT                     { $$ = strdup(yytext); };
%%

int yyerror(char *s) {
    writeMessage(NULL);
    writeIndicator(getCurrentColumnNum() - 1);
    writeMessage("Syntax error; unexpected token near here");
    writeMessage(yytext);

    return 1;
}