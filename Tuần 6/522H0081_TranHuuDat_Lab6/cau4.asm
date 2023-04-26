# Ch??ng trình: Vi?t ?o?n code nh?p vào m?t s? nguyên,
# n?u ?ó là s? chia h?t cho 3 thì thông báo ra màn hình.

# Tác gi?: Tr?n H?u ??t, MSSV: 522H0081
# Ngày code: 20/12/2022
# Version: 1.0
.data
Thongbao: .asciiz "Moi ban nhap vao so nguyen:"
het3: .asciiz "So ban vua nhap chia het cho 3"
khonghet3: .asciiz "So ban vua nhap khong chia het cho 3"
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


#print chia het cho 3
li $t1,1
rem $t2,$t0,3 # $t2= $t0%2 (Chia cho 3 lay du)
beq $t2,0,chiahet3

chiakhonghet3:
# Print a string chia het cho 3
li $v0,4
la $a0, khonghet3
syscall
b Exit

chiahet3:
# Print a string chia het cho 3
li $v0,4
la $a0, het3
syscall

Exit: # Thoat
li $v0,10
syscall