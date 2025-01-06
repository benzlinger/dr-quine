; comment
global _main
extern _fprintf, _fopen, _fclose

section .data
quine db "; comment%1$cglobal _main%1$cextern _fprintf, _fopen, _fclose%1$c%1$csection .data%1$cquine db %2$c%3$s%2$c, 0%1$cfilename db %2$cGrace_kid.s%2$c, 0%1$cmode db %2$cw%2$c, 0%1$c%1$csection .text%1$c%%macro grace 0%1$center 0, 0%1$copenfile%1$cfprint quine%1$cmov rdi, r12%1$ccall _fclose%1$cleave%1$cret%1$c%%endmacro%1$c%1$c%%macro openfile 0%1$clea rdi, [rel filename]%1$clea rsi, [rel mode]%1$ccall _fopen%1$cmov r12, rax%1$c%%endmacro%1$c%1$c%%macro fprint 1%1$cmov rdi, r12%1$clea rsi, [rel %%1]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel %%1]%1$ccall _fprintf%1$c%%endmacro%1$c%1$c_main: grace", 0
filename db "Grace_kid.s", 0
mode db "w", 0

section .text
%macro grace 0
enter 0, 0
openfile
fprint quine
mov rdi, r12
call _fclose
leave
ret
%endmacro

%macro openfile 0
lea rdi, [rel filename]
lea rsi, [rel mode]
call _fopen
mov r12, rax
%endmacro

%macro fprint 1
mov rdi, r12
lea rsi, [rel %1]
mov rdx, 10
mov rcx, 34
lea r8, [rel %1]
call _fprintf
%endmacro

_main: grace