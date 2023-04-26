# Chuong trinh:viet chuong trinh nhap vao mot mang co N so nguyen, 
# xuat mang co N so nguyen ra man hinh

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 27/12/2022
# Version: 1.0
.data 
	mang: .word 0:100
	msg: .asciiz "Nhap N : "
	msgXuat: .asciiz "Mang xuat: "
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
	
	#nhap mang
	Nhapmang:
		#get a integer number
		li $v0, 5
		syscall
		sw $v0, ($s0) #store value to address of array
		addi $s1, $s1, 1 #i = i + 1
		addi $s0, $s0, 4  #tang 1 byte ky tu tiep theo
		bne $s1, $s2, Nhapmang
		
	#xuat mang
	li $v0, 4
	la $a0, msgXuat
	syscall
	
	#xuat mang da nhap
	la $s0 , mang
	li $s1, 0
	printLoop: 
	
		li $v0, 1
		lw $a0, ($s0)
		syscall
		addi $s1, $s1, 1
		addi $s0, $s0, 4
		li $v0, 4
		la $a0, space
		syscall
		bne $s1, $s2, printLoop
	
		
	#exit
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
