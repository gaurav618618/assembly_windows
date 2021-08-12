; Program to add 2 number
format PE GUI 4.0
entry start

include 'win32a.inc'
;----------------------------------------------
MAX_INPUT_SIZE = 12
;===================================
section	'.data' data readable writeable
		welcome_body	db	'Welcome to this program',0
		welcome_title	db	'Important Message',0
		
		question_body	db	'Do you like Monkeys',0
		question_title	db	'Question',0
		
		answer_yes_body	 db	'Hurray now get me some bananas',0
		answer_yes_title db	'Yass',0
		
		answer_no_body	db	'So bad lol...',0
		answer_no_title	db	'Ouuu',0

;===================================

start:
		;Show a welcome message box:
		invoke  MessageBoxA,0,welcome_body,welcome_title,MB_OK or MB_ICONINFORMATION
		
		;Show a question (Yes/No) messagebox
		invoke  MessageBoxA,0,question_body,question_title,MB_YESNO or MB_ICONQUESTION
		
		cmp 	eax,IDYES
		jz		.like_bananas
		
		invoke	MessageBoxA,0,answer_no_body,answer_no_title,MB_OK or MB_ICONHAND
		jmp 	.exit
.like_bananas:
		invoke  MessageBoxA,0,answer_yes_body,answer_yes_title,MB_OK or MB_ICONEXCLAMATION
		
.exit:
		push   	0
		call   	[ExitProcess]
;====================================

section '.idata' import data readable

library kernel32,'kernel32.dll',\
		user32,'user32.dll' 

import 	kernel32,\
		ExitProcess,'ExitProcess'
		
import  user32,\
		MessageBoxA,'MessageBoxA'
		
		

