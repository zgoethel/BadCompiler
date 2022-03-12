%{
    #include <stdbool.h>
    #include <string.h>

    #include "IOMngr.h"
    #include "y.tab.h"
    #include "BoolSemantics.h"

    #define YY_INPUT(buf,result,max_size) { \
        char c = getNextSourceChar(); \
        result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
    }
%}

letter [A-Za-z]
digit [0-9]

%%
true                        { return _TRUE; }
false                       { return _FALSE; }
{letter}({letter}|{digit})* { return _IDENT; }
\|\|                        { return _OR; }
\&\&                        { return _AND; }
\=                          { return _EQUALS; }
\!                          { return _EXCLAIM; }
\;                          { return _SEMI_C; }
\(                          { return _OPEN_P; }
\)                          { return _CLOSE_P; }
[ ]                         { }
\t                          { }
\r                          { }
\n                          { }
.                           {
                                writeMessage(NULL);
                                writeIndicator(getCurrentColumnNum() - 1);
                                writeMessage("Unexpected character in input");
                                writeMessage(yytext);
                            }
%%

int yywrap () {
    return 1;
}