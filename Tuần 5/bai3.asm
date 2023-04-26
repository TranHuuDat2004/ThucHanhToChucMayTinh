.data
msg: .asciiz "Nhap 2 so nguyen de tinh tong: \n"
.text
.globl main
main:
# Print string msg
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen thu nhat
li $v0, 7
syscall 
move $t1, $v0
#Nhao so nguyen thu hai
li $v0, 7
syscall 
move $t2, $v0 
# Tính t?ng
add $t3, $t1, $t2 # $t3 = $t1+$t2
#print a interger
li $v0, 7
move $a0, $t3 
syscall 
# Thoát
li $v0, 10
syscall