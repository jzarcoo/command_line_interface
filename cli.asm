.data
    # Textos que se van a imprimir
    prompt: .asciiz "\nIntroduce un comando: "
    invalido: .asciiz "Comando no encontrado.\n"
    despedida: .asciiz "bye <3"
    helpMsg: .asciiz "Los comandos disponibles son:\n- help\n- cat\n- exit\n- mix\n- rev\n- song\n- det\n- log "
    arg_invalido_msg: .asciiz "Argumento inválido"
    salto_linea: 	.asciiz "\n"
    mensaje_error_archivo: 	.asciiz "Error al abrir o leer el archivo.\n"

    extra2HelpMsg: .asciiz "extra2: Comando extra 2"


    #Mensajes de los comandos
    # Mensajes al usuario
	salir_mensaje:	.asciiz	"¿Seguro que quieres salir?"
	error_mensaje:	.asciiz "comando no encontrado...\n"
	# Canciones
	cancion0:	.asciiz	"Europe - Final Countdown\n"
	cancion1:	.asciiz	"Bon Jovi - Livin' on a Prayer\n"
	cancion2:	.asciiz	"Survivor - Eye of the Tiger\n"
	cancion3:	.asciiz	"Guns N' Roses - Sweet Child o' Mine\n"
	# 'Arreglo' de apuntadores a las canciones
	canciones:     	.word	cancion0, cancion1, cancion2, cancion3
    # determinante
	valor_mensaje_determinante:	.asciiz	"Ingresa un valor para la matriz: "
	size_mensaje_determinante:	.asciiz	"Ingresa el tamaño de la matriz (n x n): "
	resultado_mensaje_determinante:	.asciiz "El determinante es: "
	error_limite_determinante:	.asciiz  "Solo se calcular determinantes de matrices n x n con n={1,2,3} :("
	error_mensaje_determinante:	.asciiz "Error en la entrada. Saliendo...\n"
    determinante_resultado:	.double	0.0	# Almacena el resultado del determinante
    determinante_submatriz: 	.double 0.0 	# Determinante de la submatriz


######3log 

error_msg: .asciiz "Error al abrir el archivo.\n"
pedir_cadena: .asciiz "Introduce una cadena: "
archivo_log: .asciiz "log.txt" # archivo default para guardar los mensajes
msg_log: .space 256       # Buffer para el mensaje del usuario
final_te: #guarda el final de la cadena del usuario
salto: .asciiz "\n"
guion: .asciiz " - "
sep: .asciiz ":"          # Cadena para el separador

buffer_hora: .space 3     # Espacio para hora en formato cadena 
buffer_minuto: .space 3   # Espacio para minuto en formato cadena
buffer_seg: .space 3      # Espacio para segundo en formato cadena 


## NOTAS PARA LA CANCIÓN "Será porque te amo"
.data

# sol 67
# la 69
# do 72
# si 71
# re 74

notas_p1:
# sol sol sol la si sol sol la do si la sol
.word 67, 67, 67, 69, 71, 67, 67, 69, 72, 71, 69, 67
duraciones_p1:
.word 400, 380, 370, 650, 300, 350, 350, 350, 400, 340, 360, 330
volumen_p1:
.word 70, 70, 70, 100, 60, 70, 70, 95, 60, 70, 95, 60

notas_p2:
# la la la si do la la si re do si la
.word 69, 69, 69, 71, 72, 69, 69, 71, 74, 72, 71, 69
duraciones_p2:
.word 400, 400, 400, 650, 400, 330, 430, 400, 400, 340, 360, 330
volumen_p2:
.word 70, 70, 70, 95, 100, 70, 70, 95, 60, 100, 95, 60

notas_p3:
# sol sol sol la la la sol
.word 67, 67, 67, 69, 69, 69, 67
duraciones_p3:
.word 410, 400, 300, 400, 380, 300, 500
volumen_p3:
.word 80, 60, 70, 80, 60, 70, 100

notas_p4:
# si si si si sol la sol
.word 71, 71, 71, 71, 67, 69, 67
duraciones_p4:
.word 200, 200, 200, 200, 350, 330, 430
volumen_p4:
.word 100, 100, 100, 100, 50, 80, 60

notas_p5:
# do do do
.word 84, 84, 84
duraciones_p5:
.word 280, 280, 280
volumen_p5:
.word 70, 70, 70

notas_p6:
# do do
.word 84, 84
duraciones_p6:
.word 280, 280
volumen_p6:
.word 70, 70

notas_p7:
# si si la
.word 83, 83, 69
duraciones_p7:
.word 270, 270, 500
volumen_p7:
.word 70, 60, 100

notas_p8:
# la si do si la sol
.word 69, 71, 72, 71, 69, 67
duraciones_p8:
.word 390, 390, 390, 650, 400, 330
volumen_p8:
.word 70, 70, 70, 95, 100, 70


# Nodos del árbol
node_help:
    handler:        .word helpHandler
    izq:            .word node_det
    der:            .word node_mix
    comando:        .asciiz "help"
    helpHelpMsg:    .asciiz "help: Muestra los comandos disponibles si es llamado sin argumentos. Si se llama con un argumento de la forma help [arg], muestra la  ayuda específica para el comando arg."

node_cat:
    handler1:       .word catHandler
    izq1:           .word 0
    der1:           .word 0
    comando1:       .asciiz "cat"
    .space 1
    catHelpMsg:     .asciiz "cat: Concatena dos archivos y muestra el resultado en pantalla.\nSe llama con la forma cat [archivo1] [archivo2]."

node_exit:
    handler2:       .word exitHandler
    izq2:           .word 0
    der2:           .word 0
    comando2:       .asciiz "exit"
    exitHelpMsg:    .asciiz "exit: Pregunta al usuario si quiere terminar la ejecuciónn del programa."

node_det:
    handler6:       .word detHandler
    izq6:           .word node_cat
    der6:           .word node_exit
    comando6:       .asciiz "det"
    .space 1
    detHelpMsg:     .asciiz "det: Calcula el determinante de una matriz cuadrada (n x n) con n={1,2,3}."

node_mix:
    handler3:       .word mixHandler
    izq3:           .word node_log
    der3:           .word node_rev
    comando3:       .asciiz "mix"
    .space 1
    mixHelpMsg:     .asciiz "mix:  Muestra recomendación de una canción aleatoria."

