section .data:
	text0 db "Hello ", 10 ;10 is the newline character
	text1 db "World!", 10
section .text:
	global _start
_start:
	call _hello
	mov rax, 1 	;rax holds the value of 1, the sys_write ID
	mov rdi, 1 	;std_out
	mov rsi, text0	;out text
	mov rdx, 7 	;length of text
	syscall

	mov rax, 60 	;sys_exit
	mov rdi, 0	;exit with no errors
	syscall

_hello:
	mov rax, 1 	;rax holds the value of 1, the sys_write ID
	mov rdi, 1 	;std_out
	mov rsi, text1	;out text
	mov rdx, 7 	;length of text
	syscall

	ret
