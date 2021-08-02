; Program to add 2 number
format PE console
entry start

include 'win32a.inc'

struct PNT
	x dd ?
	y dd ?
ends


; Data section:
;----------------------------------------------

section '.data' data readable writable
		my_pnt	PNT		3,4

;----------------------------------------------
section '.text' code readable executable
start:
		mov     eax,[my_pnt.y]
		call 	print_eax
		
		mov     eax,[my_pnt + PNT.y] ;PNT.y is offsset of y which is 4
		call 	print_eax
		
		mov     eax,[my_pnt+4]
		call 	print_eax
		
		push   0
		call   [ExitProcess]

include 'training.inc'