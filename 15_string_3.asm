; Program to add 2 number
format PE console
entry start

include 'win32a.inc'


; Data section:
;----------------------------------------------

section '.data' data readable writable
		src_arr  	db 	10 dup(0abh)
		dest_arr	db  10 dup(?)
		str1		db	'first string',0
		str2		db	'i',0

;----------------------------------------------
section '.text' code readable executable
start:
		mov		esi,src_arr
		mov		edi,dest_arr
		mov		ecx,10
		
		rep		movsb					;move content of esi into edi and increase both of them ecx times
		
		mov		eax,dword [dest_arr]
		call 	print_eax
		
compare_string:
		mov		edi,str1
		mov		al,byte [str2]
		mov		ecx,13
	next_char:
			jecxz	finish
			dec 	ecx
			scasb                        ; this instruction compare edi with al and sets flag accordingly
			jnz		next_char			 ; instead of doing loop manually we can just use repnz scasb which can replace whole next_char
		
	    mov 	eax,ecx
		call 	print_eax
finish:	
		push   0
		call   [ExitProcess]

include 'training.inc'