; Program to add 2 number
format PE console
entry start

include 'win32a.inc'


; Data section:
;----------------------------------------------

section '.data' data readable writable
		str1  	db 	'hello world',0

;----------------------------------------------
section '.text' code readable executable
start:
		mov 	eax,edi
		call 	print_eax
		mov     al,1fh
		cld
		stosb
		mov 	eax,edi
		call 	print_eax
	
		mov 	eax,edi
		call 	print_eax
		
		
		
		push   0
		call   [ExitProcess]

include 'training.inc'