node_rev:
    handler4:       .word revHandler
    izq4:           .word 0
    der4:           .word node_song
    comando4:       .asciiz "rev"
    .space 1
    revHelpMsg:     .asciiz "rev:  Imprime la reversa de una cadena. Si no se especifica un archivo, se utiliza la entrada estándar (solo una línea). Su uso es rev [archivo]"

node_song:
    handler5:       .word songHandler
    izq5:           .word 0
    der5:           .word 0
    comando5:       .asciiz "song"
    songHelpmsg:    .asciiz "Song: escucha canciones."

node_log:
    handler7:       .word logHandler
    izq7:           .word 0
    der7:           .word 0
    comando7:       .asciiz "log"
    .space 1
    logHelpmsg:    .asciiz "Log: Log [archivo] agrega un mensaje con la hora a la que se escribió en el archivo.\n Si no se especifica archivo se guarda en log.txt"


root: .word node_help

buffer_comando: .space 32  # Almacena el comando principal
buffer_arg1:   .space 32  # Almacena el primer argumento
buffer_arg2:   .space 32  # Almacena el segundo argumento
buffer: .space 32
buffer_archivo: 	.space	256	

# Imprime una cadena cuando se la pasan directamente.
# @param s: La cadena a imprimir
.macro imprime_cadena_tex(%s)
	.data
		macro_str:	.asciiz	%s
	.text
		li	$v0 4		# Opcode: Imprime cadena
		la	$a0 macro_str	# Cadena a imprimir
		syscall
.end_macro

# Imprime una cadena cuando se le pasa un registro
# @param s: La cadena a imprimir
.macro imprime_cadena_registro(%s)
	li	$v0 4	# opcode: Imprime cadena
	la	$a0 %s	# Cadena a imprimir
	syscall
.end_macro

.macro imprime_cadena(%s)
	li	$v0 4	# opcode: Imprime cadena
	move	$a0 %s	# Cadena a imprimir
	syscall
.end_macro

# Abre el archivo
# @param ruta: Nombre del archivo a abrir
.macro abre_archivo(%ruta)
	li	$v0 13			# opcode 13: Abre el archivo
	move	$a0 %ruta		# Nombre del archivo a leer
	li	$a1 0                   # Modo de apertura: lectura (0)
 	li	$a2 0                   # Permisos por defecto
  	syscall
  	move 	$s0 $v0               	# Guardar el descriptor del archivo en $s0
  	bltz 	$s0 io_error            	# Si el descriptor es negativo, salta a error
.end_macro

# Lee contenido del archivo
# @param buffer: Dirección del buffer para guardar el contenido
.macro lee_archivo(%buffer)
	li 	$v0 14                  	# opcode 14: lee del archivo
  	move 	$a0 $s0               	# Descriptor del archivo
  	la 	$a1 %buffer      	# Dirección del buffer para el contenido
  	li 	$a2 256                 	# Tamaño máximo de lectura
  	syscall
  	move 	$t0 $v0               	# Número de bytes leídos
  	blez 	$t0 io_error             # Si no se leyó nada, salta a error
.end_macro

# Cierra el archivo
# @param descriptor: Descriptor del archivo
.macro cierra_archivo(%descriptor)
  	li 	$v0 16                  # opcode 16: cierra el archivo
  	move 	$a0 %descriptor         # Descriptor del archivo
  	syscall
.end_macro

.macro verificaHayArg(%arg)
    la $t0, %arg     # Cargar dirección del argumento
    lb $t1, 0($t0)            # Leer el primer carácter
    beqz $t1 arg_invalido_com    # Si es nulo, argumento inválido
.end_macro

.macro imprimeError(%msg)
    li	$v0 55			# Imprime mensaje de error
    la	$a0 %msg	# Mensaje de error
    li	$a1 0			# Argumento 0: Mensaje de error
    syscall
.end_macro



.macro tocar_parte(%n, %d, %v, %i)
    la $t0, %n        # Dirección de las notas
    la $t1, %d        # Dirección de las duraciones
    la $t2, %v        # Dirección de los volúmenes
    li $t3, %i        # Número total de notas
    li $s0, 0         # Contador de notas

bucle:
    lw $a0, 0($t0)    # Nota MIDI (pitch)
    lw $a1, 0($t1)    # Duración en milisegundos
    lw $a3, 0($t2)    # Volumen
    li $a2, 0         # Instrumento (ejemplo: piano)

    li $v0, 31               # Syscall 33: Reproducir y esperar
    syscall
    li $v0 32
    li $a0 1
    syscall        

    # Avanzar punteros y contador
    addi $t0, $t0, 4   # Siguiente nota
    addi $t1, $t1, 4   # Siguiente duración
    addi $t2, $t2, 4   # Siguiente volumen
    addi $s0, $s0, 1   # Incrementar contador

    blt $s0, $t3, bucle  # Si aún quedan notas, continuar
.end_macro

.macro espera(%i)
li $v0 32
 li $a0 %i
 syscall  
.end_macro



.text

.globl main

main:

    # Pedir comando
    imprime_cadena_registro(prompt)

    # Leer entrada del usuario y guardar en buffer
    li $v0 8
    la $a0 buffer
    li $a1 32
    syscall


    # Procesar entrada para extraer comando y argumentos
    jal parse_input
    
##################



    # Llamar a busqueda con los argumentos a3 y a2
    lw $a3 root # Nodo que se compara, primero la raíz
    la $a2 buffer_comando   # Comando del usuario
    jal busqueda # regresa en v0 la dirección del handler si se encuentra, 0 si no.

    # Comando no encontrado
    beqz $v0 comandoInvalido

    # Comando encontrado, ejecutar handler
    jalr $v0
    
    
    # Regresar al inicio
    j main

# Impresión de mensaje de comando no encontrado y regreso al inicio
comandoInvalido:
    imprimeError(error_mensaje)
    jal  main

