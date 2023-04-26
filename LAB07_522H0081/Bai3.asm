# chuong trinh: nhap vao mot mang co N so nguyen,
# xuat ra man hinh so min, max trong mang

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 27/12/2022
# Version: 1.0
.data 
	mang: .word 0:100
	msg: .asciiz "Nhap N : "
	msgXuat1: .asciiz "min: "
	msgXuat2: .asciiz "max: "
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
	
	li $t0, 1000 # $t0 = min = 0
	li $t1, -1000
	#nhap mang
	Nhapmang:
		#get a integer number
		li $v0, 5
		syscall
		sw $v0, ($s0) #store value to address of array
		
		#max 
		blt $v0, $t1, Next0
		move $t1, $v0
	Next0:
		#min
		bgt $v0, $t0, Next
		move $t0, $v0
		
	Next:
		
		addi $s1, $s1, 1 #i = i + 1
		addi $s0, $s0, 4  #tang 1 byte ky tu tiep theo
		bne $s1, $s2, Nhapmang
exit:	

	#xuat min
	li $v0, 4
	la $a0, msgXuat1
	syscall
	
	li $v0, 1 
	move $a0, $t0 
	syscall	
	
	#\n
	li $v0, 4
	la $a0, space
	syscall
	
	#xuat max
	
	li $v0, 4
	la $a0, msgXuat2
	syscall
	
	li $v0, 1 
	move $a0, $t1 
	syscall	
	
		
	#exit
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
