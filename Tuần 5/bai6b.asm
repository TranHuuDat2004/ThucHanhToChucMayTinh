.data
msg: .asciiz "Nhap 2 so nguyen de tinh chu vi hinh chu nhat: \n"
msg2: .asciiz "Chu vi hinh chu nhat la:"
.text
.globl main
main:
# Print string msg
li $v0, 4
la $a0, msg
syscall
# Nhap so nguyen thu nhat
li $v0, 5 # Load code =5 vào thanh ghi $v0 ?? h? th?ng bi?t là nh?p s? nguyên
syscall # G?i h? th?ng ?? cho phép nh?p s? nguyên, và l?u s? v?a nh?p vào $v0
move $t1, $v0 # Di chuy?n giá tr? c?a thanh ghi $v0 vào $t1 ($t1 = s? th? 1)

#Nhao so nguyen thu hai
li $v0, 5 # Load code =5 vào thanh ghi $v0 ?? h? th?ng bi?t là nh?p s? nguyên
syscall # G?i h? th?ng ?? cho phép nh?p s? nguyên, và l?u s? v?a nh?p vào $v0
move $t2, $v0 # Di chuy?n giá tr? c?a thanh ghi $v0 vào $t2 ($t2=s? th? 2)

# Tính t?ng
add $t3, $t1, $t2 # $t3 = $t1+$t2
#TÍnh chu vi
mul $t4, $t3, 2

i $v0, 4la $a0, msg2
syscall

#print a interger
li $v0, 1 # Load code=1 ?? h? th?ng nh?n bi?t print a integer
move $a0, $t4 # Di chuy?n giá tr? trong $t4 vào $a0 ?? xu?t ra
syscall # G?i h? th?ng ?? xu?t giá tr? trong $a0 ra ngoài

# Thoát
li $v0, 10
syscall