# Subrutina: busqueda
# Entrada:
#   $a3 - Dirección del nodo actual
#   $a2 - Comando a buscar ingresado por el usuario
# Salida:
#   $v0 - Dirección del handler si se encuentra, 0 si no.
busqueda:
    addi $sp $sp -16  # Reservar espacio en la pila
    sw $ra 0($sp)       # Guardar dirección de retorno
    sw $a3 4($sp)       # Guardar $a3 (nodo actual)
    sw $a2 8($sp)       # Guardar $a2 palabra a buscar
    sw $s0 12($sp)       # Guardar $s0 (temporal)
	
    # Verificar si el nodo es nulo, si es así, retornar 0 pues llegamos al final del árbol
    beqz $a3 nodo_no_encontrado

    # Comparar comando del nodo con el comando ingresado
    la $a1 12($a3)  # Cargar dirección del comando del nodo

    jal strcmp        # Comparar cadenas 
    beqz $v0 nodo_encontrado  # Si son iguales, pasar a ejecutar el handler



    # Decidir si buscar en el subárbol izquierdo o derecho
    bgtz $v0 buscaDerecha  # Si el comando ingresado es mayor, ir a la derecha
    # caso contrario el comando ingresado es menor, ir a la izquierda
    lw $a3 4($a3)         # Cargar subárbol izquierdo
    jal busqueda         # Llamar recursivamente
    j final_arbol     # Salir de la subrutina
    
buscaDerecha:
    lw $a3 8($a3)         # Cargar subárbol derecho
    jal busqueda         # Llamar recursivamente
    j final_arbol      # Salir de la subrutina

nodo_no_encontrado:
    # el nodo es nulo
    li $v0 0             # Retornar 0 si no se encontró
    j final_arbol        # Salir de la subrutina

nodo_encontrado:
    lw $v0 0($a3)  # Cargar dirección del handler
    la $v1 0($a3) 

final_arbol:
    lw $s0 12($sp)        # Restaurar $s0
    lw $a2 8($sp)        # Restaurar $a0
    lw $a3 4($sp)        # Restaurar $a0
    lw $ra 0($sp)        # Restaurar dirección de retorno
    addi $sp $sp 16     # Liberar espacio en la pila
    jr $ra            # Regresar

# Subrutina: strcmp
# Entrada:
#   $a1 - Nodo de la cadena a comparar
#   $a2 - Comando a buscar ingresado por el usuario
# Salida:
#   $v0 - es 0 si las cadenas son iguales, un numero negstivo
# $a1 es mas grande, un numero positivo si $a2 es mas grande
strcmp:

    addi $sp $sp -16    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $a2 8($sp)        # Guardar parametro 2
    sw $s0 12($sp)        # Guardar $s0
    move $s0 $zero       # Inicializar resultado en 0
    
strcmpLoop:
    lb $t0 0($a2)       # Cargar caracter de la cadena 1
    lb $t1 0($a1)    # Cargar caracter de la cadena 2
    bne $t0 $t1 dif # Si los caracteres son diferentes, salir del loop, las cadenas son diferentes
	
    beqz $t0 equal    # Si el caracter es nulo, salir del loop, las cadenas son iguales
    addiu $a2 $a2 1 # Incrementar puntero de la cadena 1
    addiu $a1 $a1 1 # Incrementar puntero de la cadena 2
    j strcmpLoop      # Volver a comparar los caracteres

dif:
    sub $s0 $t0 $t1 # Calcular la diferencia entre los caracteres para determinar el orden
    lw $a2 8($sp)    # Restaurar parametro 2
    j endStrcmp     # Salir de la subrutina

equal: 
    move $s0 $zero # Las cadenas son iguales entonces el resultado es 0

endStrcmp:
    move $v0 $s0 # Guardar resultado en $v0
    lw $s0 12($sp) # Restaurar $s0
    lw $a2 8($sp) # Restaurar parametro 2
    lw $a1 4($sp) # Restaurar parametro 1
    lw $ra 0($sp) # Restaurar dirección de retorno
    addi $sp $sp 16 # Liberar espacio en la pila
    jr $ra # Regresar

# separar la entrada del usuario 
parse_input:
    # Inicializa punteros
    la $t0, buffer          # Apunta al inicio del buffer original
    la $t1, buffer_comando  # Apunta al buffer para el comando
    la $t2, buffer_arg1     # Apunta al buffer para arg1
    la $t3, buffer_arg2     # Apunta al buffer para arg2

    # Fase 1: Leer el comando antes del primer espacio o salto de línea
parse_command:
    lb $t4, 0($t0)          # Carga un byte del buffer original
    beqz $t4, end_parse     # Si llegamos al final, terminar
    beq $t4, 10, end_parse  # Si es un salto de línea (\n), terminar
    beq $t4, 32, parse_arg1 # Si es un espacio, pasar a arg1
    sb $t4, 0($t1)          # Guardar en buffer_comando
    addiu $t0, $t0, 1       # Avanzar en el buffer original
    addiu $t1, $t1, 1       # Avanzar en buffer_comando
    j parse_command

    # Fase 2: Leer el primer argumento (arg1)
parse_arg1:
    addiu $t0, $t0, 1       # Saltar el espacio
arg1Loop:
    lb $t4, 0($t0)          # Leer siguiente carácter
    beqz $t4, end_parse     # Si llegamos al final, terminar
    beq $t4, 10, end_parse  # Si es un salto de línea (\n), terminar
    beq $t4, 32, parse_arg2 # Si es un espacio, pasar a arg2
    sb $t4, 0($t2)          # Guardar en buffer_arg1
    addiu $t0, $t0, 1       # Avanzar en el buffer original
    addiu $t2, $t2, 1       # Avanzar en buffer_arg1
    j arg1Loop

    # Fase 3: Leer el segundo argumento (arg2)
parse_arg2:
    addiu $t0, $t0, 1       # Saltar el espacio
arg2Loop:
    lb $t4, 0($t0)          # Leer siguiente carácter
    beqz $t4, end_parse     # Si llegamos al final, terminar
    beq $t4, 10, end_parse  # Si es un salto de línea (\n), terminar
    sb $t4, 0($t3)          # Guardar en buffer_arg2
    addiu $t0, $t0, 1       # Avanzar en el buffer original
    addiu $t3, $t3, 1       # Avanzar en buffer_arg2
    j arg2Loop

