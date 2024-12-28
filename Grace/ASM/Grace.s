; comment
section .text
global _start
extern _printf

%macro main 0
enter 0, 0
print quine
leave
ret
%endmacro

%macro print 1
lea rdi, [rel %1]
mov rsi, 10
mov rdx, 34
lea rcx, [rel %1]
call _printf
%endmacro

_start: main

section .data
quine db "Test", 0