; comment
%macro START 0
global _main
extern _fprintf, _fopen, _fclose
section .data
file db "Grace_kid.s", 0
mode db "w", 0
quine db "; comment%1$c%%macro START 0%1$cglobal _main%1$cextern _fprintf, _fopen, _fclose%1$csection .data%1$cfile db %2$cGrace_kid.s%2$c, 0%1$cmode db %2$cw%2$c, 0%1$cquine db %2$c%3$s%2$c, 0%1$c%1$c%%define NL 10%1$c%%define DQ 34%1$c%%define QUINE quine%1$c%1$csection .text%1$c_main:%1$center 0, 0%1$c%1$clea rdi, [rel file]%1$clea rsi, [rel mode]%1$ccall _fopen%1$cmov r12, rax%1$c%1$c%1$cmov rdi, r12%1$clea rsi, [rel QUINE]%1$cmov rdx, NL%1$cmov rcx, DQ%1$clea r8, [rel QUINE]%1$ccall _fprintf%1$c%1$cmov rdi, r12%1$ccall _fclose%1$c%1$cleave%1$cret%1$c%%endmacro%1$c%1$cSTART", 0

%define NL 10
%define DQ 34
%define QUINE quine

section .text
_main:
enter 0, 0

lea rdi, [rel file]
lea rsi, [rel mode]
call _fopen
mov r12, rax


mov rdi, r12
lea rsi, [rel QUINE]
mov rdx, NL
mov rcx, DQ
lea r8, [rel QUINE]
call _fprintf

mov rdi, r12
call _fclose

leave
ret
%endmacro

START