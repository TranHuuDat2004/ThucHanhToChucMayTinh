#chuong trinh: nhap vao mot mang co N so nguyen, tinh tong cac so chan/le trong mang

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 27/12/2022
# Version: 1.0
.data 
	mang: .word 0:100
	msg: .asciiz "Nhap N : "
	msgXuat1: .asciiz "Tong so chan trong mang: "
	msgXuat2: .asciiz "Tong so le trong mang:  "
	xuongdong: .asciiz "\n"
	space: .asciiz " \n"
	
.text
.globl main
main:
	li $v0, 4
	la $a0, msg
	syscall
	
	#nhap so N
	li $v0, 5
	syscall
	move $s2, $v0 #N = 0
	
	#khoi tao mang ban dau
	la $s0, mang
	li $s1, 0 #i = 0
	
	li $t2, 2 
	li $t3, 0 #chan
	li $t4, 0 #le
	#nhap mang
	Nhapmang:
		#get a integer number
		li $v0, 5
		syscall
		sw $v0, ($s0) #store value to address of array
		
		#check
		rem $t1, $v0, 2 #$t1 = chia 
		beq $t1, 0, chan
		add $t4, $t4, $v0			#le
		j Next
	chan:	
		add $t3, $t3, $v0
		
	Next:
		
		addi $s1, $s1, 1 #i = i + 1
		addi $s0, $s0, 4  #tang 1 byte ky tu tiep theo
		bne $s1, $s2, Nhapmang
	#tong cac phan tu va trungbinh cong
	#xet tung phan tu trong mang

exit:	

	#xuat chan 
	li $v0, 4
	la $a0, msgXuat1
	syscall
	
	li $v0, 1 
	move $a0, $t3 
	syscall	
	
	#\n
	li $v0, 4
	la $a0, space
	syscall
	
	#xuat le
	
	li $v0, 4
	la $a0, msgXuat2
	syscall
	
	li $v0, 1 
	move $a0, $t4
	syscall	
	
		
	#exit
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
