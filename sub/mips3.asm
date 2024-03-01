.data

	number: .asciiz "Digite um número: "

.text

main:
	li $v0,  4
    	la $a0,  number
    	syscall 
    
    	li $v0,  5
    	syscall
    	add $t0, $v0, $zero 
    	add $a0, $t0, $zero 
    	add $a1, $t0, $zero 
    	
	jal fat
	
	move $t1, $v0
	
	move $v0, $a0
	li $v0, 1
	syscall

    	li $v0, 10
    	syscall
    	
fat:
	addi $sp, $sp, -4 
    	sw   $ra, 0($sp)
    
    	subi $a1, $a1, 1
    	beq $a1, $zero, save_result
    	
    	mult $a0, $a1
    	mflo $a0

   	jal fat
  
save_result:
	move $v0, $a0
	j exit
   	
exit:

	lw   $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra