; Program to add 2 number
format PE console
entry start

include 'win32a.inc'


; Data section:
;----------------------------------------------

section '.data' data readable writable
		my_arr  	db 	10 dup(10)

;----------------------------------------------
section '.text' code readable executable
start:
		mov		edi,my_arr
		mov		ecx,10
		xor 	al,al
		jecxz   finish
next_element:
		stosb                           ;stores the content(byte) of al into edi here initializing each value of array as zero
		loop	next_element            
		
print_array_elm:		
		mov		eax,dword [my_arr]
		call	print_eax
		
		
next_elem_mod:
		rep 	stosb                    ; rep repeats the string instruction ecx times

print_narray_elm:		
		mov		eax,dword [my_arr]
		call	print_eax
finish:	
		push   0
		call   [ExitProcess]

include 'training.inc'