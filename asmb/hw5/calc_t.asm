section .data
	ask_operation db "What do you want to do? (1) add, (2) subtract, (3) divide, (4) multiply  "
	ask_first_num db "What is your first number? "
	ask_second_num db "What is your second number? "

	op_len equ $-ask_operation
	first_num_len equ $-ask_first_num
	second_num_len equ $-ask_second_num

	res db 0	

section .bss
	operation resb 16
	first_num resb 16
	second_num resb 16

section .text:
	global _start
_start:
	call _ask_operand
	call _get_operand

	call _ask_first_num
	call _get_first_num

	call _ask_second_num
	call _get_second_num

	cmp rax, 1
	je _add
	cmp rax, 2
	je _sub

	mov rax, 60
	mov rdi, 0
	syscall

_print_res:
	mov rax, 1
	mov rdi, 1
	mov rsi, [res]
	mov rdx, 16
	syscall
	ret

_add:
	mov rax, first_num
	mov rbx, second_num
	add rax, rbx
	mov res, rax
	call _print_res
	syscall
	ret

_sub:
	mov rax, first_num
	mov rbx, second_num
	sub rax, rbx
	mov res, rax
	call _print_res
	syscall
	ret

_ask_first_num:
	mov rax, 1
	mov rdi, 1
	mov rsi, ask_first_num
	mov rdx, first_num_len
	syscall
	ret

_get_first_num:
	mov rax, 0
	mov rdi, 0
	mov rsi, first_num
	mov rdx, 16
	syscall
	ret

_ask_second_num:
	mov rax, 1
	mov rdi, 1
	mov rsi, ask_second_num
	mov rdx, second_num_len
	syscall
	ret

_get_second_num:
	mov rax, 0
	mov rdi, 0
	mov rsi, second_num
	mov rdx, 16
	syscall
	ret

_ask_operand:
	mov rax, 1
	mov rdi, 1
	mov rsi, ask_operation
	mov rdx, op_len
	syscall
	ret

_get_operand:
	mov rax, 0
	mov rdi, 0
	mov rsi, operation
	mov rdx, 16
	syscall
	ret
