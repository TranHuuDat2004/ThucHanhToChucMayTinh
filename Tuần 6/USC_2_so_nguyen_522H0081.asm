# Chuong trinh: Viet chuong tr�nh t�m UC cua 2 so a, b.

# T�c gia: Tran Huu Dat, MSSV: 522H0081
# Ng�y code: 3/1/2023
# Version: 1.0

.data
	thongbao:.asciiz  "Nhap a, b : "
	ketqua:.asciiz "\nUC cua a va b la : "
.text
main:
	# THong bao chuong trinh
	li $v0, 4
	la $a0, thongbao
	syscall
	
	# bien a
	li $v0, 5
	syscall
	move $t1, $v0
	
	# bien b
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $t0, 1    # bien dem t0
	
Loop:
	bgt $t0, $t1, ExitLoop  # t0 > a
	bgt $t0, $t2, ExitLoop  # t0 > b
	rem $t4, $t1, $t0 	# chia lay du t4, a / bien dem
	rem $t5, $t2, $t0 	# chia lay du t5, b / bien dem
	beq $t4, $0, XetUC
	j continue
	
XetUC:
	beq $t5, $0, printUC
	j continue
	
printUC: # in thong bao
	li $v0, 4
	la $a0, ketqua
	syscall
	
	# in  ket qua
	li $v0, 1
	move $a0, $t0
	syscall
	
continue:
	addi $t0, $t0, 1   # t0 + 1
	j Loop

ExitLoop:
	#tho�t
	li $v0, 10
	syscall
.end main
