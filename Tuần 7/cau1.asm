# Chuong tr�nh: Vi?t ch??ng tr�nh nh?p v�o m?t m?ng g?m N s? nguy�n
# (N nh?p t? b�n ph�m), xu?t m?ng N s? nguy�n ?� ra m�n h�nh.

# T�c gia: Tran Huu Dat, MSSV: 522H0081
# Ng�y code: 27/12/2022
# Version: 1.0

.data
mangA: .word 2, 3, 5, 7, 10
length: .word 5
nhapmang: .asciiz  "Nhap n : "
.text

main:

# Nhap mang
la $s0, mangA # S0=??a ch? c?a m?ng A
li $s1, 0 # i = 0
lw $s2, length # Size N

readLoop:
#Get a integer number
li $v0, 5 # read integer, store to $v0
syscall

sw $v0, ($s0) # store value to dia chi cua mang1[i]
addi $s1,$s1,1 # i=i+1
addi $s0,$s0, 4 # tang 4 byte ?? ??n � nh? ch?a ph?n t? theo
blt $s1, $s2, readLoop # n?u i<N th� readLoop

la $s0, mangA # S0=??a ch? c?a m?ng A
li $s1, 0 # i = 0
lw $s2, length # Size N
printLoop: # L?p ?? xu?t c�c ph?n t?
li $v0, 1 # code=1 print integer
lw $a0, ($s0) # Get mangA[i]
syscall
add $s1, $s1, 1 # i=i+1
add $s0, $s0, 4 # nh?y t?i ??a ch? ti?p theo (4 bytes)
blt $s1, $s2, printLoop # i<N th� l?p l?i
# i=N th� end
li $v0, 10
syscall
.end main