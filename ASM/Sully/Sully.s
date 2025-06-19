global _main
extern _sprintf, _fopen, _fprintf, _fclose, _system, _unlink

section .bss
fname_out resb 10
oname_out resb 10
ename_out resb 7
buf resb 80

section .data
quine db "global _main%1$cextern _sprintf, _fopen, _fprintf, _fclose, _system, _unlink%1$c%1$csection .bss%1$cfname_out resb 10%1$coname_out resb 10%1$cename_out resb 7%1$cbuf resb 80%1$c%1$csection .data%1$cquine db %2$c%4$s%2$c, 0%1$cfname db %2$cSully_%%d.s%2$c, 0%1$coname db %2$cSully_%%d.o%2$c, 0%1$cename db %2$cSully%%d%2$c, 0%1$cmode db %2$cw%2$c, 0%1$cnasm db %2$cnasm -f macho64 -D POG %%s -o %%s%2$c, 0%1$cgcc db %2$cgcc %%s -o %%s%2$c, 0%1$cexec db %2$c./%%s%2$c, 0%1$cnum dq %3$d%1$c%1$csection .text%1$c%%macro build_cmd 4%1$clea rdi, [rel %%1]%1$clea rsi, [rel %%2]%1$clea rdx, [rel %%3]%1$clea rcx, [rel %%4]%1$ccall _sprintf%1$c%%endmacro%1$c%1$c%%macro build_name 2%1$clea rdi, [rel %%1]%1$clea rsi, [rel %%2]%1$cmov rdx, [rel num]%1$ccall _sprintf%1$c%%endmacro%1$c%1$c_main:%1$center 0, 0%1$c%%ifdef POG%1$csub qword [rel num], 1%1$c%%endif%1$c%1$cinit_vars:%1$cbuild_name fname_out, fname%1$cbuild_name oname_out, oname%1$cbuild_name ename_out, ename%1$c%1$copen_file:%1$clea rdi, [rel fname_out]%1$clea rsi, [rel mode]%1$ccall _fopen%1$cmov r12, rax%1$c%1$cwrite_to_file:%1$cmov rdi, r12%1$clea rsi, [rel quine]%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, [rel num]%1$clea r9, [rel quine]%1$ccall _fprintf%1$cmov rdi, r12%1$ccall _fclose%1$c%1$ccomp_n_exec:%1$cbuild_cmd buf, nasm, fname_out, oname_out%1$clea rdi, [rel buf]%1$ccall _system%1$cbuild_cmd buf, gcc, oname_out, ename_out%1$clea rdi, [rel buf]%1$ccall _system%1$clea rdi, [rel oname_out]%1$ccall _unlink%1$ccmp qword [rel num], 0%1$cje exit%1$clea rdi, [rel buf]%1$clea rsi, [rel exec]%1$clea rdx, [rel ename_out]%1$ccall _sprintf%1$clea rdi, [rel buf]%1$ccall _system%1$c%1$cexit:%1$cleave%1$cret", 0
fname db "Sully_%d.s", 0
oname db "Sully_%d.o", 0
ename db "Sully%d", 0
mode db "w", 0
nasm db "nasm -f macho64 -D POG %s -o %s", 0
gcc db "gcc %s -o %s", 0
exec db "./%s", 0
num dq 5

section .text
%macro build_cmd 4
lea rdi, [rel %1]
lea rsi, [rel %2]
lea rdx, [rel %3]
lea rcx, [rel %4]
call _sprintf
%endmacro

%macro build_name 2
lea rdi, [rel %1]
lea rsi, [rel %2]
mov rdx, [rel num]
call _sprintf
%endmacro

_main:
enter 0, 0
%ifdef POG
sub qword [rel num], 1
%endif

init_vars:
build_name fname_out, fname
build_name oname_out, oname
build_name ename_out, ename

open_file:
lea rdi, [rel fname_out]
lea rsi, [rel mode]
call _fopen
mov r12, rax

write_to_file:
mov rdi, r12
lea rsi, [rel quine]
mov rdx, 10
mov rcx, 34
mov r8, [rel num]
lea r9, [rel quine]
call _fprintf
mov rdi, r12
call _fclose

comp_n_exec:
build_cmd buf, nasm, fname_out, oname_out
lea rdi, [rel buf]
call _system
build_cmd buf, gcc, oname_out, ename_out
lea rdi, [rel buf]
call _system
lea rdi, [rel oname_out]
call _unlink
cmp qword [rel num], 0
je exit
lea rdi, [rel buf]
lea rsi, [rel exec]
lea rdx, [rel ename_out]
call _sprintf
lea rdi, [rel buf]
call _system

exit:
leave
ret