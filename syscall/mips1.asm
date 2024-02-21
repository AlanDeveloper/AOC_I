.text

main:
	lui $t0, 0x1001
	ori $t1, $zero, 0
	
loop:
	addi $t1, $t1, 1
	j read_integer

read_integer:
	li $v0, 5 # código 5 == lê inteiro
	syscall 
	beq $v0, $zero, end
	or $t3, $v0, $zero
	li $v0, 5 # código 5 == lê inteiro
	syscall 
	
	div $t3, $v0
	mflo $t2
	sw $t2, 0($t0)
	
	addi $t0, $t0, 4
	j loop
	
end:
	nop