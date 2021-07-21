; Program to add 2 number
format PE console
entry start

include 'win32a.inc'


; Data section:
;----------------------------------------------

section '.data' data readable writable
	; 5 dwords initialized as 0
	arr6	dd 6 dup (12345678h) 

;----------------------------------------------
section '.text' code readable executable
start:
		mov     eax,arr6      ;arr6 is just a lable address to which arr6 label points will be moved  "arr6->204001" 
        call 	print_eax
		xor		eax,eax
		mov 	eax, [arr6]    ; content of the address to which arr6 label points will be moved     "arr6->204001->12345678h"
		call  	print_eax
		
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'