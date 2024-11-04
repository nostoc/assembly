#test.asm ----> test.o -----> test

forloop: forloop.o
	ld -m elf_x86_64 -o forloop forloop.o

forloop.o: forloop.asm
	nasm -f elf64 -o forloop.o forloop.asm
