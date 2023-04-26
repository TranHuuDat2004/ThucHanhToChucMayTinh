# Ch??ng tr�nh:Vi?t ?o?n code cho nh?p v�o 2 s? nguy�n a v� b,
#x�c ??nh a > b hay b > a hay 2 s? b?ng nhau.

# T�c gi?: Tr?n H?u ??t, MSSV: 522H0081
# Ng�y code: 20/12/2022
# Version: 1.0
.data
Thongbao: .asciiz "Moi ban nhap vao so nguyen a,b:"
msg_a_lon_b: .asciiz "a lon hon b"
msg_b_lon_a: .asciiz "b lon hon a"
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
# So sanh a va b
bgt $t0, $t1, a_lon_b
b_lon_a:
# Print a string so le
li $v0,4
la $a0, msg_b_lon_a
syscall
j Exit
a_lon_b:
# Print a string so chan
li $v0,4
la $a0, msg_a_lon_b
syscall
Exit:
# Thoat
li $v0,10
syscall