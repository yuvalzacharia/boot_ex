	BITS 16

start:
	mov ax, 07C0h		; reserve 4K space start from 07c0h
	add ax, 288		; (4096 + 512) / 16 bytes per paragraph
	mov ss, ax
	mov sp, 4096
	
	int 60h	
	mov ax, 07C0h		; set data segment to 07c0h
	mov ds, ax


	mov si, text_string	; Put string position into SIs
	call print_string	;

	jmp $			; loop


	text_string db 'this is my bootable!', 0

print_string:			; Routine: output string in SI to screen
	mov ah, 0Eh		; int 10h 'print char' function

.repeat:
	lodsb			; load string byte
	cmp al, 0
	je .done		; if char equals zero, end of string
	int 10h			; if not, print it
	jmp .repeat

.done:
	ret


	times 510-($-$$) db 0	; padding
	dw 0xaa55		; boot sector signature



  
