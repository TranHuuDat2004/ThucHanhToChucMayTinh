.data
input: .asciiz "Hello World"
.text
.globl main
main:
# print input
li $v0, 4 # Load code =4 v�o thanh ghi de thong baop

la $a0, input # Load dia chi vao thanh ghi
syscall # 

# exit
li $v0,10 # Load code =10 v�o thanh ghi, thoat chuong  trinh
syscall # 
