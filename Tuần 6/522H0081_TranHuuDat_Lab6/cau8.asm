# Ch??ng trình: Nh?p vào hai s? nguyên d??ng a và b,
# tính t?ng các s? nguyên d??ng có giá tr? n?m trong ?o?n [a, b]..

# Tác gi?: Tr?n H?u ??t, MSSV: 522H0081
# Ngày code: 20/12/2022
# Version: 1.0
.data
Thongbao: .asciiz "Moi ban nhap vao so nguyen a,b:"
res:.asciiz "Ket qua : "
.text
.globl main
main:
# Print a string
li $v0,4
la $a0, Thongbao
syscall

# Nhap a
li $v0,5
syscall
move $t0, $v0 # move gia tri vua nhap vao a

# Nhap b
li $v0,5
syscall
move $t1, $v0 # move gia tri vua nhap vao b

li $t2, 0 # $t2 = c = 0
li $t3, 0 # $t3 = sum = 0

LoopSum:
bgt $t0,$t1, ExitLoop # N?u i>n thì thoát kh?i vòng l?p
add $t2, $t0, $t1 # c = a + b
add $t3, $t3, $t0, # sum = sum + c
add $t0,$t0,1 # a = a+1
j LoopSum
ExitLoop:
# in thong bao ket qua
la $a0, res
addi $v0, $0, 4
syscall
	
#in ket qua
addi $a0, $t3, 0
addi $v0, $0, 1
syscall

# Thoat
li $v0,10
syscall