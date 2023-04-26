# Chuong trình: Vi?t ch??ng trình con tìm s? min ho?c max c?a 2 s? x, y
# (v?i x, y nh?p t? bàn phím)

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 3/1/2023
# Version: 1.0

.data
msg: .asciiz "Nhap 2 so nguyen de tim max min: \n"
ptint_max: .asciiz "\n Max la: "
ptint_min: .asciiz "\n Min la: "
answer: .word 0
.text
.globl main
main:
	# THong bao chuong trinh
	li $v0, 4
	la $a0, msg
	syscall
	
	# Nhap so nguyen thu nhat
	li $v0, 5
	syscall 
	move $t1, $v0 
	
	# Nhap so nguyen thu hai
	li $v0, 5 
	syscall 
	move $t2, $v0 

	# g?i CTC Max
	jal max
	
	#thoát
	li $v0,10
	syscall
	.end main

	
# ch??ng trình con max
.globl max
max:
	bgt $t1, $t2, p_max  # x > y
	
	# truong hop y > x
	
	# THong bao max
	li $v0, 4
	la $a0, ptint_max
	syscall
	
	#print a interger
	li $v0, 1 
	move $a0, $t2  # print y
	syscall 
	
	# THong bao min
	li $v0, 4
	la $a0, ptint_min
	syscall
	
	#print a interger
	li $v0, 1 
	move $a0, $t1	# print x
	syscall 
	jr $ra
		
p_max: 
	# truong hop x > y
	
	# THong bao max
	li $v0, 4
	la $a0, ptint_max
	syscall
	
	#print a interger
	li $v0, 1 
	move $a0, $t1	# print x
	syscall 
	
	# THong bao min
	li $v0, 4
	la $a0, ptint_min
	syscall
	
	#print a interger
	li $v0, 1 
	move $a0, $t2  # print y
	syscall 
	
	jr $ra
.end max