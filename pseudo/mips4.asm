.data
	tamanho: .word 5
	vetor: .word 1,2,3,4,5
.text

main:
	ori $t4, $zero, 1
	lui $t1, 0x1001
	lw $t2, 0($t1)
	addi $t1, $t1, 4
	
loop:
	lw $t3, 0($t1)
	beq $t4, $t2, end
	
	ori $t7, $zero, 4
	mult $t7, $t2
	mflo $t7
	ori $t8, $zero, 4
	mult $t8, $t4
	mflo $t8
	sub $t7, $t7, $t8
	add $t7, $t1, $t7
	
	lw $t6, 0($t7)
	sw $t6, 0($t1)
	sw $t3, 0($t7)
	
	subi $t2, $t2, 1
	addi $t4, $t4, 1
	addi $t1, $t1, 4
	j loop
	
end:
	nop