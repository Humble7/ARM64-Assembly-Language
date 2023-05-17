//
// Examples of the MOV instruction
//
.global _start  // Provide program starting address to linker
.align 2

// Load x2 with 0x1234FEDC4F5D6E3A first using MOV and MOVK
_start: mov	x2, #0x6E3A
	movk	x2, #0x4F5D, lsl #16
	movk	x2, #0xFEDC, lsl #32
	movk	x2, #0x1234, lsl #48

// Just move W2 into W1
	mov	w1, w2

// Now lets see all the shift versions of MOV
// This does not appear to work with the clang assembler
//	mov	x1, x2, lsl #1  // Logical shift left
//	mov	x1, x2, lsr #1  // Logical shift right
//	mov	x1, x2, asr #1  // Arithmetic shift right
//	mov	x1, x2, ror #1  // Rotate right

// Repeat the above shifts using the Assembler mnemonics.
	lsl	x1, x2, #1  // Logical shift left
	lsr	x1, x2, #1  // Logical shift right
	asr	x1, x2, #1  // Arithmetic shift right
	ror	x1, x2, #1  // Rotate right
	
// Example that works with 8 bit immediate and shift
	mov	x1, #0xAB000000  // Too big for #imm16


// Example that can't be represented and results in an error
// Uncomment the instruction if you want to seee the error
//	mov 	x1, #0xABCDEF11  // Too big for #imm16 and can't be represented.

// Example of MVN
	movn	w1, #45

// Example of a MOV that the Assembler will change to MVN
	mov	w1, #0xFFFFFFFE  // (-2)

// Setup the parameters to exit the program
// and then call the kernel to do it.
	mov	x0, #0  // Use 0 return code
	mov	x16, #1  // System call number 1 terminates this program
	SVC	#0x80  // Call kernel to terminate the program
