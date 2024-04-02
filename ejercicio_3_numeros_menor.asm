.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result_msg: .asciiz "El menor de los tres números es: "
newline: .asciiz "\n"

.text
main:
    # Imprimir el primer prompt
    li $v0, 4               # Cargar el código de la llamada al sistema para imprimir una cadena
    la $a0, prompt1         # Cargar la dirección de la cadena prompt1
    syscall                 # Llamar al sistema para imprimir la cadena
    
    # Leer el primer número
    li $v0, 5               # Cargar el código de la llamada al sistema para leer un entero
    syscall                 # Llamar al sistema para leer el número
    move $s0, $v0           # Guardar el primer número en $s0
    
    # Imprimir el segundo prompt
    li $v0, 4               # Cargar el código de la llamada al sistema para imprimir una cadena
    la $a0, prompt2         # Cargar la dirección de la cadena prompt2
    syscall                 # Llamar al sistema para imprimir la cadena
    
    # Leer el segundo número
    li $v0, 5               # Cargar el código de la llamada al sistema para leer un entero
    syscall                 # Llamar al sistema para leer el número
    move $s1, $v0           # Guardar el segundo número en $s1
    
    # Imprimir el tercer prompt
    li $v0, 4               # Cargar el código de la llamada al sistema para imprimir una cadena
    la $a0, prompt3         # Cargar la dirección de la cadena prompt3
    syscall                 # Llamar al sistema para imprimir la cadena
    
    # Leer el tercer número
    li $v0, 5               # Cargar el código de la llamada al sistema para leer un entero
    syscall                 # Llamar al sistema para leer el número
    move $s2, $v0           # Guardar el tercer número en $s2
    
    # Comparar los números para encontrar el menor
    move $t0, $s0           # Mover el primer número a $t0
    bgt $s1, $t0, check_s1  # Si el segundo número es menor que el primero, ir a check_s1
    move $t0, $s1           # Mover el segundo número a $t0
check_s1:
    bgt $s2, $t0, print_result  # Si el tercer número es menor que $t0, ir a print_result
    move $t0, $s2           # Mover el tercer número a $t0
    
print_result:
    # Imprimir el mensaje del resultado
    li $v0, 4               # Cargar el código de la llamada al sistema para imprimir una cadena
    la $a0, result_msg      # Cargar la dirección de la cadena result_msg
    syscall                 # Llamar al sistema para imprimir la cadena
    
    # Imprimir el número mayor
    move $a0, $t0           # Mover el número menor a $a0
    li $v0, 1               # Cargar el código de la llamada al sistema para imprimir un entero
    syscall                 # Llamar al sistema para imprimir el número
    
    # Imprimir una nueva línea
    li $v0, 4               # Cargar el código de la llamada al sistema para imprimir una cadena
    la $a0, newline         # Cargar la dirección de la cadena newline
    syscall                 # Llamar al sistema para imprimir la cadena
    
    # Salir del programa
    li $v0, 10              # Cargar el código de la llamada al sistema para salir
    syscall                 # Llamar al sistema para salir del programa
