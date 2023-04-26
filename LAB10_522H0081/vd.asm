.data
    str: .asciiz     "Enter FullName:"
    inputsp: .space     81
    inputsize: .word     80

.text
.globl main
main:
    #Print string
    li $v0, 4
    la $a0, str  
    syscall

    # read a string
    li $v0,8
    la $a0, inputsp        #Pointer to address $a0=buffer
    lw $a1, inputsize    #$a1 = length
    syscall

    #Print entered string
    li $v0, 4
    la $a0, inputsp  
    syscall
    
    #end
    li $v0, 10
    syscall