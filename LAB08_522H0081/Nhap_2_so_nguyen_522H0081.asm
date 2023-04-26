# Chuong trinh: Nhap so nguyen a, b

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 3/1/2023
# Version: 1.0

.data
msg: .asciiz "Nhap 2 so nguyen a, b:"
.text
.globl main
main:
	li $v0, 4
	la $a0, msg
	syscall
	
	# Nhap a
	li $v0, 5
	syscall 
	move $t1, $v0
	
	#Nhap b
	li $v0, 5 
	syscall 
	move $t2, $v0 

	#print a 
	li $v0, 1 
	move $a0, $t1
	syscall 
		
	#print b
	li $v0, 1 
	move $a0, $t2
	syscall 
# Thoát
	li $v0, 10
	syscall
