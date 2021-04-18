.global _start

.text

_start:
    mov x8, #0x40   // write syscall
    mov x0, #0x01   // stdout
    ldr x1, =message
    mov x2, #13     // length of message
    svc 0

    mov x8, #0x5d   // exit syscall
    mov x0, #0x00
    svc 0

.data
    message: .ascii "Hello world!\n"
