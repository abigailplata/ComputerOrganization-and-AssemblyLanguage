	.file	1 "arrcopy.c"
	.globl	source
	.data
	.align	2
source:
	.word	3
	.word	1
	.word	4
	.word	1
	.word	5
	.word	9
	.word	0
	.rdata
	.align	2
$LC0:
	.ascii	"%d values copied\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, extra= 0
	.mask	0x80000000,-8
	.fmask	0x00000000,0
	subu	$sp,$sp,24
	sw	$31,16($sp)
	jal	__main
	la	$9,source	// $9 = address of source
	lw	$2,0($9)
	move	$8,$0		// x = 0
	beq	$2,$0,$L8
	move	$7,$0		// y = 0
	la	$10,dest	// $10 = address of dest
$L6:
	addu	$8,$8,1 	// x = x + 1
	sll	$3,$8,2 	// z = x * 4
	addu	$5,$7,$9	// ptr1 = add_source + y
	addu	$2,$3,$9	// ptr2 = add_source + z
	addu	$6,$7,$10	// ptr3 = add_dest + y
	lw	$4,0($2)	// s_next = source[ptr2]
	move	$7,$3		// y = z
	lw	$3,0($5)	// s_this = source[ptr]
	#nop
	sw	$3,0($6)	// dest[ptr3] = s_this = source
	bne	$4,$0,$L6	// if s_next == 0 break;
				// else continue loop
$L8:
	la	$4,$LC0
	move	$5,$8
	jal	printf
	lw	$31,16($sp)
	move	$2,$0
	addu	$sp,$sp,24
	j	$31
	.end	main

	.comm	dest,40
