# Ch??ng tr�nh:Vi?t ch??ng tr�nh nh?p v�o m?t s? nguy�n N,
#t�nh t?ng c�c s? t? 1 ??n N

# T�c gi?: Tr?n H?u ??t, MSSV: 522H0081
# Ng�y code: 20/12/2022
# Version: 1.0
.data
noti:.asciiz  "Nhap n : "
res:.asciiz "Ket qua : "
.text
main:
la $a0, noti
addi $v0, $0, 4
syscall
	
# nhap n
addi $v0, $0, 5
syscall
addi $s0, $v0, 0 # n luu trong s0
	
addi $s1, $0, 0 # khoi tao s1 = 0 -> tong
addi $t1, $0, 1 # khoi tao t1 = 1 -> bien dem
	
lap: # quy trinh tinh tong
add $s1, $s1, $t1 # s1 = s1 + t1
addi $t1, $t1, 1 # t1++
ble $t1, $s0 lap # while (t1 <= n)
	
# in thong bao ket qua
la $a0, res
addi $v0, $0, 4
syscall
	
#in ket qua
addi $a0, $s1, 0
addi $v0, $0, 1
syscall

# Thoat
li $v0,10
syscall

