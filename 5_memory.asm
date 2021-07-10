; Program to add 2 number
format PE console
entry start

include 'win32a.inc'

; Data section:
;----------------------------------------------

section '.data' data readable writable
	; 5 dwords initialized as 0
	nums	dd 5 dup (0)

;----------------------------------------------
section '.text' code readable executable

start:
      
		mov	ecx,5
; Read 5 numbers
read_a_number:
		dec		ecx
		call	read_hex
		mov		esi,ecx
		; calculate adress of dwords present in data section
		shl		esi,2
		add		esi,nums
		;[esi] is treat value in esi as adress
		mov		dword [esi],eax
		test	ecx,ecx
		jnz		read_a_number
		
		mov		edi,5
		mov		ecx,0
		
; Print all numbers in reverse order
print_a_number:
		mov 	esi,ecx
		
		shl		esi,2
		add		esi,nums
		
		mov		eax,dword [esi]
		call 	print_eax
		inc 	ecx
		cmp		ecx,edi
		jnz		print_a_number
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'