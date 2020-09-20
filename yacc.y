%{
#include <stdio.h>
#include <stdlib.h>
extern yylex();
extern yytext[];
extern FILE *yyin;
%}
%start start
%token RENAME AS WHERE UNION INTERSECT MINUS TIMES JOIN DIVIDEBY CNO CITY CNAME SNO PNO TQTY SNAME QUOTA
%token PNAME COST AVQTY SSHARP STATUS PSHARP COLOR WEIGHT QTY S P SP PRDCT CUST ORDERS DGT COMPARISONS
%%
start : expression {}

expression : renaming {}
           | restriction {}
           | projection {}
           | projection binaryoperation expression {}

renaming : term RENAME attribute AS attribute {}

term : relation {}
     | '(' expression ')' {}

restriction : term WHERE comparison {}

projection : term {}
           | term '[' attributecommalist ']' {}

attributecommalist : attribute {}
                   | attribute ',' attributecommalist {}

binaryoperation : UNION {}
                | INTERSECT {}
                | MINUS {}
                | TIMES {}
                | JOIN {}
                | DIVIDEBY {}

comparison : attribute compare number {}

compare : COMPARISONS {}

number : val {}
        | val number {}
val : DGT {}

attribute : CNO {}
          | CITY {}
          | CNAME {}
          | SNO {}
          | PNO {}
          | TQTY {}
          | SNAME {}
          | QUOTA {}
          | PNAME {}
          | COST {}
          | AVQTY {}
          | SSHARP {}
          | STATUS {}
          | PSHARP {}
          | COLOR {}
          | WEIGHT {}
          | QTY {}
relation : S {}
         | P {}
         | SP {}
         | PRDCT {}
         | CUST {}
         | ORDERS {}
%%
int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    if (!yyin)
    {
        printf("\nno file\n");
        exit(1);
    }
    yyparse();
    printf("\nACCEPT\n");
}
yyerror()
{
    printf("\nREJECT\n");
    exit(1);
}
yywrap()
{

}
