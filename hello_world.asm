;
;   Source code written by Gabriel Correia
;

%define SYS_exit 60
%define SYS_write 1

%define STDOUT 1

global _start

section .text
_start:
    mov rdx, 12
    mov rsi, hello_world
    mov rdi, STDOUT
    mov rax, SYS_write
    syscall

    xor rdi, rdi
    mov rax, SYS_exit
    syscall

section .data
hello_world: db "Hello World", 10

