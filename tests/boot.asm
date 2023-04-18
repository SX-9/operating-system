[org 0x7c00]
jmp PrintStr

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

  var: db "Hello World", 0

; ======================

times 510-($-$$) db 0
db 0x55, 0xaa
