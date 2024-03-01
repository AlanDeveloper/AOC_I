.data
msg1: .asciiz "Digite um número: "

.text

main:
    	li $v0,  4
    	la $a0,  msg1
    	syscall 		# PRINT
    
    	li $v0,  5
    	syscall             # READ AN INT
    	add $a0, $v0, $zero # MOVE TO $a0

    	jal fib             # CALL FIB

    	li $v0, 10
    	syscall

fib:
    	# SAVE IN STACK
    	addi $sp, $sp, -4 
    	sw   $ra, 0($sp)
    
    	subi $a0, $a0, 1
    	beq $a0, $zero, exit

   	jal fib

exit:

	lw   $ra, 0($sp)        # read registers from stack
        addi $sp, $sp, 4       # bring back stack pointer
        jr $ra