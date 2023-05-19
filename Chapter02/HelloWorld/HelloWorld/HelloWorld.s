//
//  Assembler program to print "Hello World!"
//  to stdout.
//
//  x0-x2 - paramters to Unix system calls
// x16 - Mach System Call function number
//

.global _start                // Provide program staring address to linker
.align 4                      // Make sure everything is aligned properly

// Setup the parameters to print hello world
// and then call the Kernel to do it.
_start: mov    x0, #1         // 1 = StdOut
        adr    x1, helloworld // string to print
        mov    x2, #13        // length of string
        mov    x16, #4        // Unix write system call
        svc    #0x80          // Call Kernel to output the string

// Setup the parameters to exit the program
// and then call the kernel to do it
        mov    x0, #0         // Use 0 return code
        mov    x16, #1        // System call number 1 terminates the program
        svc    #0x80          // Call kernel to terminate the program

helloworld:    .ascii "Hello World!\n"

