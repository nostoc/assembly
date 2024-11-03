
global _start

section .data

str1 db "Enter the name: ",  0
size1 equ $ - str1

str2 db "Your input is : ",  0
size2 equ $ - str2





section .bss

buff resb 20


section .text

_start:

%macro print 2

mov rax, 4
mov rbx, 1
mov rcx, %1
mov rdx, %2
int 0x80

%endmacro

print str1, size1


mov rax, 3
mov rbx, 2 ; to read
mov rcx, buff
mov rdx, 20

int 0x80

print str2, size2

print buff, 20



mov rax, 1

mov rbx, 0

int 0x80