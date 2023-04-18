mov ah, 0x0e
jmp PrintX

; ======================

PrintX:

mov al, 'X'
int 0x10

jmp $

; ======================

PrintAZ: 

mov al, 65
int 0x10

loop:
  inc al
  cmp al, 'Z' + 1
  je $
  int 0x10
  jmp loop

; ======================

PrintYOrN:

mov bx, 1
cmp bx, 2
je itsTrue
jne itsFalse
jmp $

itsTrue:

  mov al, 'Y'
  int 0x10
  jmp $

itsFalse:

  mov al, 'N'
  int 0x10
  jmp $

; ======================

; Required Code:

times 510-($-$$) db 0
db 0x55, 0xaa
