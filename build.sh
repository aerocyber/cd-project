flex lexer.l
yacc -d parser.y
clang -o mycompiler lex.yy.c y.tab.c `llvm-config --cflags --ldflags --libs core`