end_parse:
    sb $zero, 0($t1)        # Asegura que buffer_comando termine en NULL
    sb $zero, 0($t2)        # Asegura que buffer_arg1 termine en NULL
    sb $zero, 0($t3)        # Asegura que buffer_arg2 termine en NULL
    jr $ra                  # Regresar

    
# Handlers de los comandos
helpHandler:
    addi $sp $sp -12    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $s0 8($sp)        # Guardar $s0
    move $s0 $zero       # Inicializar resultado en 0
    # Verifica si el argumento 2 no es vacío para mostrar error
    la $t0, buffer_arg2       # Cargar dirección del argumento 2
    lb $t1, 0($t0)            # Leer el primer carácter
    bnez $t1 arg_invalido    # Si no es nulo, argumento inválido

    # Verifica si el argumento 1 es nulo
    la $t0, buffer_arg1       # Cargar dirección del argumento 1
    lb $t1, 0($t0)            # Leer el primer carácter
    beqz $t1 help_comandos # Si es nulo, mostrar ayuda general

    # Busca ayuda específica del comando(arg1)
    la $a2, buffer_arg1       # Cargar argumento 1 (nombre del comando)
    lw $a3, root              # Cargar raíz del árbol
    jal busqueda              # Buscar nodo correspondiente
    beqz $v0 arg_invalido # Si no encuentra el nodo, mostrar error
   

    # Imprime la ayuda del comando específico
    move $s0 $v1 # aqui tengo guardada la diireccion del nodo 
    addi $s0 $s0 17# aqui tengo la direccion del nodo +16 que es la direccion de la cadena
    move $a0 $s0         # quiero cargar en v0 el valor de s0 porque ese valor en si mismo es una dirección
    li $v0, 4                 # Imprimir cadena
    syscall
    
terminar_help:
    lw $s0 8($sp) # Restaurar $s0
    lw $a1 4($sp) # Restaurar parametro 1
    lw $ra 0($sp) # Restaurar dirección de retorno
    addi $sp $sp 12 # Liberar espacio en la pila
    jr $ra # Regresar

help_comandos:
    # Imprime el mensaje general de ayuda
    la $a0, helpMsg
    li $v0, 4
    syscall
    j terminar_help                 # Terminar

arg_invalido :
    # Argumento no válido
    imprimeError(arg_invalido_msg)
    j terminar_help                   # Terminar

exitHandler:
    # Pregunta al usuario si quiere salir
    # Crea dialogo
	li 	$v0 50			# Dialogo de Confirmación
	la	$a0 salir_mensaje	# Mensaje
	syscall
	# $a0 contiene la opcion del usuario del diálogo de confirmación
	# 0: Yes
	# 1: No
	# 2: Cancel
	beqz 	$a0 exit
    jr $ra
# Termina la ejecución del programa

exit:
    imprime_cadena_registro(despedida)
	li	$v0 10		# opcode 10: Terminar ejecución
	syscall
    
    
mixHandler:
    addi $sp $sp -12    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $s0 8($sp)        # Guardar $s0
    
    la $t0, buffer_arg1       # Cargar dirección del argumento 
    lb $t1, 0($t0)            # Leer el primer carácter
    bnez $t1 arg_invalido_com    # Si no es nulo, argumento inválido
    
  
    li 	$v0 42		# Rango int aleatorio
	li	$a1 4		# Cota superior 0 <= [int] < [4]
    syscall			# Guarda int aleatorio en $a0
    # Cargar la dirección de la canción seleccionada
    la 	$t1 canciones	# Guarda la 	j loopdirección de 'canciones' en $t1
    sll	$t2 $a0 2	# Multiplica el índice aleatorio por 4 (tamaño de word)
    add	$t2 $t2 $t1	# $t2 += $t1
    lw	$a0 ($t2)	# Carga la dirección de la cadena seleccionada
	# Imprime canción
	li      $v0 4           # opcode 4: imprime cadena $a0
	syscall
terminar_com:
    lw $s0 8($sp) # Restaurar $s0
    lw $a1 4($sp) # Restaurar parametro 1
    lw $ra 0($sp) # Restaurar dirección de retorno
    addi $sp $sp 12 # Liberar espacio en la pila
    jr $ra # Regresar

 arg_invalido_com:
   
    imprimeError(arg_invalido_msg)
    j terminar_com                  # Terminar

revHandler:
    # stack frme
    addi $sp $sp -12    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $s0 8($sp)        # Guardar $s0
    
    ## ver que el argumento dos sea vacio
    la $t0, buffer_arg2      # Cargar dirección del argumento 
    lb $t1, 0($t0)            # Leer el primer carácter
    bnez $t1 arg_invalido_com    # Si no es nulo, argumento inválido
    
    ## si el argumento 1 es vacio procede a pedir la entrada estandar del usuario  y ponerlo en un buffer 
    la $t0, buffer_arg1      # Cargar dirección del argumento 
    lb $t1, 0($t0)            # Leer el primer carácter
    beqz $t1 pedir_entrada   # Si no nulo, pasa a pedir entrada estandar y el resultado se guarda en buffer archivo

    ##el arg1 es no vacio, procede a abrir el archivo y leerlo
    ## pasar a cadena el buffer
    la $t0, buffer_arg1      # Cargar dirección del argumento
    abre_archivo($t0)	# Abre el archivo para leer
    lee_archivo(buffer_archivo)	# Lee contenido del archivo

procesa_rev:
    la 	$t0 buffer_archivo	# Carga la dirección del buffer a $t0
    li	$t1 0			# Indice para recorrer el archivo

# Busca el final del archivo
# @param $t0: Apunta al inicio del archivo
# @param $t1: 0
busca_final: # while $t1 != '\0' and $t1 < 256:
	add	$t2 $t1 $t0		# $t2:=$t1 bytes adelante de la dirección del buffer
    	lb 	$t3 0($t2)           	# Leer byte de la dirección $t2 a $t3
    	beqz 	$t3 invertir		# Si es nulo, salta
    	beq	$t1 256 invertir		# Si leyó los el máximo número de caracteres, salta
    	addi 	$t1 $t1 1		# Incrementa longitud
    	j 	busca_final
    	
