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

		push  	[arr6]            
		call    $+5                
		pop     ebp                
		pop 	edx                
		mov 	eax,edx
		call 	print_eax
		
		
		
		;exit process
exit:
		push   0
		call   [ExitProcess]

include 'training.inc'