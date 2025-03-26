%{
#include "y.tab.h"
%}

%%

"int"       { return INT; }
"return"    { return RETURN; }
";"         { return SEMICOLON; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[0-9]+      { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z]+  { yylval.id = strdup(yytext); return IDENTIFIER; }
[ \t\n]     ; // Ignore whitespace
.           { return yytext[0]; }

%%

int yywrap() {
    return 1;
}