# Mueve $t1 a la dirección final del archivo
# @param $t0: Apunta al inicio del archivo
# @param $t1: Cantidad de bytes del archivo
invertir: 
    	add 	$t1 $t0 $t1             # $t1 Apunta al final del archivo (caracter nulo)
    	
  
# Imprime en reversa el archivo
# @param $t0: Apunta al inicio del archivo
# @param $t1: Va de atrás hacia adelante
imprimir_reversa:
	# Calcula caracter
    	subi 	$t1 $t1 1			# Retrocede un byte
	# Lee caractér
    	lb 	$t2 0($t1)			# Lee un byte
    	beqz 	$t2 fin_reversa			# Si es caracter nulo, termina
    	# Imprime caracter
    	li	$v0 11				# opcode 11: imprime caracter
    	move 	$a0 $t2				# Byte a imprimir
    	syscall
    	# Mientras $t1 != $t0
    	bne 	$t1 $t0 imprimir_reversa		# Repite mientras no llegue al inicio

# Fin del comando reversa
fin_reversa:
    	imprime_cadena_registro(salto_linea)	# Imprime salto de línea al final
  	cierra_archivo($s0)			# Cierra el archivo
  	## limpir pila y regresar al del registro
  	j terminar_com

# Error de entrada y salida de archivos
io_error:
    imprimeError(mensaje_error_archivo)
    j terminar_com


pedir_entrada:
    # Pedir entrada al usuario
    imprime_cadena_tex("Introduce una cadena: ")
    li $v0 8
    la $a0 buffer_archivo
    li $a1 256
    syscall
    j procesa_rev


# Concatena 2 archivos y los muestra en pantalla.
# Sinopsis: cat file [file]
# Argumentos: file - Archivo a concatenar.
# TODO: Recuperar los nombres de los archivos de la entrada estándar (estoy suponiendo que la ruta existe en 'archivo_ruta')
catHandler:
    #stack frame
    addi $sp $sp -12    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $s0 8($sp)        # Guardar $s0

    ## verficar que hay archivo 1 y archivo 2
    verificaHayArg(buffer_arg1)
    verificaHayArg(buffer_arg2)
    ## si hay archivos procede a abrirlos y concatenarlos
    ## ponemos en un .asciiz la ruta del archivo
    la $t0, buffer_arg1      # Cargar dirección del argumento
    la $t1, buffer_arg2      # Cargar dirección del argumento
	# Archivo 1
	abre_archivo($t0)		# Abre el archivo para leer
	lee_archivo(buffer_archivo)		# Lee contenido del archivo
	imprime_cadena_registro(buffer_archivo)	# Imprime el contenido del archivo
    imprime_cadena_registro(salto_linea)	# Imprime salto de línea al final
    cierra_archivo($s0)			# Cierra el archivo
	# Archivo 2
	abre_archivo($t1)		# Abre el archivo para leer
	lee_archivo(buffer_archivo)		# Lee contenido del archivo
	imprime_cadena_registro(buffer_archivo)	# Imprime el contenido del archivo
    imprime_cadena_registro(salto_linea)	# Imprime salto de línea al final
    cierra_archivo($s0)			# Cierra el archivo
	



songHandler:
     #stack frame
    addi $sp $sp -12    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $s0 8($sp)        # Guardar $s0
    
    imprime_cadena_tex("Reproduciondo Será porque te amo :)") 
    
    tocar_parte(notas_p1, duraciones_p1, volumen_p1, 12)
    espera(1400)
    tocar_parte(notas_p1, duraciones_p1, volumen_p1, 12)
    espera(700)
       
    tocar_parte(notas_p2, duraciones_p2, volumen_p2, 12)
    espera(300) 
    tocar_parte(notas_p2, duraciones_p2, volumen_p2, 12)
    espera(700)
     espera(500)
    tocar_parte(notas_p3, duraciones_p3, volumen_p2, 7)
    espera(300)
	tocar_parte(notas_p4, duraciones_p4, volumen_p4, 7)
	espera(300)
	tocar_parte(notas_p3, duraciones_p3, volumen_p2, 7)
	espera(300)
	tocar_parte(notas_p4, duraciones_p4, volumen_p4, 7)
	
	espera(300)
	tocar_parte(notas_p3, duraciones_p3, volumen_p2, 7)
	espera(300)
	tocar_parte(notas_p5, duraciones_p5, volumen_p5, 3)
	tocar_parte(notas_p6, duraciones_p6, volumen_p5,2)
	tocar_parte(notas_p7, duraciones_p7, volumen_p7,3)
	espera(300)
	
	tocar_parte(notas_p5, duraciones_p5, volumen_p5, 3)
	espera(300)
	tocar_parte(notas_p7, duraciones_p7, volumen_p7,3)
	espera(300)
	tocar_parte(notas_p8, duraciones_p8, volumen_p8,6)
	espera(22000)
        j terminar_com
    
detHandler:
    # stack frme
    addi $sp $sp -12    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $s0 8($sp)        # Guardar $s0
# Lee el tamaño de la matriz
	li	$v0 51				# InputDialogDouble
	la 	$a0 size_mensaje_determinante
	syscall					# $a0 := n tamaño de la matriz
    	bnez 	$a1 error_determinante 		# Error de lectura
    	move 	$t0 $a0      			# Guarda el tamaño de la matriz en $t0 := n        
    	li 	$t7 3				# 3 es el limite
    	sub	$t7 $t7 $t0			# 3-n
    	bltz	$t7 no_me_la_se
    	# Verificar tamaño válido
    	beqz 	$t0 error_determinante 		# Error número inválido
    	blez 	$t0 error_determinante 		# Error número inválido
    	# Reservar memoria para la matriz (tamaño dinámico)
    	mul 	$t1 $t0 $t0                	# $t1 = n * n (total de elementos)
    	mul 	$t1 $t1 8                  	# $t1 = n * n * 8 (bytes necesarios para doubles)
    	# Solicitar memoria dinámica
    	li 	$v0 9                        	# sbrk (allocate heap memory)
    	move 	$a0 $t1                    
    	syscall					# $v0 := contains address of allocated memory
    	# Guarda la dirección de la matriz
    	move 	$s0 $v0  			# Guardar la dirección de la matriz en $t2 (inicio)
    	move 	$t2 $v0                    	# Guardar la dirección de la matriz en $t2 (va a cambiar)
    	li 	$t3 0                        	# Contador para los valores leídos
    	mul 	$t4 $t0 $t0                	# $t1 = n * n (total elementos)
