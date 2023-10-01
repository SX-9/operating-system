[org 0x7c00]
jmp PrintClear

; ======================

PrintX:

  mov ah, 0x0e
  mov al, 'X'
  int 0x10

  jmp $

; ======================

PrintAToZ: 

  mov ah, 0x0e
  mov al, 65
  int 0x10

  loopA:
    inc al
    cmp al, 'Z' + 1
    je $
    int 0x10
    jmp loopA

; ======================

PrintYOrN:

  mov ah, 0x0e
  mov bx, 1
  cmp bx, 2
  je itsTrue
  jne itsFalse

  itsTrue:
    mov al, 'Y'
    int 0x10
    jmp $

  itsFalse:
    mov al, 'N'
    int 0x10
    jmp $

; ======================

PrintStr:

  mov ah, 0x0e
  mov bx, var

  print:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print

  end: jmp $

  var: db "Text Here", 0

; ======================

PrintClear:

  mov ah, 0x00
  mov al, 0x03
  int 0x10

  mov ah, 0x06
  mov al, 0x00
  mov bh, 0x07
  mov cx, 0x00
  mov dx, 0x184f
  int 0x10

  jmp $

; ======================

times 510-($-$$) db 0
db 0x55, 0xaa
