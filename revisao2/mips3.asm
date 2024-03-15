# Escreva um programa que leia um vetor de 10 posições (.word) da memória
# Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário
	
.text

main:
	lui $t1, 0x1001
	ori $t2, $zero, 10
	ori $t0, $zero, 1
	
loop:
	beq $t2, $zero, verify_order
	addi $t2, $t2, -1
	
	li $v0, 5
	syscall
	
	sw $v0, 0($t1)
	addi $t1, $t1, 4
	
	j loop
	
verify_order:
	lui $t1, 0x1001
	ori $t2, $zero, 9
	j verify_order_loop

verify_order_loop:
	beq $t2, $zero, end
	addi $t2, $t2, -1
	
	lw $t3, 0($t1)
	addi $t1, $t1, 4
	lw $t4, 0($t1)
	addi $t1, $t1, 4
	
	beq $t3, $t4, success_order
	ble $t4, $t3, fail_order
	
	j verify_order_loop

success_order:
	j verify_order_loop

fail_order:
	ori $t0, $zero, 0
	j end

end:
	li $v0, 10
	syscall