# Pide los valores para las entradas de la matriz
# $t1 total de elementos
# $t2 guarda la dirección de la matriz
# $t3 contador de valores leídos
lee_valores_matriz:
	# Lee el valor
	li	$v0 53				# InputDialogDouble
    	la 	$a0 valor_mensaje_determinante	# Mensaje al usuario
	syscall					# $f0 := input del usuario
    	bnez 	$a1 error_determinante 		# Error de lectura
    	sdc1 	$f0 0($t2)                 	# Almacenar el double en la matriz
    	# Siguiente
    	addiu 	$t2 $t2 8                	# Avanzar 8 bytes para el siguiente double
    	addiu 	$t3 $t3 1                	# Incrementar contador
    	bne 	$t3 $t4 lee_valores_matriz	# Repetir hasta leer todos los valores
# Calcula el determinante
# $s0 dirección de la matriz
# $t0 tamaño de la matriz
calcula_determinante:
	# Llamar a la subrutina para calcular el determinante
	move 	$a0 $s0                   	# Dirección de la matriz _8_._._._._.
	move 	$a1 $t0                   	# Tamaño de la matriz n
	move	$s2 $s0
	move 	$s1 $a1
    	jal 	det				# Llamar a la subrutina
    	# Mostrar el mensaje de resultado
	li	$v0 4					# Imprime cadena
    	la 	$a0 resultado_mensaje_determinante 	# Mensaje de resultado
    	syscall
    	# Mostrar el resultado
    	li 	$v0 3                        	# Imprime doble
    	sub	$t1 $v0	$s1			# $t1 = $v0 - $a1 (3-n)
    	beqz	$t1 n_3				# Si n = 3
    	ldc1 	$f12 determinante_submatriz	# Si n = 1 o 2 carga determinante_submatriz
    	j 	calcula_determinante_fin
# Si n=3 carga determinante_resultado
n_3:
    	ldc1 	$f12 determinante_resultado      # Cargar el resultado
    	j	calcula_determinante_fin
# NO sabe calcular determinantes con n>3
no_me_la_se:
	li	$v0 4				# Imprime cadena
	la	$a0 error_limite_determinante
	syscall
    	j	terminar_com
    	
# Imprime el resultado
calcula_determinante_fin:
    	syscall
    	j	terminar_com
# Subrutina para calcular el determinante por cofactores 'recursivamente'
# $a0 dirección de la matriz ($s2)
# $a1 tamaño de la matriz
# $s0, $s1
det:
	sub 	$sp $sp 24	# Creamos tres espacios vacíos
	sw 	$ra 0($sp)	# Dirección de regreso
	sw 	$a0 4($sp)	# $a0 dirección de la matriz
	sw 	$a1 8($sp)	# $a1 tamaño de la matriz
	sw	$s0 12($sp)
	sw	$s1 16($sp)
	sw	$s2 20($sp)
	# Casos base
    	beq 	$a1 1 base_uno
    	beq 	$a1 2 base_dos
    	# Respaldo de $a0 y $a1
    	#move 	$s0 $a0 		# Dirección original
    	#move 	$s1 $a1 		# Tamaño original
	# Reservar espacio para submatriz temporal
    	subi 	$t4 $s1 1 	# Tamaño submatriz = n-1
    	mul 	$a0 $t4 8	# $a0 = (n-1) * 8 total de elementos de submatriz
    	li 	$v0 9		# Solicitar memoria dinámica
    	syscall 			# $v0 guarda la dirección de la submatriz 
    	# Respaldo $v0
    	move 	$a2 $v0 		# Direccion de submatriz n-1
    	# Restaura $a0 y $a1
    	move 	$a0 $s0 		# Direccion original n
    	move 	$a1 $s1 		# Tamaño original n
    	# Iteración:
	li 	$a3 0		# Índice de la columna actual
# Ciclo para calcular el determinante
# a0,s0 direccion original
# a1,s1 tamaño original 
# t4 tamaño submatriz n-1
# a2,t2 direccion submatriz 8*(n-1)
# a3 indice de la columna a eliminar
det_ciclo:
	# Extraer cofactor
    	jal 	extrae_submatriz	# Submatriz en $a2
    	# Determinante recursivo
    	move 	$a0 $a2		# Dirección submatriz
    	move 	$a1 $t4		# Tamaño submatriz
	jal	det
	# Restaura direccion (a0) y tamaño (a1) original
    	move 	$a0 $s0		# Dirección submatriz
    	move 	$a1 $s1		# Tamaño submatriz
	# Carga el determinante
    	ldc1 	$f0 determinante_submatriz
    	# Signo, si la columna a eliminar ($a3) es impar, es negativo
	rem 	$t3 $a3 2	# $t3 = $a3 % 2
	beqz	$t3 det_resultado
	neg.d 	$f0 $f0

# Calcula el resultado del determinante
det_resultado:
	ldc1	$f2 0($s2)			# Cofactor
    	mul.d 	$f2 $f0 $f2			# det * cofactor
    	ldc1 	$f4 determinante_resultado	# Carga resultado
    	add.d 	$f4 $f4 $f2			# resultado = resultado + (det * cofactor)
    	sdc1 	$f4 determinante_resultado	# Guarda el resultado
    
# Avanza a la siguiente columna
avanza_columna:
	addi	$a3 $a3 1	# Siguiente columna
	beq	$a3 $a1 det_fin	# Termina
	addi	$s2 $s2 8	# Siguiente cofactor
	j 	det_ciclo
    
# Extrae una submatriz eliminando fila 0 y columna j
# Entrada:	
# 	$a0 = dirección matriz original
# 	$a1 = tamaño matriz original
# 	$a2 = dirección de la submatriz
# 	$a3 = índice de la columna a eliminar
# Salida:  
# 	$a2 = dirección de la submatriz
extrae_submatriz:
	sub 	$sp $sp 20	# Crea 5 espacios vacíos
	sw 	$ra 0($sp)	# Dirección de regreso   
	sw 	$a0 4($sp)	# Dirección de matriz original
	sw 	$a1 8($sp)	# Tamaño matriz original   
	sw 	$a2 12($sp)	# Dirección submatriz
	sw 	$a3 16($sp)	# Indice de columna a eliminar
	move 	$t3 $a3 		# Columna a eliminar
   	move 	$t0 $a0		# Inicio de la matriz original
    	move 	$t2 $a2		# Inicio de la submatriz  
	mul	$t1 $a1 $a1	# $t1 = n^2 = n * n cantidad de elementos
    	li 	$t5 0           # i := Contador de elementos [0,n^2] 
