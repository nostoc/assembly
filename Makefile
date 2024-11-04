#test.asm ----> test.o -----> test

minprog: minprog.o
	ld -m elf_x86_64 -o minprog minprog.o

minprog.o: minprog.asm
	nasm -f elf64 -o minprog.o minprog.asm
