.global _start

.text

_start:
    // Exit with exit code 7
    mov x0, #0x07
    mov w8, #0x5d // 0x5d is exit syscall
    svc #0
