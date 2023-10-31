section .data
	ask db "What is your name? "
	greet db "Hello, "

section .bss
	name resb 16

section .text
	global _start

_start:
	call _askname
	call _getname	
	call _greet
	call _printname

	mov rax, 60
	mov rdi, 0
	syscall

_printname:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_askname:
	mov rax, 1
	mov rdi, 1
	mov rsi, ask
	mov rdx, 19
	syscall
	ret

_getname:
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_greet:
	mov rax, 1
	mov rdi, 1
	mov rsi, greet
	mov rdx, 7
	syscall
	ret
