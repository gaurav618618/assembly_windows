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
		;calculate length of the string
		push	STD_INPUT_HANDLE
		call	[GetStdHandle]
		mov 	dword  [input_handle],eax
		
		;print 'Enter a number'
		push	my_str
		call 	[printf]
		add		esp,4
		
		;Read a line from console
		
		push 	0
		push	bytes_read
		push	MAX_INPUT_SIZE
		push 	input_str
		push	dword [input_handle]
		call	[ReadFile]
		
		;Add a zero terminator:
		mov		edi,input_str
		add		edi,MAX_INPUT_SIZE
		mov		byte [edi],0
		
		
		;Convert string to number
		push	10
		push 	0
		push	input_str
		call	[strtoul]     
		add 	esp,4*3     
		
		;keep the resulting number:
		mov		dword [number],eax
		
		;increase number by 1:
		inc 	dword [number]
		
		;Print the new number to the user
		push  	dword [number]
		push	ssize
		call	[printf]
		add		esp,4*2
		
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
		
		