# Ciclo para extraer submatriz
extrae_ciclo:
	div	$t6 $t5 $a1		# Calcular fila i/n
    	mfhi 	$t7             		# Calcular columna (residuo de i/n)
    	beqz 	$t6 saltar_elemento	# Saltar si está en la fila 0
    	bne 	$t7 $t3 copiar_elemento	# Si no está en la columna eliminada, copiar
    	j	saltar_elemento
# Avanza al siguiente elemento
saltar_elemento:
	addi 	$t0 $t0 8		# Avanzar matriz original
	addi 	$t5 $t5 1 		# Avanzar contador de elementos
	j 	extrae_ciclo_fin
# Copia el elemento de la matriz original a la submatriz
copiar_elemento:
	ldc1 	$f2 0($t0)		# Leer elemento original
	sdc1 	$f2 0($t2)		# Escribir en la submatriz
	addi 	$t2 $t2 8		# Avanzar submatriz
	j	saltar_elemento
# Repite el ciclo de extraer o retorna
extrae_ciclo_fin:
	bne 	$t5 $t1 extrae_ciclo     # Repetir hasta el final de la matriz
	# Fin 
	lw 	$a3 16($sp)	# Recuperar $a3
	lw 	$a2 12($sp)  	# Recuperar $a2
     	lw    	$a1 8($sp)	# Recuperar el valor de $a1 de la pila
    	lw    	$a0 4($sp)	# Recuperar el valor de $a0 de la pila
    	lw    	$ra 0($sp)	# Recuperar el valor de $ra de la pila
    	addi  	$sp $sp 20	# Eliminar el marco
    	jr    	$ra
# Calcula el determinante de una matriz 1x1
# Guarda el determinante en $f0
base_uno:
	# load double word coprocessor 1
    	ldc1 	$f0 0($a0)		# Leer el único elemento
    	j 	det_fin
# Calcula el determinante de una matriz 2x2
# Guarda el determinante en $f0
base_dos:
	# load double word coprocessor 1
    	ldc1 	$f0 0($a0)	# Leer a
    	ldc1 	$f2 8($a0)	# Leer b
    	ldc1 	$f4 16($a0)	# Leer c
    	ldc1 	$f6 24($a0)	# Leer d
    	mul.d 	$f0 $f0 $f6	# a = a * d
    	mul.d 	$f2 $f2 $f4	# b = b * c
    	sub.d 	$f0 $f0 $f2	# a = a - b = (a * d) - (b * c)
    	j 	det_fin
# Retorno de det
# Guarda $f0 en det
det_fin:
	# Restaurar registros guardados
	sdc1 	$f0 determinante_submatriz	# Guarda determinante
	lw	$s2 20($sp)
	lw	$s1 16($sp)
	lw	$s0 12($sp)
    	lw    	$a1 8($sp)	# Recuperar el valor de $a1 de la pila
    	lw    	$a0 4($sp)	# Recuperar el valor de $a0 de la pila
    	lw    	$ra 0($sp)	# Recuperar el valor de $ra de la pila
    	addi  	$sp $sp 24	# Eliminar el marco
    	jr    	$ra
# Maneja el error de un determinante y luego termina el programa
error_determinante:
	li	$v0 4				# Imprime cadena
	la	$a0 error_mensaje_determinante
	syscall
	j	terminar_com



logHandler:
    addi $sp $sp -12    # Reservar espacio en la pila
    sw $ra 0($sp)        # Guardar dirección de retorno
    sw $a1 4($sp)        # Guardar parametro 1
    sw $s0 8($sp)        # Guardar $s0
    
     ## ver que el argumento dos sea vacio
    la      $t0, buffer_arg2      # Cargar dirección del argumento 
    lb      $t1, 0($t0)            # Leer el primer carácter
    bnez    $t1 arg_invalido_com    # Si no es nulo, argumento inválido
    
    #decidir archivo, poner en a0 la direccion al nombre del archivo
 ## si el argumento 1 es vacio procede a usar el archivo predeterminado 
    la      $t0, buffer_arg1      # Cargar dirección del argumento 
    lb      $t1, 0($t0)            # Leer el primer carácter
    beqz    $t1 cargar_buffer  # Si nulo, pasa a tomar el predeterminado
   
    ##el arg1 es no vacio, procede a cargar la direccion del buffer
   la $a0 buffer_arg1 
   j escribir_msg 
    
 cargar_buffer: 
    la $a0  archivo_log 
    
 escribir_msg:
 imprime_cadena($a0)
