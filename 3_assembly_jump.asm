; Program to add 2 number
format PE console
entry start

include 'win32a.inc'

; =============================================
section '.text' code readable executable

start:
      
	  xor    eax,eax
	  call   read_hex
	  mov    ecx,10
label_1:
       call  print_eax
	   inc   eax
	   dec   ecx
       cmp   ecx,0
	   jnz   label_1
	  ;Exit the process
	  push   0
	  call   [ExitProcess]

include 'training.inc'