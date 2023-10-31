section .data
	text0 db "What is the first number? ", 0xa
	text0_len equ $-text0
	text1 db "What is the second number? "
	text1_len equ $-text1
	ssnum db 0

section .bss
	fnum resb 16
	snum resb 16

section .text:
	global _start
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, text0
	mov rdx, text0_len
	syscall

	mov rax, 3
	mov rbx, 10
	add rax, rbx
	mov [ssnum], rax
	mov rax, 1
	mov rdi, 1
	mov rsi, ssnum
	mov rdx, 16
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

