all: exit
.PHONY: all

exit.o: exit.s
	as -o exit.o exit.s

exit: exit.o
	ld -s -o exit exit.o
