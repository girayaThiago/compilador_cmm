default: flex compile

flex:
	flex lexico.l

compile:
	gcc lex.yy.c

test: default
	./a.out < input > output

run: default
	./a.out 

bison:
	bison -Wall language.y

dbg:
	gcc -lfl -std=c11 -m64 -g -Wall -Wextra -Wpedantic //FILES

rel:
	gcc -lfl -std=c11 -m64 -O3 -Wall -Wextra -Wpedantic //FILES