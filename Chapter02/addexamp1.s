// 
// Example of the ADD/MOVN instructions.
//
.global _start
.align 2

// Multiply 2 by -1 by using MOVN and then adding 1
_start: movn	w0, #2
	add 	w0, w0, #1


// Setup the parameters to exit the program
// and then call the kernel to do it.
// w0 is the return code and will be what we
// calculated above.
	mov	x16, #1  // System call number 1 terminates this program
	svc	#0x80  // Call kernel to terminate the program
