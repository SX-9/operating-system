[org 0x7c00]

mov ah, 0x0e
mov bx, var 

print:
  mov al, [bx]
  cmp al, 0
  je keyboard
  int 0x10
  inc bx
  jmp print

keyboard:
  mov ah, 0
  int 0x16
  cmp al, '~'
  je reboot
  mov ah, 0x0e
  int 0x10
  jmp keyboard

reboot:
  mov ax, 0x1000
  int 0x19

var: 
  db "Hello World!", 10, ">> ", 0

times 510-($-$$) db 0
db 0x55, 0xaa