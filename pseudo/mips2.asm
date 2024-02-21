.data
	string: .asciiz "meu professor  é muito bom" 
	
.text
	
main: 
	ori $t3, $zero, 32
	ori $t0, $zero, 0
	or $t5, $zero, $zero
	lui $t1, 0x1001
	
first_letter:
	lbu $t2, 0($t1)
	bne $t2, $t3, upper_first_letter

loop:
	lbu $t2, 0($t1)
	beq $t2, $t3, uppercase
	beq $t2, $zero, end
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	j loop
	
uppercase:
	beq $t5, $zero, start_count
	subi $t6, $t6, 32
	sb $t6, 0($t5)
	or $t1, $t5, $zero
	or $t5, $zero, $zero
	j loop
	
start_count: 
	or $t5, $zero, $t1
	j next_byte
	
next_byte:	
	addi $t5, $t5, 1
	lbu $t6, 0($t5)
	bne $t6, $t3, uppercase
	j next_byte
	
upper_first_letter:
	subi $t2, $t2, 32
	sb $t2, 0($t1)
	j loop

end: nop