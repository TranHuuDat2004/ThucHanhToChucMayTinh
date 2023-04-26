# Chuong trình: Vi?t ch??ng trình nh?p vào 1 m?ng g?m N s? nguyên b?t k? (N nh?p t? bàn phím),
# xu?t m?ng theo th? t? ng??c l?i.

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 10/1/2023
# Version: 1.0
.data
	array: .word 0
	soluongmang:  .asciiz "So luong mang: "
	mangnhap:  .asciiz "Nhap mang: "
	mangxuat:  .asciiz "Xuat mang: "
	N: .word 5
	newspace: .asciiz ", "
.text
.globl main
main:
	# Thong bao so luong mang
	li $v0, 4
	la $a0, soluongmang
	syscall
	
	# Nhap so luong mang
	li $v0, 5
	move $t3, $v0    # SO luong mang t3
	syscall
	
	# Khoi tao ban dau
	la $t0, array # Load array address
	li $t1, 0 # i=0
	move $t2, $t3 # size of array
	
	# Thong bao nhap mang
	li $v0, 4
	la $a0, mangnhap
	syscall
		
	# Nhap mang
	readLoop: 
		# Get a integer number
		li $v0, 5
		li $a0, $v0
		move $t0, $a0	# move value to dia chi cua array
		syscall	
		addi $t1, $t1, 1 	# i = i +1 
		addi $t0, $t0, 4 	# chuyen toi mang tiep theo
		bne $t1, $t3, readLoop
		
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
