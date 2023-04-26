# Chuong trinh:  Vi?t ch??ng trình con tính n!

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 3/1/2023
# Version: 1.0

.data
	thongbao:.asciiz  "Nhap n de tinh giai thua : "
	ketqua:.asciiz "Ket qua : "
	answer: .word 0
.text
main:
	# THong bao chuong trinh
	li $v0, 4
	la $a0, thongbao
	syscall
	
	# Nhap n
	li $v0, 5
	syscall 
	move $t0, $v0 # t0 = n
	
	# g?i CTC
	jal giaithua
	move $t3, $s1  # chuyen ket qua sang $t3
	
	# THong bao ket qua
	li $v0, 4
	la $a0, ketqua
	syscall
	
	# print answer
	li $v0,1
	move $a0, $t3
	syscall
	
	#thoát
	li $v0,10
	syscall
	.end main
	
# ch??ng trình con
.globl giaithua
giaithua:
	addi $s1, $0, 1 # s1 = 1 -> bien tinh
	addi $t1, $0, 1 # t1 = 1 -> bien dem
giaithuaLoop:
	# quy trinh tinh giai thua
	mul $s1, $s1, $t1 # s1 = s1 * t1
	addi $t1, $t1, 1 # t1 + 1
	ble $t1, $t0, giaithuaLoop # while (t1 <= n)
	jr $ra

.end giaithua
