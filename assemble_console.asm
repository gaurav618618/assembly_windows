
format PE console
entry start

include 'win32a.inc'

section '.text' code readable executable

start:
      
	  inc eax
	  inc eax
	  dec eax
	  inc eax
	  
	  push 0
	  call [ExitProcess]
	  
section '.idata' import data readable

library kernel,'kernel32.dll'

import kernel,\
       ExitProcess,'ExitProcess'