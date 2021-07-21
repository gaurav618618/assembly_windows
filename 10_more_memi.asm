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
		mov     esi,arr6       ;arr6 is just a lable address to which arr6 label points will be moved  "arr6->204001" 
        mov     word[esi],1    ;assembler can sometime guess the size of the operand but not always so it is important to give size such as dword,qword,word,byte
		mov		word[esi+4], 2
		mov		word[esi+8], 3
		mov     eax, [esi] 
		call	print_eax       
		mov     eax, [esi+4]    ;instead of adding esi again and again we can use adrerssing like this also which does not affect esi
		call	print_eax  
		mov     eax, [esi+8] 
		call	print_eax  
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'