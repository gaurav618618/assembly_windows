; Program to add 2 number
format PE console
entry start

include 'win32a.inc'


; Data section:
;----------------------------------------------

section '.data' data readable writable
	; 5 dwords initialized as 0
	arr6	dd 3 dup (12345678h) 

;----------------------------------------------
section '.text' code readable executable
start:
		mov		eax, 66666667h
		mov 	ecx, 23456
		imul  	ecx
		call  	print_eax
		mov		eax,edx
		call 	print_eax
		
		
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'