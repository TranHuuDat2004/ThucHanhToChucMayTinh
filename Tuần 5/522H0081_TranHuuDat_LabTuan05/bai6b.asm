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
li $v0, 5 # Load code =5 v�o thanh ghi $v0 ?? h? th?ng bi?t l� nh?p s? nguy�n
syscall # G?i h? th?ng ?? cho ph�p nh?p s? nguy�n, v� l?u s? v?a nh?p v�o $v0
move $t1, $v0 # Di chuy?n gi� tr? c?a thanh ghi $v0 v�o $t1 ($t1 = s? th? 1)

#Nhao so nguyen thu hai
li $v0, 5 # Load code =5 v�o thanh ghi $v0 ?? h? th?ng bi?t l� nh?p s? nguy�n
syscall # G?i h? th?ng ?? cho ph�p nh?p s? nguy�n, v� l?u s? v?a nh?p v�o $v0
move $t2, $v0 # Di chuy?n gi� tr? c?a thanh ghi $v0 v�o $t2 ($t2=s? th? 2)

# T�nh t?ng
add $t3, $t1, $t2 # $t3 = $t1+$t2
#T�nh chu vi
mul $t4, $t3, 2

i $v0, 4la $a0, msg2
syscall

#print a interger
li $v0, 1 # Load code=1 ?? h? th?ng nh?n bi?t print a integer
move $a0, $t4 # Di chuy?n gi� tr? trong $t4 v�o $a0 ?? xu?t ra
syscall # G?i h? th?ng ?? xu?t gi� tr? trong $a0 ra ngo�i

# Tho�t
li $v0, 10
syscall
