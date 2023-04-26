#Chuong trinh:Viet chuong trinh con kiem tra so chinh phuong.

# Tác gia: Tran Huu Dat, MSSV: 522H0081
# Ngày code: 3/1/2023
# Version: 1.0
.data
input: .asciiz "nhap vao 2 so \n"
msgdung: .asciiz " so chinh phuong"
msgsai: .asciiz " khong la so chinh phuong"
answer: .word 0
.text
.globl main
main:
li $v0, 4
la $a0, input
syscall


li $v0, 5
syscall
move $t1, $v0

# g?i CTC
jal power
sw $v0,answer

# print answer
li $v0,1
lw $a0,answer
syscall

#thoát
li $v0,10
syscall
.end main

# ch??ng trình con
.globl power
.ent power
power:
li $t0,1 # Bi?n ??m i=0


powLoop:

mul $t2,$t0,$t0
addi $t0,$t0,1 # i=i+1
blt $t2,$t1, powLoop
beq $t2, $t1, loop2

li $v0, 4
la $a0, msgsai
syscall
j Exit




loop2:
li $v0, 4
la $a0, msgdung
syscall
j Exit

Exit:
li $v0, 10
syscall
jr $ra
.end power
