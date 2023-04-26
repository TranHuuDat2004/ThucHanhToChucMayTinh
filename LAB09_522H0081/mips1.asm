# Chuong trình: Vi?t ch??ng trình nh?p vào 2 s? nguyên a, b
# Xu?t ra màn hình k?t qu? c?a bi?u th?c: ab - 12b + 7a (Dùng stack)

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 10/1/2023
# Version: 1.0
.data
	De: .asciiz "ab - 12b + 7a"
	Thongbao: .asciiz "Nhap a va b"
	ketqua:	.asciiz "Ket qua: "
.text
.globl main
main:
	# Thong bao de
	li $v0, 4
	la $a0, De
	syscall
	
	# Thong bao nhap a va b
	li $v0, 4
	la $a0, Thongbao
	syscall
	
	# Nhap a
	li $v0, 5
	move $t1, $v0    # a = t1
	syscall
	
	# Nhap b
	li $v0, 5
	move $t2, $v0    # b = t2
	syscall
	
	# Buoc 1: Tinh a*b:
	mul $t3, $t1, $t2    # so hang 1 = $t3
	
	# Buoc 2: Tinh -12*b:
	mul $t4, $t2, -12	# so hang 2 = $t4
	
	# Buoc 3: Tinh 7*a:
	mul $t5, $t1, 7		# so hang 3 = $t5
	
	# so hang 1 - so hang 2 = t6
	sub $t6, $t3, $t4
	
	# so hang t6 - so hang 3 = t7
	add $t7, $t6, $t5
	
	# in ket qua
	li $v0, 4
	la $a0, ketqua
	syscall
	
	# print integer
	li $v0, 1
	la $a0, $t7    # in dap an t7
	syscall
	
	# exit
	li $v0, 10
	syscall
	