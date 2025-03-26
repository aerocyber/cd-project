%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>

LLVMModuleRef module;
LLVMBuilderRef builder;

void initializeModule() {
    module = LLVMModuleCreateWithName("my_module");
    builder = LLVMCreateBuilder();
}

void generateIR() {
    // Create a function type: int main()
    LLVMTypeRef returnType = LLVMInt32Type();
    LLVMTypeRef functionType = LLVMFunctionType(returnType, NULL, 0, 0);

    // Create the function
    LLVMValueRef function = LLVMAddFunction(module, "main", functionType);

    // Create a basic block
    LLVMBasicBlockRef entry = LLVMAppendBasicBlock(function, "entry");
    LLVMPositionBuilderAtEnd(builder, entry);

    // Create a return instruction
    LLVMValueRef returnValue = LLVMConstInt(LLVMInt32Type(), 0, 0);
    LLVMBuildRet(builder, returnValue);

    // Verify the module
    char *error = NULL;
    LLVMVerifyModule(module, LLVMAbortProcessAction, &error);
    if (error) {
        fprintf(stderr, "Error: %s\n", error);
        LLVMDisposeMessage(error);
    }

    // Print the IR to stdout
    LLVMDumpModule(module);
}

%}

%union {
    int num;
    char* id;
}

%token <num> NUMBER
%token <id> IDENTIFIER
%token INT RETURN SEMICOLON LBRACE RBRACE LPAREN RPAREN

%% 

program:
    function
    ;

function:
    INT IDENTIFIER LPAREN RPAREN LBRACE statement RBRACE
    ;

statement:
    RETURN expression SEMICOLON
    ;

expression:
    NUMBER
    ;

%%

int main(int argc, char **argv) {
    initializeModule();
    yyparse();
    generateIR();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}