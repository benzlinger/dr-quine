; outside comment
global _main
extern _printf

section .data
quine db "; outside comment%1$cglobal _main%1$cextern _printf%1$c%1$csection .data%1$cquine db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c_main:%1$c; inside comment%1$center 0, 0%1$clea rdi, [rel quine]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel quine]%1$ccall _printf%1$cleave%1$cjmp return%1$c%1$creturn:%1$cret", 0

section .text
_main:
; inside comment
enter 0, 0
lea rdi, [rel quine]
mov rsi, 10
mov rdx, 34
lea rcx, [rel quine]
call _printf
leave
jmp return

return:
ret