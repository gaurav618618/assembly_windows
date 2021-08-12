; Program to add 2 number
format PE console
entry start

include 'win32a.inc'
;----------------------------------------------
MAX_INPUT_SIZE = 12
;===================================
section	'.data' data readable writeable
		my_str	db	'Please Enter a number:',0
		ssize	db  'The next number is %u, Such a nice number..'
				db	13,10,0

;===================================
section '.bss' readable writeable
		input_handle	dd	?
		bytes_read		dd  ?
		number 			dd  ?
		
		input_str		dd	MAX_INPUT_SIZE+1 dup (?)

section '.text' code readable executable
;====================================
start:
		;obtaining input handle
		invoke	GetStdHandle,STD_INPUT_HANDLE
		mov 	dword  [input_handle],eax
		
		;print 'Enter a number'
		cinvoke printf,my_str
		
		;Read a line from console
		invoke  ReadFile,[input_handle],input_str,MAX_INPUT_SIZE,bytes_read,0
		
		;Add a zero terminator:
		mov		edi,input_str
		add		edi,MAX_INPUT_SIZE
		mov		byte [edi],0
		
		
		;Convert string to number
		cinvoke strtoul,input_str,0,10   
		
		;keep the resulting number:
		mov		dword [number],eax
		
		;increase number by 1:
		inc 	dword [number]
		
		;Print the new number to the user
		cinvoke	 printf,ssize,[number]
		
		;exit
		push   	0
		call   	[ExitProcess]
;====================================

section '.idata' import data readable

library kernel32,'kernel32.dll',\
		msvcrt,'msvcrt.dll' ;Microsoft visual c runtime library(used in creating c programs)

import 	kernel32,\
		ExitProcess,'ExitProcess',\
		GetStdHandle,'GetStdHandle',\
		ReadFile,'ReadFile'
		
import  msvcrt,\
		printf,'printf',\
		strtoul,'strtoul'
		
		

