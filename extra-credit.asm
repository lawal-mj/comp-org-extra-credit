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

    # Get M
    li $v0, 4           
    la $a0, promptM     
    syscall
    li $v0, 5           
    syscall
    move $t1, $v0       

   # Get N
    li $v0, 4           
    la $a0, promptM     
    syscall
    syscall
    move $t1, $v0   

    # get thegreatest Common factor of the first two
    move $a0, $t0       
    move $a1, $t1       
    jal gcd             
    move $t3, $v0  

    # comapre the gcd of the first two with N 
    move $a0, $t3       
    move $a1, $t2       
    jal gcd   


   # Print out result
    li $v0, 4           
    la $a0, resultMsg   
    syscall
    move $a0, $v0       
    li $v0, 1           
    syscall   

   # Exit
    li $v0, 10         
    syscall             

gcd:
   #  greatest common factor algorithm
    beq $a1, $zero, end_gcd  
    move $t4, $a1           
    rem $t5, $a0, $a1        
    move $a0, $t4            
    move $a1, $t5            
    j gcd                    