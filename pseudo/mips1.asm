.data
	string: .asciiz "Gosto muito do meu professor de AOC-I."
	
.text
	
main: 
	ori $t3, $zero, 32
	ori $t0, $zero, 0
	or $t5, $zero, $zero
	lui $t1, 0x1001

loop:
	lbu $t2, 0($t1)
	beq $t2, $t3, remove_space
	beq $t2, $zero, end
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	j loop
	
remove_space:
	beq $t5, $zero, start_count
	lb $t6, 0($t5)
	sb $t6, 0($t1)
	sb $t2, 0($t5)
	or $t5, $zero, $zero
	j loop
	
start_count: 
	or $t5, $zero, $t1
	j next_byte
	
next_byte:	
	addi $t5, $t5, 1
	lbu $t6, 0($t5)
	bne $t6, $t3, remove_space
	j next_byte

end: nop