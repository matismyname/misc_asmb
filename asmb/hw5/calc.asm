section .data
	ask_op db "What do you want to do? (1) is add, (2) is subtract, (3) is multiply, (4) is divide. "
	first_num db "What is the first number? ", 0xa
	second_num db "What is the second number? ", 0xa

	first_num_len equ $-first_num
	second_num_len equ $-second_num	
	ask_op_len equ $-ask_op

section .bss
	op resb 16
	f_num resb 16
	s_num resb 16
	res resb 16

section .text
	global _start

_start:
	call _print_ask_op
	call _askop
	call _first_number
	call _get_first_number
	call _second_number
	call _get_second_number

	cmp rax, 1
	je _add
	cmp rax, 2
	je _sub
	cmp rax, 3
	je _mult
	cmp rax, 4
	je _div

	mov rax, 60
	mov rdi, 0
	syscall

_print_ask_op:
	mov rax, 1
	mov rdi, 1
	mov rsi, ask_op 
	mov rdx, ask_op_len
	syscall
	ret

_askop:
	mov rax, 0
	mov rdi, 0
	mov rsi, op
	mov rdx, 16
	syscall
	ret

_first_number:
	mov rax, 1
	mov rdi, 1
	mov rsi, first_num
	mov rdx, first_num_len
	syscall
	ret

_second_number:
	mov rax, 1
	mov rdi, 1
	mov rsi, second_num 
	mov rdx, second_num_len
	syscall
	ret

_get_first_number:
	mov rax, 0
	mov rdi, 0
	mov rsi, f_num
	mov rdx, 16
	syscall
	ret

_get_second_number:
	mov rax, 0
	mov rdi, 0
	mov rsi, s_num
	mov rdx, 16
	syscall
	ret

_add:
	mov rax, f_num
	mov rbx, s_num
	add rax, rbx
	mov [res], al
	syscall
	ret

_sub:
	mov rax, f_num
	mov rbx, s_num
	sub rax, rbx
	mov [res], al
	syscall
	ret
	
_div:
	mov rax, f_num
	mov rbx, s_num
	div rbx
	mov [res], al
	syscall
	ret
_mult:
	mov rax, f_num
	mov rbx, s_num
	mul rbx
	mov [res], al
	syscall
	ret

_display:
	mov rax, 1
	mov rdi, 1
	mov rsi, res
	mov rdx, 2
	syscall
	ret
