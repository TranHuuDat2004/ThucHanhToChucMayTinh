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
       li $v0, 6        # Load code =6 vào thanh ghi $v0 ?? h? th?ng bi?t là nh?p s? float
       syscall            # G?i h? th?ng ?? cho phép nh?p s? float, và l?u s? v?a nh?p vào $f0
       mov.s  $f1, $f0        # Di chuy?n giá tr? c?a thanh ghi $f0 vào $f1 ($f1 = s? th? 1)
   
   #Nhao so float thu 2
       li $v0, 6    # Load code =6 vào thanh ghi $v0 ?? h? th?ng bi?t là nh?p s? float
       syscall        # G?i h? th?ng ?? cho phép nh?p s? float, và l?u s? v?a nh?p vào $f0
       mov.s  $f2, $f0        # Di chuy?n giá tr? c?a thanh ghi $f0 vào $f2 ($f2=s? th? 2)
   
# Tính t?ng
       add.s  $f3, $f1, $f2    # $f3 = $f1+$f2
   
   #print float
       li $v0, 2        # Load code=2 ?? h? th?ng nh?n bi?t print a float
       mov.s  $f12, $f3    # Di chuy?n giá tr? trong $f3 vào $f12 ?? xu?t ra
       syscall            # G?i h? th?ng ?? xu?t giá tr? trong $f12 ra ngoài
   # Thoát
       li $v0, 10
       syscall
