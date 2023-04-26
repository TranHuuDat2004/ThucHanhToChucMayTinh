# Chuong trinh: Vi?t ch??ng trình con tìm UCLN c?a 2 s? a, b.

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 3/1/2023
# Version: 1.0

.data
	thongbao:.asciiz  "Nhap a, b : "
	ketqua:.asciiz "Ket qua : "
.text
main:
	# THong bao chuong trinh
	li $v0, 4
	la $a0, thongbao
	syscall
	
	# bien a
	li $v0, 5
	syscall
	move $t0, $v0
	
	# bien b
	li $v0, 5
	syscall
	move $t1, $v0
	
	# g?i CTC
	jal UocChung
	move $t3, $a0  # chuyen ket qua sang $t3
	
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
.globl UocChung
UocChung:
	li $t2, 0 # bien dem t2 = 0
UocChungLoop:
	addi $t2, $t2, 1  # t2 + 1
	bgt $t2, $t0, ExitLoop  # t2 < a
	bgt $t2, $t1, ExitLoop  # t2 < b
	rem $t3, $t0, $t1
	rem $t4, $t1, $t2
	bne $t3, $0, UocChungLoop
	bne $t4, $0, UocChungLoop
	li $v0, 1
	move $a0, $t2
	syscall
ExitLoop: 
	jr $ra
.end UocChung

	