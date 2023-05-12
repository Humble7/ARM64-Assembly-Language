//
// Assembler program to print "Hello ASM!"
// to sddout.
// 
// x0-x2 - parameters to Unix system calls
// x16 - Mach System Call function number
//

.global _start  // Provide program starting address to linker
.align 2

// Setup the parameters to print hello asm
// and then call Kernel to do it.
_start:
    mov x0, #1  // stdout
    adr x1, helloasm  // string to print
    mov x2, #11  // length of string
    mov x16, #4  // Unix write system call
    svc #0x80  // Call Kernel to output the string

// Setup the parameters to exit the program
// and then call the kernel to do it.
    mov x0, #0  // Use 0 return code.
    mov x16, #1  // System call number 1 terminates this program
    svc #0x80  // Call Kernel to terminate the program

helloasm:
    .ascii "Hello ASM!\n"
