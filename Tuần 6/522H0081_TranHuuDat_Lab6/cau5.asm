# Ch??ng tr�nh: Vi?t ?o?n code nh?p v�o m?t s? nguy�n,
#xu?t ra th�ng b�o ?� l� s? d??ng, s? �m hay s? 0.

# T�c gi?: Tr?n H?u ??t, MSSV: 522H0081
# Ng�y code: 20/12/2022
# Version: 1.0
.data
Thongbao: .asciiz "Moi ban nhap vao so nguyen:"
msgSoduong: .asciiz "So ban vua nhap la so duong"
msgSoam: .asciiz "So ban vua nhap la so am"
.text
.globl main
main:
# Print a string
li $v0,4
la $a0, Thongbao
syscall

# Read a integer
li $v0,5
syscall
move $t0, $v0 # move gia tri vua nhap vao $t0

#so sanh duong hay am
blt $t0,0,soam # So am neu $t0 < 0
soduong:
# Print a string so duong
li $v0,4
la $a0, msgSoduong
syscall
j Exit
soam:
# Print a string so am
li $v0,4
la $a0, msgSoam
syscall
Exit:
# Thoat
li $v0,10
syscall