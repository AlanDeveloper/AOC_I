# Escreva um programa que repetidamente pergunte ao usuário pelo número de quilômetros viajados e litros de gasolina consumidos e depois imprima o número de
# quilômetros por litro. Para sair do programa, o usuário deve digitar 0 como número de quilômetros.

.text

main:
	lui $t0, 0x1001
	
loop:
	 li $v0, 6
    syscall
    mov.s $f4, $f0
    
    sub.s $t3, $f4, $f0
    beq $t3, $zero, end
    li $v0, 6
    syscall
    mov.s $f6, $f0

    div.s $f8, $f4, $f6
    mov.s $f12, $f8

    s.s $f8, 0($t0)

    j loop

end:
	li $v0, 10
	syscall
