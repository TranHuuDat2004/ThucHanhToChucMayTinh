.data
msg:    .asciiz    "Nhap 2 so thuc de tinh tong, cach nhau boi Enter: \n"
.text
.globl main
main:
   # Print string msg
       li $v0, 4
       la $a0, msg
       syscall
   
   # Nhap so float thu 1
       li $v0, 6        # Load code =6 v�o thanh ghi $v0 ?? h? th?ng bi?t l� nh?p s? float
       syscall            # G?i h? th?ng ?? cho ph�p nh?p s? float, v� l?u s? v?a nh?p v�o $f0
       mov.s  $f1, $f0        # Di chuy?n gi� tr? c?a thanh ghi $f0 v�o $f1 ($f1 = s? th? 1)
   
   #Nhao so float thu 2
       li $v0, 6    # Load code =6 v�o thanh ghi $v0 ?? h? th?ng bi?t l� nh?p s? float
       syscall        # G?i h? th?ng ?? cho ph�p nh?p s? float, v� l?u s? v?a nh?p v�o $f0
       mov.s  $f2, $f0        # Di chuy?n gi� tr? c?a thanh ghi $f0 v�o $f2 ($f2=s? th? 2)
   
# T�nh t?ng
       add.s  $f3, $f1, $f2    # $f3 = $f1+$f2
   
   #print float
       li $v0, 2        # Load code=2 ?? h? th?ng nh?n bi?t print a float
       mov.s  $f12, $f3    # Di chuy?n gi� tr? trong $f3 v�o $f12 ?? xu?t ra
       syscall            # G?i h? th?ng ?? xu?t gi� tr? trong $f12 ra ngo�i
   # Tho�t
       li $v0, 10
       syscall
