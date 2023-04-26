.data
	array: .word 2, 3, 4, 5, 6
	N: .word 5
	newspace: .asciiz ", "
.text
.globl main
main:
	# Khoi tao ban dau
	la $t0, array # Load array address
	li $t1, 0 # i=0
	lw $t2, N # size of array
	
	#Step1:Loop to read items from array to stack
	pushLoop:
	lw $t4, ($t0) # get array[i]
	subu $sp, $sp, 4 # $sp: stack pointer register
	sw $t4, ($sp) # push to stack
	add $t1, $t1, 1 # i=i+1
	add $t0, $t0, 4 # update array address
	blt $t1, $t2, pushLoop
	
	# Khoi tao ban dau
	la $t0, array # Load array address
	li $t1, 0 # i=0
	lw $t2, N # size of array
	
	#Step2:Loop to pop items from stack to array
	popLoop:
	lw $t4, ($sp) # Get value from stack to t4
	addu $sp, $sp, 4 # Tang stack

	sw $t4, ($t0) # Store to array
	add $t1, $t1, 1 # i=i+1
	add $t0, $t0,4 # Update array address
	blt $t1, $t2, popLoop
	
	#Step3: print reverse array
	la $t0, array # Load array address
	li $t1, 0 # i=0
	lw $t2, N # size of array
	printLoop:
	li $v0, 1
	lw $a0, ($t0)
	syscall
	
	#print ", "
	li $v0,4
	la $a0, newspace
	syscall
	addi $t1, $t1, 1 # i=i+1
	addi $t0, $t0, 4 # tang dia chi array
	bne $t1, $t2, printLoop
	
	#exit:
	li $v0, 10
	syscall
	.end main