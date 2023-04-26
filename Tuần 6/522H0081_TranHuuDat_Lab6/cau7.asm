# Ch??ng trình: Vi?t ?o?n cho nh?p m?t s? nguyên d??ng n,
# n?u ng??i dùng nh?p s? âm ho?c s? 0 thì
# yêu c?u nh?p l?i cho ??n khi nào nh?n ???c giá tr? nguyên d??ng.

# Tác gi?: Tr?n H?u ??t, MSSV: 522H0081
# Ngày code: 20/12/2022
# Version: 1.0

.data
Thongbao: .asciiz "Moi ban nhap vao so duong:"
msgSoam: .asciiz "Moi ban nhap lai so duong:"
msgSoduong: .asciiz "So duong vua nhap la:"
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

#thoat vong lap neu nhap dung
bgt $t0, 0, ExitLoop

#vong lap neu nhap so am
blt $t0, 0,LoopSum
LoopSum:
li $v0,5
syscall
move $t0, $v0 # move gia tri vua nhap vao $t0  
blt $t0, 0,LoopSum   
bgt $t0, 0, ExitLoop
#thoat vong lap neu nhap dung
ExitLoop:
# Print a string
li $v0,4
la $a0, msgSoduong
syscall
li $v0, 1
move $a0, $t0
syscall 
# Thoat
li $v0,10
syscall