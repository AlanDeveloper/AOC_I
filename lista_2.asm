# Faça um programa que calcule a seguinte equação: y = 32ab - 3a + 7b - 13
# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as três primeiras posições da memória .data para armazenar,
# consecutivamente, a, b e y, iniciando o código com:


.data

 a: .word 3
 b: .word 5
 y: .space 4
 
.text

lui $t0, 0x1001
lw $t1, 0x0000($t0)
lw $t2, 0x0004($t0)

ori $t4, $zero, 2
sll $t4, $t4, 4
mult $t4, $t1
mflo $t4
mult $t4, $t2
mflo $t4

or $t5, $zero, $t1
sll $t5, $t5, 1
add $t5, $t5, $t1

ori $t6, $t6, 7
mult $t6, $t2
mflo $t6

sub $t7, $t4, $t5
add $t7, $t7, $t6
subi $t7, $t7, 13

sw $t7, 0x0008($t0)


# Faça um programa que calcule o seguinte polinômio usando o método de Horner: y = 9a^3 - 5a^2 + 7a + 15
# Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada
# valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space
# 4). Utilize as duas primeiras posições da memória .data para armazenar,
# consecutivamente, a e y, iniciando o código com:
# Observe como o método de Horner é mais eficiente (faz menos operações) que
# calcular o polinômio de forma sequencial.


# y = 9a^3 - 5a^2 + 7a + 15

.data

 a: .word 3
 y: .space 4
 
.text

lui $t0, 0x1001
lw $t1, 0x0000($t0)

mult $t1, $t1 # 3 * 3
mflo $t2 # = 9
mult $t1, $t2 # 9 * 3 
mflo $t2 # = 27

ori $t3, $zero, 9 # = 9
mult $t3, $t2 # 9 *27
mflo $t3 # = 243

ori $t4, $zero, 5 # = 5
mult $t1, $t1 # 3 * 3
mflo $t5 # = 9
mult $t4, $t5 # 5 * 9
mflo $t4 # = 45

ori $t5, $zero, 7 # = 7
mult $t5, $t1 # 7 * 3
mflo $t5 # = 21

sub $t6, $t3, $t4 # 243 - 45 = 198
add $t6, $t6, $t5 # 198 + 21 = 219
addi $t6, $t6, 15 # 219 + 15 = 234

sw $t6, 0x0004($t0)

#### falta finalizar

# Faça um programa que calcule o seguinte polinômio usando o método de Horner: y = - ax^4 + bx^3 - cx^2 + dx - e
# Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado
# y. Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado
# (.space 4). Utilize as sete primeiras posições da memória .data para armazenar,
# consecutivamente, a, b, c, d, e, x e y, iniciando o código com:

.data

 a: .word -3
 b: .word 7
 c: .word 5
 d: .word -2
 e: .word 8
 x: .word 4
 y: .space 4
 
.text

lui $t0, 0x1001
lw $t1, 0x0000($t0) # A
lw $t2, 0x0004($t0) # B
lw $t3, 0x0008($t0) # C
lw $t4, 0x000C($t0) # D
lw $t5, 0x0010($t0) # E
lw $t6, 0x0014($t0) # X

mult $t6, $t6 # x * x
mflo $t7 # = x^2
mult $t7, $t7 # x^2 * x^2
mflo $t7 # = x^4
mult $t7, $t1 # a * x^4
mflo $t7 # = a * x^4

mult $t6, $t6 # x * x
mflo $t8 # = x^2
mult $t8, $t6 # x^2 * x
mflo $t8 # = x^3
mult $t8, $t2 # b * x^3
mflo $t8 # = b * x^3

mult $t6, $t6 # x * x
mflo $t9 # = x^2
mult $t9, $t3 # c * x^2
mflo $t9 # = c * x^2

subu $t7, $t8, $t7


# y = - ax^4 + bx^3 - cx^2 + dx - e