.data

tamanho: .word 7
vetor1: .word -30, -23, 56, -43, 72, -18, 71
vetor2: .word 45, 23, 21, -23, -82, 0, 69
soma: .word 0, 0, 0, 0, 0, 0, 0

.text

main:
	la $t0, tamanho
	lw $t0, 0($t0)
	la $t1, vetor1
	la $t2, vetor2
	la $t3, soma

	ori $t4, $zero, 0
	
loop:
	beq $t0, $t4, end
	addi $t4, $t4, 1
	
	lw $t5, 0($t1)
	lw $t6, 0($t2)
	add $t6, $t5, $t6
	sw $t6, 0($t3)
	
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t3, $t3, 4
	
	j loop

end:
	nop
