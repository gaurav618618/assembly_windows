; Program to add 2 number
format PE console
entry start

include 'win32a.inc'
;----------------------------------------------
MAX_INPUT_SIZE = 12
;===================================
section	'.data' data readable writeable
		my_str	db	'Todays date is %d/%d/%d,',13,10  ;13,10 are new line characters
		     	db  'Have a great day!'
				db	13,10,0

;===================================
section '.bss' readable writeable
		systime		SYSTEMTIME  ?   ;this is a systemtime structure which will get filled by GetSystemTime FUNCTION

section '.text' code readable executable
;====================================
start:
		;Get the system time into the systime structure
		push 	systime
		call	[GetSystemTime]
		
		
		;print the date
		movzx	eax,word [systime.wYear]
		push 	eax
		movzx	eax,word [systime.wMonth]
		push 	eax
		movzx	eax,word [systime.wDay]
		push 	eax
		push	my_str
		call	[printf]
		add		esp,4*4
		;exit
		push   	0
		call   	[ExitProcess]
;====================================

section '.idata' import data readable

library kernel32,'kernel32.dll',\
		msvcrt,'msvcrt.dll' ;Microsoft visual c runtime library(used in creating c programs)

import 	kernel32,\
		ExitProcess,'ExitProcess',\
		GetSystemTime,'GetSystemTime'
		
import  msvcrt,\
		printf,'printf'
		
		

