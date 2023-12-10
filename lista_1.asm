# Faça um programa que escreva o valor 0xDECADA70 no registrador
# $t7, incluindo um dígito hexadecimal por vez (isto é, insira letra por
# letra, individualmente) no registrador.

ori $t7, $t7, 0xD  # Insere 0xD
sll $t7, $t7, 4  # Desloca 4 bits para a esquerda

ori $t7, $t7, 0xE  # Insere 0xE
sll $t7, $t7, 4  # Desloca 4 bits para a esquerda

ori $t7, $t7, 0xC # Insere 0xC
sll $t7, $t7, 4  # Desloca 4 bits para a esquerda

ori $t7, $t7, 0xA  # Insere 0xA
sll $t7, $t7, 4  # Desloca 4 bits para a esquerda

ori $t7, $t7, 0xD  # Insere 0xD
sll $t7, $t7, 4  # Desloca 4 bits para a esquerda

ori $t7, $t7, 0xA  # Insere 0xA
sll $t7, $t7, 4  # Desloca 4 bits para a esquerda

ori $t7, $t7, 0x7  # Insere 0x7
sll $t7, $t7, 4  # Desloca 4 bits para a esquerda

ori $t7, $t7, 0x0  # Insere 0x0

# Escreva 0xAAAAAAAA em $t1. Faça um shift de um bit para a direita
# desse valor e coloque o resultado em $t2, deixando $t1 inalterado. Em
# $t3, $t4 e $t5 coloque os resultados das operações or, and e xor entre
# $t1 e $t2, respectivamente. Em comentários no final do código, explique
# os resultados obtidos, mostrando os valores binários.

ori $t1,$t0, 0xAAAA
sll $t1, $t1, 16
ori $t1,$t1, 0xAAAA

srl $t2, $t1, 4

or $t3, $t1, $t2 # alguma coisa e zero = alguma coisa && alguma coisa  e alguma coisa = alguma coisa && zero e zero = zero
and $t4, $t1, $t2 #alguma coisa e zero =  zero && alguma coisa e alguma coisa = alguma coisa  && zero e zero = zero
xor $t5, $t1, $t2 # alguam coisa e zero =  alguma coisa && alguma coisa e alguma coisa = zero  && zero e zero = zero

# Comece um programa pela instrução: ori $t1, $zero, 0x01. Usando
# apenas as instruções lógicas do tipo R (dois registradores como
# operandos) or, and e xor e instruções de shift (isto é, sem usar outras
# instruções ori além da inicial e nem instruções nor),
# escreva 0xFFFFFFFF em $t1. Procure usar o menor número de
# instruções possível.

ori $t1, $zero, 0x01  # inicializa o t1. t1 = 00000000000000000000000000000001 = 1

sll $t2, $t1, 1   # desloca o t1 de um bit e salva em t2. t2 = 00000000000000000000000000000010 = 2
or $t1, $t1, $t2  # concatena o t1 e o t2 e salva em t1. t1 = 00000000000000000000000000000011 = 3

sll $t2, $t1, 2   # desloca o t1 de dois bits e salva em t2. t2 = 00000000000000000000000000001100
or $t1, $t1, $t2  # concatena o t1 e o t2 e salva em t1. t1 = 00000000000000000000000000001111

sll $t2, $t1, 4   # desloca o t1 de dois bits e salva em t2. t2 = 00000000000000000000000011110000
or $t1, $t1, $t2  # concatena o t1 e o t2 e salva em t1. t1 = 00000000000000000000000011111111

sll $t2, $t1, 8   # desloca o t1 de dois bits e salva em t2. t2 = 00000000000000001111111100000000
or $t1, $t1, $t2  # concatena o t1 e o t2 e salva em t1. t1 = 00000000000000001111111111111111

sll $t2, $t1, 16   # desloca o t1 de dois bits e salva em t2. t2 = 11111111111111110000000000000000
or $t1, $t1, $t2  # concatena o t1 e o t2 e salva em t1. t1 = 11111111111111111111111111111111

