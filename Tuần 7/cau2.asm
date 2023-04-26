# Chuong tr�nh: Vi?t ch??ng tr�nh nh?p v�o m?t m?ng g?m N s? nguy�n
#(N nh?p t? b�n ph�m), t�nh t?ng v� trung b�nh c�c s? trong m?ng.

# T�c gia: Tran Huu Dat, MSSV: 522H0081
# Ng�y code: 27/12/2022
# Version: 1.0

.data
mangA: .word 1, 4, 8, 10, 15 # ghi 5 s? nguy�n ? ?�y
length: .word 5
tong: .asciiz "Tong la: "
chia: .asciiz "Trung binh la:"

.text

main:

# Nhap mang
	la $s0, mangA # S0=??a ch? c?a m?ng A
	li $s1, 0 # i = 0
	lw $s2, length # Size N

	li $t2,0	#sum=0

addLoop: # L?p ?? xu?t c�c ph?n t?
	lw $t3,($s0)
	add $t2,$t2,$t3	#sum=sum+mang[i]	
	add $s1, $s1, 1 # i=i+1
	add $s0, $s0, 4 # nh?y t?i ??a ch? ti?p theo (4 bytes)
	blt $s1, $s2, addLoop # i<N th� l?p l?i
	
# chia trung binh 
	div $t4, $t2, 5 # $t4 chia trung binh
	
# in thong bao tong
	li $v0, 4
	la $a0, tong
	syscall

# in ket qua tong
	li $v0, 1 # load code 1 v�o $v0 ?? h? th?ng nh?n bi?t xu?t s? nguy�n
	move $a0, $t2 # Load s? c?n xu?t v�o thanh ghi $a0
	syscall
	
# in thong bao trung binh
	li $v0, 4
	la $a0, chia
	syscall
		
# in ket qua trung binh
	li $v0, 1 # load code 1 v�o $v0 ?? h? th?ng nh?n bi?t xu?t s? nguy�n
	move $a0, $t4 # Load s? c?n xu?t v�o thanh ghi $a0
	syscall
	
# ket thuc chuong trinh
	li $v0, 10
	syscall
	.end main