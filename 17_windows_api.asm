; Program to add 2 number
format PE console
entry start

include 'win32a.inc'
;----------------------------------------------
MAX_INPUT_SIZE = 20H
;===================================
section	'.data' data readable writeable
		filename		db	'file.txt',0

;===================================
section '.bss' readable writable
		input_handle   dd  ?
		file_handle    dd  ?
		byte_read      dd  ?
		bytes_written  dd  ?
		
		input_str      db   MAX_INPUT_SIZE dup(?)

section '.text' code readable executable
;====================================
start:
		;obtain input handle
		push	STD_INPUT_HANDLE
		call	[GetStdHandle]
		mov     dword [input_handle],eax
		
		
		
		;Read line from console
		push 	0
		push	byte_read
		push	MAX_INPUT_SIZE
		push 	input_str
		push	dword [input_handle]
		call 	[ReadFile]
		
		;Open a file
		push 	0
		push	FILE_ATTRIBUTE_NORMAL
		push	CREATE_ALWAYS
		push 	0
		push	0
		push	GENERIC_WRITE
		push 	filename
		call 	[CreateFileA]
		mov		dword [file_handle],eax
		
		;Write input into the file:
		push	0
		push	bytes_written
		push	dword [byte_read]
		push	input_str
		push	dword [file_handle]
		call	[WriteFile]
		
		;Close file handle
		push	[file_handle]
		call	[CloseHandle]
		
		;exit
		push   	0
		call   	[ExitProcess]
;====================================

section '.idata' import data readable

library kernel32,'kernel32.dll'

import 	kernel32,\
		GetStdHandle,'GetStdHandle',\
		ReadFile,'ReadFile',\
		WriteFile,'WriteFile',\
		ExitProcess,'ExitProcess',\
		CreateFileA,'CreateFileA',\
		CloseHandle,'CloseHandle'
		

