%{
    #include "BoolSemantics.h"
    #include "IOMngr.h"

    #include <string.h>

    extern int yylex();
    extern char *yytext;
    extern int yyerror(char *s);
%}
%union {
    bool boolean;
    char *string;
}

%type <string> Id
%type <boolean> Expr
%type <boolean> Term
%type <boolean> Factor

%token _IDENT
%token _TRUE
%token _FALSE

%token _OR
%token _AND

%token _EQUALS
%token _EXCLAIM
%token _SEMI_C
%token _OPEN_P
%token _CLOSE_P

%%
Prog : StmtSeq                  { printSymTab(); };
StmtSeq : Stmt StmtSeq          { };
StmtSeq :                       { };
Stmt : Id _EQUALS Expr _SEMI_C  { storeVar($1, $3); };
Expr : Expr _OR Term            { $$ = doOR($1, $3); };
Expr : Term                     { $$ = $1; };
Term : Term _AND Factor         { $$ = doAND($1, $3); };
Term : Factor                   { $$ = $1; };
Factor : _EXCLAIM Factor        { $$ = doNOT($2); };
Factor : _OPEN_P Expr _CLOSE_P  { $$ = $2; };
Factor : Id                     { $$ = getVal($1); };
Factor : _TRUE                  { $$ = true; };
Factor : _FALSE                 { $$ = false; };
Id : _IDENT                     { $$ = strdup(yytext); };
%%

int yyerror(char *s) {
    writeMessage(NULL);
    writeIndicator(getCurrentColumnNum() - 1);
    writeMessage("Syntax error; unexpected token near here");
    writeMessage(yytext);

    return 1;
}