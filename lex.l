%{
#include "project3.tab.h"
extern int yylval;
%}
COMPARISONS "<"|">"|"<="|">="|"="|"<>"
DGT [0-9]+
%%
")" {return ')';}
"(" {return '(';}
"[" {return '[';}
"]" {return ']';}
[ \t\r\n]+ ;
"," {return ',';}
"RENAME" {return(RENAME);}
"AS" {return(AS);}
"WHERE" {return(WHERE);}
"UNION" {return(UNION);}
"INTERSECT" {return(INTERSECT);}
"MINUS" {return(MINUS);}
"TIMES" {return(TIMES);}
"JOIN" {return(JOIN);}
"DIVIDEBY" {return(DIVIDEBY);}
"CNO" {return(CNO);}
"CITY" {return(CITY);}
"CNAME" {return(CNAME);}
"SNO" {return(SNO);}
"PNO" {return(PNO);}
"TQTY" {return(TQTY);}
"SNAME" {return(SNAME);}
"QUOTA" {return(QUOTA);}
"PNAME" {return(PNAME);}
"COST" {return(COST);}
"AVQTY" {return(AVQTY);}
"S#" {return(SSHARP);}
"STATUS" {return(STATUS);}
"P#" {return(PSHARP);}
"COLOR" {return(COLOR);}
"WEIGHT" {return(WEIGHT);}
"QTY" {return(QTY);}
"S" {return(S);}
"P" {return(P);}
"SP" {return(SP);}
"PRDCT" {return(PRDCT);}
"CUST" {return(CUST);}
"ORDERS" {return(ORDERS);}
{DGT} {return(DGT);}
{COMPARISONS} {return(COMPARISONS);}
. {return *yytext;}

%%
