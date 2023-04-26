.data
msg: .asciiz "Nhap 2 so nguyen de tinh thuong: \n"
.text
.globl main
main:
# Print string msg
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen thu nhat
li $v0, 6 
syscall 
mov.s $f1, $f0 
#Nhao so nguyen thu hai
li $v0, 6 
syscall 
mov.s $f2, $f0 
# Tính th??ng
div.s $f3, $f1, $f2 # $t3 = $t1 / $t2
#print a interger
li $v0, 2 # Load code=3 ?? h? th?ng nh?n bi?t print double
mov.s $f12, $f3 # Di chuy?n giá tr? trong $t3 vào $a0 ?? xu?t ra
syscall # G?i h? th?ng ?? xu?t giá tr? trong $a0 ra ngoài
# Thoát
li $v0, 10
syscall
