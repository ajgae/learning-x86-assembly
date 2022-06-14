;;; for (int i = 0; i < 5; ++i) {
;;;   printf("%d", i);
;;; }
;;; eax, ebx, ecx, edx: used for write syscall
;;; edi: i
        
section .data
max: dw 10                      ; c int is 4 bytes (double-word)
        
section .bss
index: resb 2                   ; char to write followed by newline
                                ; TODO how to statically declare the
                                ; newline?

section .text
global _start
_start:
        mov byte [index+1], 0x0a ; add newline
        xor edi, edi            ; int i = 0
startloop:
        cmp edi, [max]
        jnl endloop             ; exit loop if !(i < 5)
        add edi, '0'            ; ASCII considerations
        mov eax, edi            ; use eax to be able to access just
                                ; lower byte of register with al
        mov byte [index], al    ; put char in data section
        mov eax, 0x04           ; write syscall
        mov ebx, 1              ; write to stdout
        mov ecx, index          ; write what is at index
        mov edx, 2              ; write op2 bytes
        int 0x80                ; invoke syscall
        sub edi, '0'            ; restore value
        add edi, 1              ; ++i
        jmp startloop
endloop:
        mov eax, 0x01            ; exit syscall
        mov ebx, 0x00            ; success
        int 0x80
        
