# Escreva um programa equivalente ao código C abaixo com o assembly do MIPS.

.data 
	x: .word 150
	y: .word 230
	z: .word 991

.text

main:
	la $t0, x
	lw $t0, 0($t0)
	
	la $t1, y
	lw $t1, 0($t1)
	
	la $t2, z
	lw $t2, 0($t2)
	
	
	or $a0, $t0, $zero
	or $a1, $t1, $zero
	or $a2, $t2, $zero
	jal soma3n
	
	move $t3, $v0
	
	li $v0, 10
	syscall

soma3n:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal soma
	
	move $a0, $v0
	move $a1, $a2
	jal soma
	
	j return_soma3n

return_soma3n:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
soma:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	add $v0, $a0, $a1
	j return_soma

return_soma:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra