%{
    #include <stdbool.h>
    #include <string.h>

    #include "IOMngr.h"
    #include "y.tab.h"

    #define YY_INPUT(buf, result, max_size) { \
        char c = getNextSourceChar(); \
        result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
    }
%}

letter [A-Za-z]
digit [0-9]

%%
{letter}({letter}|{digit})* { return _IDENT; }
\=                          { return _EQUALS; }
\;                          { return _SEMI_C; }
\(                          { return _OPEN_P; }
\)                          { return _CLOSE_P; }
\+                          { return _UNION; }
\*                          { return _INTERS; }
\{\}                        { return _EMPTY_SET; }
\{{letter}(\,{letter})*\}   { return _SET_LIT; }
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