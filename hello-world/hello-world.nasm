section .data
msg:    db "Hello, world!", 0x0a ; define byte, 0xa is '\n'
msg_len: equ $ - msg          ; $ is current address

global _start                   ; declare symbol _start as global hence visible to linker
section .text
_start:
        mov eax, 0x04           ; "write" syscall
        mov ebx, 1              ; use stdout as the file descriptor
        mov ecx, msg            ; use msg as the buffer
        mov edx, msg_len        ; use msg_len as the length
        int 0x80                ; software interrupt: invoke the syscall in eax
        
        mov eax, 0x01           ; "exit" syscall
        mov ebx, 0              ; return value of "exit" syscall (0 means success)
        int 0x80                ; invoke "exit" syscall
        
