all: build/exit build/hello
.PHONY: all

build/exit: build/exit.o
	ld -o build/exit build/exit.o

build/exit.o: exit.s
	as -o build/exit.o exit.s

build/hello: build/hello.o
	ld -o build/hello build/hello.o

build/hello.o: hello.s
	as -o build/hello.o hello.s
