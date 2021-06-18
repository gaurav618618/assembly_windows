; Program to add 2 number
format PE console
entry start

include 'win32a.inc'

; =============================================
section '.text' code readable executable

start:
      
	  xor    eax,eax
	  call   read_hex            ;input number
	  neg    eax                 ;2's compliment of a number or -ve
	  call   print_eax
	  xor    ebx,ebx
	  movzx  ebx,al 	         ;moves number with zero extension only
	  mov    eax,ebx
	  call   print_eax
	  xor    ebx,ebx
	  movsx  ebx,al              ;moves number with sign extension
	  mov    eax,ebx
	  call   print_eax
	  xor    eax,eax
	  mov    eax,2
	  xor    ebx,ebx
	  mov    ebx,-8
	  imul   ebx             ;signed multiplication
	  call   print_eax
	  
	  push   0
	  call   [ExitProcess]

include 'training.inc'