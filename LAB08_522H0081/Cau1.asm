# Chuong trình: Vi?t l?i ch??ng trình tính l?y th?a x^y, v?i x, y nh?p t? bàn phím
# (Dùng ch??ng trình con)

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 3/1/2023
# Version: 1.0

.data
msg: .asciiz "Nhap 2 so nguyen de tinh luy thua: \n"
answer: .word 0
ketqua: .asciiz "Ket qua:"
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

	move $a0, $t1
	move $a1, $t2
	
	# g?i CTC
	jal power
	sw $v0, answer
	
	# THong bao ket qua
	li $v0, 4
	la $a0, ketqua
	syscall
	
	# print answer
	li $v0,1
	lw $a0, answer
	syscall
	
	#thoát
	li $v0,10
	syscall
	.end main

# ch??ng trình con
.globl power
.ent power

power:
	li $t0,0 # Bi?n ??m i=0
	li $v0,1 # tich = 1
	
powLoop:
	mul $v0,$v0,$a0 # tich = tich * x
	addi $t0,$t0,1 # i=i+1
	blt $t0,$a1,powLoop # N?u i<y thì l?p l?i
	jr $ra # tr? k?t qu? v? cho thanh ghi $ra

.end power