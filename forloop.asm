section .data
    char1 db '*', 0
    size1 equ $ - char1
section .bss
    inbuf resb 1
    outbuf resb 2
section .text
global _start

_start:

    ;display *
    DISP:
    mov edx, size1     ;msg length
    mov ecx, char1   ; pointer to variable
    mov ebx, 1      ;stdout
    mov eax, 4      ;syscall number as sys_write
    int 80h
 
    ; call the kernel
    jmp DISP
    
    mov eax, 1
    mov ebx, 5
    int 80h

  


   
