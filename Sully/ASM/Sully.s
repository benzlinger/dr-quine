global _main
extern _sprintf, _fopen, _fprintf, _fclose, _system
extern _printf ;remove if not used

section .bss
fname_out resb 10
ename_out resb 6
nasm_cmd resb 80

section .data
quine db "Test file content", 0
fname db "Sully_%d.s", 0
ename db "Sully%d", 0
mode db "w", 0
nasm db "nasm -f macho64 -D POG %s -o %s", 0

section .text
%macro build_cmd 3
lea rdi, [rel %1]
lea rsi, [rel %2]
lea rdx, [rel %3]
call _sprintf
%endmacro

_main:
enter 0, 0
mov r10, 5
%ifdef POG
dec r10
%endif

open_file:
lea rdi, [rel fname_out]
lea rsi, [rel fname]
mov rdx, r10
call _sprintf
lea rdi, [rel fname_out]
lea rsi, [rel mode]
call _fopen
mov r12, rax

write_to_file:
mov rdi, r12
lea rsi, [rel quine]
call _fprintf
mov rdi, r12
call _fclose

; get_ename:
; lea rdi, [rel ename_out]
; lea rsi, [rel ename]
; mov rdx, r10
; call _sprintf

print:
build_cmd nasm_cmd, nasm, fname_out
lea rdi, [rel nasm_cmd]
call _printf

exit:
leave
ret
