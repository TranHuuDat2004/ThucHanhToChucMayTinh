.data
input: .asciiz "Xin chao cac ban"
.text
.globl main
main:
# print input
li $v0, 4 # Load code =4 v�o thanh ghi $v0 ?? h? th?ng bi?t print chu?i

la $a0, input # Load ??a ch? c?a chu?i input c?n xu?t v�o $a0
syscall # G?i h? th?ng ?? xu?t n?i dung trong $a0 ra
# exit
li $v0,10 # Load code =10 v�o thanh ghi $v0 ?? h? th?ng bi?t l� exit
syscall # G?i h? th?ng ?? exit