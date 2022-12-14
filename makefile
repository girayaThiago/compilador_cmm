default: flex comp run

flex:
	flex lexico.l

comp:
	gcc lex.yy.c

run:
	./a.out

bison:
	bison -Wall language.y

dbg:
	gcc -lfl -std=c11 -m64 -g -Wall -Wextra -Wpedantic //FILES

rel:
	gcc -lfl -std=c11 -m64 -O3 -Wall -Wextra -Wpedantic //FILES