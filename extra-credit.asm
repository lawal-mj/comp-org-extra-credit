.data
promptL: .asciiz "Enter a positive integer L greater than 20: "
promptM: .asciiz "Enter a positive integer M greater than 20: "
promptN: .asciiz "Enter a positive integer N greater than 20: "
resultMsg: .asciiz "The Greatest Common Divisor is: "

.text
.globl main

main:
    # Get L
    li $v0, 4          
    la $a0, promptL     
    syscall
    li $v0, 5           
    syscall
    move $t0, $v0       