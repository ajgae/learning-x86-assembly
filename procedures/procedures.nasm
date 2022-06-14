;;; _start calls hello passing a char argument on the stack, which hello writes

section .data
msg: db "Hello, world!", 0x0a, 0x00

section .bss

section .text
global _start
_start:
        push msg ; push pointer to msg onto the stack as an argument to hello
        call hello              ; pushes contents of EIP on stack and jumps to hello

        mov eax, 0x01           ; setup exit syscall
        mov ebx, 0              ; success return value
        int 0x80                ; invoke exit syscall

hello:
        push ebp                ; save caller's stack-frame base pointer
        mov ebp, esp            ; set stack-frame base pointer for this procedure

        mov edi, [ebp+8]        ; call strlen with pointer edb+8 (! argument contains the address, not a pointer to the address, so don't lea!)
        push edi
        call strlen
        mov edi, eax            ; save return value in edi

        mov eax, 0x04           ; setup write syscall
        mov ebx, 1              ; write to stdout
        mov ecx, [ebp+8]        ; write what's at this address
        mov edx, edi            ; write number of characters returned by strlen
        int 0x80                ; invoke write syscall

        mov esp, ebp            ; restore stack pointer before returning (only necessary if local variables were allocated <=> esp was decreased further (which it was))
        pop ebp                 ; restore caller's stack frame base pointer
        retn                    ; near-return from procedure

;;; eax contains return value. Uses edi to iterate over bytes
strlen:                         ; 1 argument: pointer to string
        push ebp                ; save caller's stack frame base pointer
        mov ebp, esp            ; set stack-frame base pointer for this procedure

        mov edi, [ebp+8] ; ! argument contains the address, not a pointer to the address, so don't lea! 
        xor eax, eax            ; init return value to 0
.loop:
        cmp byte [edi], 0x00
        je .endloop
        lea edi, [edi+1]        ; increment pointer
        add eax, 1              ; increment return value
        jmp .loop
.endloop:
        mov esp, ebp            ; restore stack pointer
        pop ebp                 ; restore stack frame base pointer
        retn
        
