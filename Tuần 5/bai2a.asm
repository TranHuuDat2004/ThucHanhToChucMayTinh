.data
msg: .asciiz "Nhap 1 so nguyen: \n"
.text
.globl main
main:
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen thu nhat
li $v0, 5
syscall 
move $t1, $v0 
#print a interger
li $v0, 1 # 
move $a0, $t1
syscall 
# Thoát
li $v0, 10
syscall
