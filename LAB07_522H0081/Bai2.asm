# chuong trinh: nhap vao mot mang co N so nguyen, 
# tinh tong va trung binh cong cac phan tu co trong mang

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 27/12/2022
# Version: 1.0
.data 
	mang: .word 0:100
	msg: .asciiz "Nhap N : "
	msgXuat1: .asciiz "Tong cac phan tu la: "
	msgXuat2: .asciiz "Trung binh cong la:  "
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
	
	li $t0, 0 # $t0 = sum = 0
	#nhap mang
	Nhapmang:
		#get a integer number
		li $v0, 5
		syscall
		sw $v0, ($s0) #store value to address of array
		add $t0, $t0, $v0
		addi $s1, $s1, 1 #i = i + 1
		addi $s0, $s0, 4  #tang 1 byte ky tu tiep theo
		bne $s1, $s2, Nhapmang
	#tong cac phan tu va trungbinh cong
	#xet tung phan tu trong mang
	mtc1 $t0, $f1
	cvt.s.w $f1, $f1
	
	mtc1 $s1, $f2
	cvt.s.w $f2, $f2
	
	div.s $f0, $f1, $f2
exit:	
	li $v0, 4
	la $a0, msgXuat1
	syscall
	
	li $v0, 1 
	move $a0, $t0 
	syscall	
	
	li $v0, 4
	la $a0, xuongdong
	syscall
	
	li $v0, 4
	la $a0, msgXuat2
	syscall
	
	li $v0, 2
	mov.s $f12, $f0 
	syscall
		
	#exit
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
