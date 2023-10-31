section .data:
	text db "Hello World!", 10 ;10 is the newline character
section .text:
	global _start
_start:
	mov rax, 1 	;rax holds the value of 1, the sys_write ID
	mov rdi, 1 	;std_out
	mov rsi, text	;out text
	mov rdx, 13 	;length of text
	syscall

	jmp _t
_t:
	mov rax, 1 	;rax holds the value of 1, the sys_write ID
	mov rdi, 1 	;std_out
	mov rsi, text	;out text
	mov rdx, 13 	;length of text
	syscall

	mov rax, 60 	;sys_exit
	mov rdi, 0	;exit with no errors
	syscall


