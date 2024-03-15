# Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5 posições.

.data
	vetor: .word 1, 2, 3, 4, 5

.text

main:
	lui $t0, 0x1001
	ori $t1, $zero, 5
	ori $t6, $zero, 0
	
	la $t2, vetor
	la $t3, vetor
	ori $t7, $zero, 4
	mult $t7, $t1
	mflo $t7
	subi $t7, $t7, 4
	add $t3, $t7, $t3

loop:	
	lw $t4, 0($t2)
	lw $t5, 0($t3)
	sw $t4, 0($t3)
	sw $t5, 0($t2)
	
	addi $t2, $t2, 4
	addi $t3, $t3, -4
	
	addi $t1, $t1, -1
	beq $t1, $t6, end
	addi $t6, $t6, 1
	
	j loop

end:
	li $v0, 10
	syscall