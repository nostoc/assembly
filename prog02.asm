#PURPOSE : Square a number


section .data

section .bss
    buf resb 2
section .text
global _start

_start:
    # input
    # read from stdin (key board)
    mov ebx , 0 ; file to read from (0=stdin )
    mov ecx , buf ; store read data at buf
    mov edx , 1 ; length ( read 1 bytes )
    mov eax , 3 ; system call number "sys_read "
i n t 0x80 ; c a l l k e r n e l
    # process
    # output
    
    mov ebx,0
    mov eax,1
    int 0x80