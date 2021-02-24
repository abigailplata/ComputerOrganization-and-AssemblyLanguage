
	.text

main:
	li $a0, 0 	#printing out 0
	jal putDec 	#call putDec
	li $a0, '\n' 	#print new line
	li $v0, 11 	#telling the OS what to do
	syscall  	#systemcall

	li $a0, 1 	#printing out 1
	jal putDec 	
	li $v0, 11 	
	syscall 	
	
	li $a0, 196	#printing out 196
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, -1	#printing out -1
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, -452	#printing out -452
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $a0, 2	#printing out 2
	jal mystery
	move $a0, $v0
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall

	li $a0, 3	#printing out 3
	jal mystery
	move $a0, $v0
	jal putDec
	li $a0, '\n'
	li $v0, 11
	syscall

	li 	$v0, 10		# terminate program
	syscall

putDec: 
	li $s1, 10
	bne $a0, 0, checker
	
	jr	$ra		# returnv
checker: 
	slt $t0, $a0, 0
	beq $t0, 0, loop 
	
loop:
	beq $a0, $0, done
	addi $sp, $sp, -8
	sll $ra, 0($sp)
	remu $t1, $a0, $s1
	divu $a0, $a0, $s1
	addi $t1, $t1, 48
	sb $t1, 4($sp)
	jal loop
	lw $ra 0($sp)
	lb $t1, 4($sp)
	move $a0, $t1
	li $v0, 11
	syscall
	addi $sp, $sp, 8
	jr $ra
	
mystery: bne $0, $a0, recur 	# if(0 != v){ recur(); }
 	li $v0, 0 		#$v0=0 
 	jr $ra 			#return v;
 	
 recur: sub $sp, $sp, 8 	# $sp=$sp-8
 	sw $ra, 4($sp) 	#(store word) $ra = Memory[$sp + 4]
 	sub $a0, $a0, 1 	#$a0=$a0-1
 	jal mystery 		#mystery();
 	
 	sw $v0, 0($sp) 	# $v0 = Memory[$sp+0]
 	jal mystery 		#mystery();
 	
 	lw $t0, 0($sp) 	# $t0 = Memory[$sp+0]
 	addu $v0, $v0, $t0 	#(add unsigned) $v0 = $v0 + $t0
 	addu $v0, $v0, 1 	#$v0 = $v0 + 1
 	add $a0, $a0, 1 	#$a0 = $a0 +1
 	lw $ra, 4($sp) 	#$ra = Memory[$sp + 4]
 	add $sp, $sp, 8 	#$sp = $sp + 8
 	jr $ra 			#return v
