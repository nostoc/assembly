#test.asm ----> test.o -----> test

square: square.o
	ld -m elf_x86_64 -o square square.o

square.o: square.asm
	nasm -f elf64 -o square.o square.asm
