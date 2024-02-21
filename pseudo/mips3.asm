.data
	tamanho: .word 10
	vetor: .word -2,1,4,7,11,17,33,52,90,110
.text

main:
	ori $t0, $zero, 1 # Ordened
	ori $t4, $zero, 0
	lui $t1, 0x1001
	lw $t2, 0($t1)
	addi $t1, $t1, 4
	
loop:
	lw $t3, 0($t1)
	beq $t4, $t2, end
	bne $t4, $zero, compare
	j next_word
	
compare:
	beq $t3, $t6, next_word
	slt $t7, $t6, $t3
	bne $t7, $zero, next_word
	ori $t0, $zero, 0
	j end
	
next_word:
	or $t6, $t3, $zero
	addi $t4, $t4, 1
	addi $t1, $t1, 4
	j loop
	
end:
	nop