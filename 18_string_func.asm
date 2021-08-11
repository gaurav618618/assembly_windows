; Program to add 2 number
format PE console
entry start

include 'win32a.inc'
;----------------------------------------------
MAX_INPUT_SIZE = 20H
;===================================
section	'.data' data readable writeable
		my_str	db	'I am just a small string',0
		ssize	db  'The length of my_str is %d characters.',13,10
				db	'Its first character is: %c.',13,10,0

;===================================


section '.text' code readable executable
;====================================
start:
		;calculate length of the string
		push	my_str
		call	[strlen]
		add		esp,4
		
		
		
		;Get the first byte of my_str
		movzx   edx,byte [my_str]
		
		
		;print summary to user
		push	edx
		push 	eax
		push	ssize
		call	[printf]     ; printf can take as many args as format specifiers
		add 	esp,4*3     ;since printf uses cdecl calling convention we have empty the stack 
		
		;exit
		push   	0
		call   	[ExitProcess]
;====================================

section '.idata' import data readable

library kernel32,'kernel32.dll',\
		msvcrt,'msvcrt.dll' ;Microsoft visual c runtime library(used in creating c programs)

import 	kernel32,\
		ExitProcess,'ExitProcess'
import  msvcrt,\
		strlen,'strlen',\
		printf,'printf'
		
		

