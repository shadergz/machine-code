# machine-code

A collection of Assembly (Intel syntax) code that I made and that I'm currently learning about, there isn't any SIMD instructions here

## hello_world

- A simple hello world program

```as
section .text
_start:
    mov rdx, 12
    mov rsi, hello_world
    mov rdi, STDOUT
    mov rax, SYS_write
    syscall
```
