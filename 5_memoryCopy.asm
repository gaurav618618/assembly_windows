; Program to add 2 number
format PE console
entry start

include 'win32a.inc'

; Data section:
;----------------------------------------------

section '.data' data readable writable
	; 5 dwords initialized as 0
	nums	dd 5 dup (0)

;----------------------------------------------
section '.text' code readable executable

start:
      
		pusha                                                
        pushf                                                
        push       ebp                                        
        mov        ebp,esp
        sub        esp,0x20                                
        xor        eax,eax                                                   
        not        eax                                           
        dec        eax                                         
        xchg       ebx,eax
        xchg       ebx,eax
        push       eax                  
        inc        eax                                                
        inc        eax                                                                
        sub        eax,0x10   
        sub        dword [esp], 0xA      
        pop        eax                                
        not        eax		
		call       print_eax
        Add        esp,0x20                
        pop        ebp                                                
        popf
        popa
		;exit process
		push   0
		call   [ExitProcess]

include 'training.inc'