# Escreva a sequência 0x12345678 em $t1. A seguir, escreva um código
# que inverta a sequência, escrevendo 0x87654321 em $t2. Obviamente o
# código deve inverter os bits de $t1 e não simplesmente
# escrever 0x87654321 diretamente em $t2.

ori $t1, $zero, 0x1234 
sll $t1, $t1, 16
ori $t1, $t1, 0x5678

or $t3, $t1, $zero
sll $t3, $t3, 28

srl $t4, $t1, 4
sll $t4, $t4, 28
srl $t4, $t4, 4
or $t3, $t3, $t4

srl $t4, $t1, 8
sll $t4, $t4, 28
srl $t4, $t4, 8
or $t3, $t3, $t4

srl $t4, $t1, 12
sll $t4, $t4, 28
srl $t4, $t4, 12
or $t3, $t3, $t4

srl $t4, $t1, 16
sll $t4, $t4, 28
srl $t4, $t4, 16
or $t3, $t3, $t4

srl $t4, $t1, 20
sll $t4, $t4, 28
srl $t4, $t4, 20
or $t3, $t3, $t4

srl $t4, $t1, 24
sll $t4, $t4, 28
srl $t4, $t4, 24
or $t3, $t3, $t4

srl $t4, $t1, 28
sll $t4, $t4, 28
srl $t4, $t4, 28
or $t3, $t3, $t4

or $t2, $t3, $zero

# Faça um programa que some os números decimais 326, -211, 311 e -684 e
# escreva o resultado no registrador $t0. NÃO utilize a instrução sub.

ori $t1, $zero, 326
addi $t1, $t1, -211
addi $t1, $t1, 311
addi $t1, $t1, -684

# Inicialize o registrador $t7 com 0x1. Com apenas uma instrução,
# multiplique o conteúdo do registrador $t7 por 32. Utilize apenas instruções
# já vistas em aula até agora. O programa deve funcionar para qualquer valor,
# não apenas para 0x1.

ori $t7, $zero, 0x1
sll $t7, $t7, 5

# Escreva um programa que calcule o valor de
# 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3,
# respectivamente) e coloque o resultado em $t7. Faça testes com alguns
# valores diferentes de x, y e z. Utilize apenas instruções já vistas na
# disciplina.

ori $t1, $zero, 5 # X
ori $t2, $zero, 2 # Y
ori $t3, $zero, 3 # Z

sll $t1, $t1, 2
sll $t2, $t2, 1
sll $t4, $t3, 1
add $t3, $t4, $t3

sub $t7, $t1, $t2
add $t7, $t7, $t3

# Faça um programa que calcule a seguinte equação:
# y = 3x^2 - 5x + 13
# Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x pelo
# valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t5.
# Armazene o resultado y no registrador $t6.
# Faça teste com diferentes valores positivos e negativos de x.
# Faça um teste substituindo a primeira instrução addi por uma instrução ori
# equivalente e responda, nos comentários, qual o resultado quando são usados números
# positivos e números negativos.

addi $t5, $zero, 2

sll $t1, $t5, 1
sll $t2, $t1, 1
add $t2, $t1, $t2

sll $t3, $t5, 2
add $t3, $t3, $t5

sub $t6, $t2, $t3
addi $t6, $t6, 13

# Faça um programa que calcule a seguinte equação:
# y = (9x + 7) / (2x + 8)
# Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor
# desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
# registrador $t1.
# Armazene o quociente da divisão em $t2 e o resto em $t3.
# Responda o que acontece quando x = -4

addi $t1, $zero, 2

# Faça um programa que calcule a área do triângulo equilátero abaixo e escreva o
# resultado em $t3.
# Armazene b em $t1 e h em $t2 utilizando as instruções addi $t1, $zero, b e
# addi $t2, $zero, h, substituindo b e h pelos valores desejados, e sempre que precisar
# de b e h, utilize os valores armazenados nos registradores $t1 e $t2. 