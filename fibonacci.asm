;
;   Source code written by Gabriel Correia
;

BITS 64

extern printf

global main, fibo

%macro FUNC_PROLOGUE 1
    push rbp
    mov rbp, rsp
    sub rsp, %1
%endmacro

%macro FUNC_EPILOGUE 0
    leave
    ret
%endmacro

section .text
fibo:
    ; F(n) = F(n-1) + F(n-2)
    ; fibo (n) -> fibo (n - 1) + fibo(n - 2) while n >= 1
    FUNC_PROLOGUE 16
    ; Create a integer in the stack
    mov DWORD [rbp-4], edi
    ; Compare to 1
    cmp DWORD [rbp-4], 1
    ; Jump if the number is not greter or equal to 1
    jng  .C1
    sub DWORD [rbp-4], 1
    call fibo
    mov DWORD [rbp-8], eax
    mov edi, DWORD [rbp-4]
    sub DWORD [rbp-4], 1
    call fibo
    mov ebx, DWORD [rbp-8]
    add eax, ebx

    FUNC_EPILOGUE
.C1:
    ; Returns the same value
    ; This part of code is most like this:
    ; if (n <= 1)
    ;   return n;
    ;
    mov eax, DWORD [rbp-4]
    FUNC_EPILOGUE

main:
    ; Caculate the fibonacci from the value 9
    FUNC_PROLOGUE 16
    mov edi, 9
    call fibo

    mov esi, eax
    mov rdi, fmt
    call printf
    FUNC_EPILOGUE

section .data
fmt: db "%d", 0x0a
