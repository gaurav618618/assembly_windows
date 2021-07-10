; Program to add 2 number
format PE console
entry start

include 'win32a.inc'


; Data section:
;----------------------------------------------

section '.data' data readable writable
	; 5 dwords initialized as 0
	arr6	dd 6 dup (12345678h) 

;BSS Section which resides unitialised data	
;----------------------------------------------
section '.bss' readable writeable ; ("Better Save Space")
	;uninitialized data:
	num1	dd	?
	arr8	dd	8 dup (?)

;----------------------------------------------
section '.text' code readable executable
	    mov		eax,100h
		mov		ecx,5
		mov		edx,2

start:
		add 	eax,5
		movzx   ebx,dl
		sub		eax,ebx
		rol		edx,2
		inc 	eax
		dec		ecx
		jnz		start
        call 	print_eax
		
		
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'