#########Sacar la marca del tiempo #################33
    # Obtener milisegundos desde epoch
    li $v0, 30
    syscall
  
    # Convertir milisegundos a segundos (a1:a0 = ms since epoch)
    li $a2, 1000
    jal div64  
    
    # quitar 6 horas para tener la hora de Mexico
    sub $a0 $a0 21600 # 6 horas en segundos
  
    # Calcular 12 horas(medios dias) desde epoch
    li $a2, 43200        # 12 horas en segundos
    jal div64

    # Obtener segundos en la mitad del día
    mfhi $s0             # guardar el residuo en s0 

    andi $a0, $a0, 1      # a0 = 1 si es número impar de medio día (de lo contrario, 0)
    ror $a0, $a0, 1       # a1 < 0 si es número impar de medio día (de lo contrario, 0)
    sra $a0, $a0, 31      # a1 = 0xffffffff si es número impar de medio día (de lo contrario, 0)
    andi $a0, $a0, 43200  # a1 = 43200 si es número impar de medio día (de lo contrario, 0)

    add $s0, $s0, $a0     # s0 = segundos en el día
    
    # Calcular hora, minutos y segundos
    li $t0, 3600         # 1 hora en segundos
    div $s0, $t0         # Dividir segundos en el día entre 3600
    mflo $s0              # Hora 
    
    mfhi $t1              # Resto de la división (segundos restantes)
    li $t0, 60            # 1 minuto en segundos
    div $t1, $t0           # Dividir segundos restantes entre 60
    mflo $s1              # Minuto 
    mfhi $s2              # El resto son los segundos
    
    
    
    # Convertir hora a cadena y luego imprimirla
    move $a3, $s0
    la $a2, buffer_hora
    jal conv_cadena

    # Convertir minutos a cadena y luego imprimirla
    move $a3, $s1
    la $a2, buffer_minuto
    jal conv_cadena

    # Convertir segudos a cadena y luego imprimirla
    move $a3, $s2
    la $a2, buffer_seg
    jal conv_cadena
    
    
     
    
    
    
    
    ############hasta aqui ok 
     la $a0, pedir_cadena   # Cargar mensaje en $a0
    li $v0, 4              # Syscall para imprimir cadena
    syscall

    la $a0, msg_log        # Cargar buffer para almacenar la cadena ingresada
    li $a1, 256            # Longitud máxima permitida
    li $v0, 8              # Syscall para leer una cadena
    syscall
    
    
    la $a0, archivo_log    # Cargar nombre del archivo
    li $a1, 9              # Modo escritura o creación
    li $a2, 0              # Permisos por defecto
    li $v0, 13             # Syscall para abrir archivo
    syscall

    move $s0, $v0          # Guardar descriptor del archivo en $s0
    bltz $s0,io_error  # Si hay error, salir




    move $a0, $s0          # Descriptor del archivo
    
    
    
     la $a1, buffer_hora       # Escribir la hora
    li $a2, 3            # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall

    la $a1, sep      # : como separador
    li $a2, 1           # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall

    la $a1, buffer_minuto       # Escribir minuto
    li $a2, 3            # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall

    la $a1, sep      # : como separador
    li $a2, 1           # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall

    la $a1, buffer_seg      # Escribir segundos
    li $a2, 4            # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall
    
    la $a1, guion       # - como separador
    li $a2, 3          # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall 
    
    la $a1, msg_log        # Mensaje ingresado por el usuario
    li $a2, 256            # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall

    la $a1, salto        # Salto de línea para separar mensajes
    li $a2, 1          # Longitud máxima del mensaje
    li $v0, 15             # Syscall para escribir en archivo
    syscall
    
    # Cerrar el archivo
    move $a0, $s0          # Descriptor del archivo
    li $v0, 16             # Syscall para cerrar archivo
    syscall
    
    
    j       terminar_com










































    
# División de 64 bits entre 16 bits. Mars no soporta la instrucción div con 64 bits.
# Por lo tanto, se divide en dos partes: 32 bits superiores y 32 bits inferiores como se recibe
# de la llamada a syscall 30 time. Donde a1:a0 = ms desde epoch-
# Hacemos la división de N/K.
# Input:
#   a1:a0 = N (64 bits)
#   a2    = K (16 bits)
# Output:
#   a1:a0 = Cociente (64 bits)
#   hi    = Resto
div64:
    subu $sp, $sp, 16   # Reservar espacio en la pila

    sw $a0, ($sp)      # Guardar N p1 en la pila
    sw $a1, 4($sp)    # Guardar N p2 en la pila

    add $t0, $sp, 8     # Puntero a los dígitos (N)
    add $t3, $sp, 16    # Puntero al resultado (M)
    xor $t1, $t1, $t1   # Resto

loop: 
    subu $t3, $t3, 2   # Retroceder en el resultado
    subu $t0, $t0, 2  # Retroceder en los dígitos

    sll $t1, $t1, 16   # t1 = R * 65536 el desplazamiento de 16 bits multiplica por 2 ^ 16
    lhu $t2, ($t0)     # t2 = N[i]  carga la mitad inferior de N[i] en t2 sin signo
    addu $t2, $t2, $t1 # t2 = N[i] + R * 65536 suma el resultado de la multiplicación

    div $t2, $a2      # Dividir entre K

    mflo $t1           # t1 = (N[i] + R * 65536) / K cociente
    sh $t1, ($t3)      # Almacena los dos bytes menos significativa del registro t1 en la posición e memoria direccionada por t3

    mfhi $t1           # t1 = (N[i] + R * 65536) % K resto

    bne $t0, $sp, loop # Repetir si no se ha terminado

    mthi $t1          # Resto

    lw $a0, 8($sp)  # Recuperar espacio de la pila
    lw $a1, 12($sp) # Recuperar espacio de la pila

    addu $sp, $sp, 16 # Liberar espacio de la pila
    jr $ra           # Retornar, se acaba la división
    

# Convierte un número entero en una cadena de caracteres
# Input:
#   a2 = Buffer para almacenar la cadena
#   a3 = Número entero a convertir
conv_cadena:
    addi $sp, $sp, -16   # Reservar espacio en la pila
    sw $ra, 0($sp)       # Guardar dirección de retorno
    sw $a2, 4($sp)       # Guardar $a2 (buffer)
    sw $a3, 8($sp)       # Guardar $a3 (número)

    move $t0, $a2        # Puntero al buffer
    addi $t1, $t0, 3     # Calcular límite del buffer
    sb $zero, 0($t1)     # Añadir '\0' como terminador
    sub $t1, $t1, 1      # Retroceder al último espacio disponible

conv_loop:
    div $a3, $a3, 10     # Dividir número por 10
    mfhi $t2             # Obtener residuo (último dígito)
    addi $t2, $t2, 48    # Convertir residuo a ASCII ('0' = 48)
    sb $t2, 0($t1)       # Almacenar carácter en el buffer
    sub $t1, $t1, 1      # Retroceder en el buffer
    mflo $a3             # Actualizar número con el cociente
    bnez $a3, conv_loop  # Repetir si el número no es cero
    # si es cero termina la conversión
    lw $a3, 8($sp)       # Restaurar $a3
    lw $a2, 4($sp)       # Restaurar $a2
    lw $ra, 0($sp)       # Restaurar $ra
    addi $sp, $sp, 16    # Liberar espacio de la pila
    jr $ra               # Retornar



