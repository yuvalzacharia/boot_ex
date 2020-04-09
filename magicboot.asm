    BITS 16
    
start:
    mov ax, 0
    mov ds, ax
    mov es, ax
    sti
    mov si, 7C00h
    mov di, 600h
    mov cx, 200h
    rep movsb
    ;jmp far ptr 600h
    jmp ptr 600h
    int 59h
    
 .done:
   ret
    
   	times 510-($-$$) db 0	; padding
	dw 0xAA55		; boot sector signature
