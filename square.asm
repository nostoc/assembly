section .data
    msg1 db  "Enter a digit between 0 - 9 : ", 0 ; oxa,oxd equals to a new line
    size1 equ $ - msg1

    msg2 db  "The squared number is : ",0
    size2 equ $ - msg2

    newline db 0xa

  

section .bss
    inbuf resb 1
    outbuf resb 2
section .text
global _start

_start:
    ; input
    ;display msg1
    ;Write t0 stdout (console)
    mov edx, size1     ;msg length
    mov ecx, msg1   ; pointer to variable
    mov ebx, 1      ;stdout
    mov eax, 4      ;syscall number as sys_write
    int 0x80

    ; read from stdin (key board)
    mov ebx , 0 ; file to read from (0=stdin )
    mov ecx , inbuf ; store read data at buf
    mov edx , 1 ; length ( read 1 bytes )
    mov eax , 3 ; system call number "sys_read "
    int 0x80 ; call kernel

    ; process
    mov al, Byte[inbuf]    ; al=[inbuff] or al=charcter
    sub al, '0'             ; convert to digit   al=al='0'
    mul al                  ; al=al*al
    mov bl, 10              ; bl=10
    div bl                  ; ah:al = al/bl and result goes to two registers ah and al. ah = quotient, al= remainder
    add al, '0'             ; al to ascii
    add ah, '0'             ; ah to ascii
    mov word[outbuf], ax    ; load ax to outbuf

    ; output
    
    mov edx, size2
    mov ecx, msg2
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; write the squared value to the console

    mov ebx, 1
    mov edx, 2
    mov ecx, outbuf    
    mov eax, 4
    int 0x80

    ; Display newline after squared number
    mov edx, 1
    mov ecx, newline        ; load newline character
    mov ebx, 1
    mov eax, 4
    int 0x80                ; write newline to console

   
    
    
    mov ebx,0
    mov eax,1
    int 0x80