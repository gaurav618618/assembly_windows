; Program to add 2 number
format PE console
entry start

include 'win32a.inc'

; =============================================
section '.text' code readable executable

start:
      
	  call   read_hex     ;1st user inpuy
	  mov    edx,eax
	  call   read_hex     ;2nd user input
	  ;add 2 numbers
	  add    eax,edx
	  ;print result
	  call   print_eax
	  ;Exit the process
	  push   0
	  call   [ExitProcess]

include 'training.inc'