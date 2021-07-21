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
		inc     esi
		mov		word[esi], 2
		inc 	esi
		mov		word[esi], 3
		mov     eax,dword [esi] 
		call	print_eax       ; o/p will be 56780003 because we stored value 3 in a word and the other word space of eax is 5678 because we stored 12345678h at the start
		
		
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'