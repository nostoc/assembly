section .data
section .bss
section .text
global _start

_start:
    ; .. Your code
    mov ebx,0
    mov eax,1
    int 0x80