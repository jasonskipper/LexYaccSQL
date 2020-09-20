currentproject3: project3.tab.o lex.yy.o
        cc -o project3 lex.yy.o project3.tab.o

project3.tab.o: project3.tab.c
        cc -c project3.tab.c

project3.tab.c: project3.y
        bison -d project3.y

lex.yy.o: lex.yy.c project3.tab.h
        cc -c lex.yy.c

lex.yy.c: project3.l project3.tab.c
        flex project3.l
