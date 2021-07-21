; Program to add 2 number
format PE console
entry start

include 'win32a.inc'


; Data section:
;----------------------------------------------

section '.data' data readable writable
	; 5 dwords initialized as 0
	arr1	dd 10h dup (12345678h)
	arr2    dw 10h dup (0ababh)

;----------------------------------------------
section '.text' code readable executable
start:
		mov		esi,arr1
		mov		edi,arr2
		call	read_hex
		mov     ecx,eax
		lea		eax,[esi + 4*ecx]    ;eax will store adress of the element of arr1 which user inputs
		call 	print_eax
		xor 	eax,eax
		lea  	eax,[edi + 2*ecx]    ;eax will store adress of the element of arr2 which user inputs
		call	print_eax
		xor		eax,eax
		;----------------------------------------------------------------------------------
		call	read_hex
		mov     ecx,eax
		mov		eax,[esi + 4*ecx]    ;eax will store value of the element of arr1 which user inputs
		call 	print_eax
		xor 	eax,eax
		mov  	eax,[edi + 2*ecx]    ;eax will store vale of the element of arr2 which user inputs
		call	print_eax
		xor		eax,eax
		; LEA does not chnages the flag register i.e lea ecx,[ecx-1] ,jnz label will not work 
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'