    org $2000
    icl 'base/sistema.asm'
    icl 'base/macros.asm'
    icl 'base/pantallas.asm'
    icl 'base/funciones.asm'
inicio
    motor 1
    poke 559,0
    inipuntero
    pausa 80
    poke 559,34
;iniciamos la portada principal
    jsr portada
;introduccion
    texto
    jsr mstart
;que es un bit
    titulo titulo01
    texto
    jsr mstart
;que es un byte
    titulo titulo02
    texto
    jsr mstart
    texto
    jsr mstart
;ejemplo de byte
    texto
;cambio valores de 1 a inverso
    jsr mstart

    lda #<showtexto
    sta pt
    lda #>showtexto
    sta pt+1
    ldy #0
    sty tmp
    sty tmp+1
    ;lda #$11 es uno
    ;lda #$80
inicio2
    suma pt,1
    suma tmp,1

    lda (pt),y
    ;sta (pt),y
    cmp #$10
    beq cambiocero
    cmp #$11
    beq cambiouno

    lda tmp
    cmp #$3c
    bne inicio2

    lda tmp+1
    cmp #3
    bne inicio2


    jmp inicio3
cambiocero
    lda #$00
    sta (pt),y
    jmp inicio2
cambiouno
    lda #$80
    sta (pt),y
    jmp inicio2
inicio3
    pausa 100
    titulo titulo03
    texto
    jsr mstart
;numeros binarios
    texto
    jsr mstart
;numeros decimales
    texto
    jsr mstart
;numeros hexadecimales
    texto
    jsr mstart
;tabla relacional
    texto
    jsr mstart
;conversiones
    titulo titulo04
;binario a decimal
    texto
    jsr mstart
;




;final del capitulo
    titulo final
    ;
    motor 0
    jsr pfin
    jmp *


    lda #$00
    sta 710
    jmp *
    run inicio
;*****************************************
; data del programa
;*****************************************
;titulo01
;    .sb "    BIT & BYTES     "
titulo01
    .sb "  QUE SON LOS BIT   "
titulo02
    .sb "   QUE ES UN BYTE   "
titulo03
    .sb " SISTEMAS NUMERICOS "
titulo04
    .sb "    CONVERSIONES    "
final
    .sb "  FIN DEL CAPITULO  "
showdata
    .by 13
    .sb +128," INTRODUCCION "
    .by $9b,57
    .sb "Bienvenidos  al  capitulo  02  del"
    .by $9b,4
    .sb "curso de programacion assembler para"
    .by $9b,4
    .sb "para computadoras Atari, modelos  xe"
    .by $9b,4
    .sb "y xl de 8 bits."
    .by $9b,67
    .sb "En  esta  oportunidad, conoceremos"
    .by $9b,4
    .sb "que son los bit,  byte  y  bytes,  y"
    .by $9b,4
    .sb "cuales  son  sus  diferencias, entre"
    .by $9b,4
    .sb "unos y otros."
    .by $9b,69
    .sb "Recuerda  tomar   tu   libreta  de"
    .by $9b,4
    .sb "apuntes y lapiz, para  comenzar  con"
    .by $9b,4
    .sb "esta osadia de aprendizaje."
    .by $ff
;que son los bit
    .by 11
    .sb +128," QUE SON LOS BIT "
    .by $9b,56
    .sb "Primero debemos definir que es  un"
    .by $9b,4
    .sb "bit,  es simplemente una abreviacion"
    .by $9b,4
    .sb "de Binary Digit, que  en  espanol es"
    .by $9b,4
    .sb "digito binario,  en   los   terminos"
    .by $9b,4
    .sb "totalmente tecnicos  para  nosotros,"
    .by $9b,4
    .sb "es simplemente la unidad  minima  de"
    .by $9b,4
    .sb "informacion de una computadora."
    .by $9b,51
    .sb "El bit, tiene solo un valor y este"
    .by $9b,4
    .sb "puede ser un 0 o un 1,  el cual para"
    .by $9b,4
    .sb "este tutorial,  diremos que el bit 0"
    .by $9b,4
    .sb "siempre estara apagado  y  el bit 1,"
    .by $9b,4
    .sb "estara encendido."
    .by $9b,65
    .sb "En resumen, Bit es la menor unidad"
    .by $9b,4
    .sb "de informacion de la computadora"
    .by $ff
;que son los byte
    .by 11
    .sb +128," QUE ES UN BYTE "
;que son los bytes
    .by $9b,57
    .sb "Un byte, es un grupo  de  8  bits,"
    .by $9b,4
    .sb "que formando  una  secuencia,  puede"
    .by $9b,4
    .sb "representar un caracter.  Un ejemplo"
    .by $9b,4
    .sb "basico, para pasar  a  explicar  los"
    .by $9b,4
    .sb "bytes, es la secuencia de bit."
    .by $9b,50
    .sb " "
    .sb +32,"QRRRWRRRWRRRWRRRWRRRWRRRWRRRWRRRE"
    .sb "  "
    .by $9b,4
    .sb " | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 1 |  "
    .by $9b,4
    .sb " "
    .sb +32,"ZRRRXRRRXRRRXRRRXRRRXRRRXRRRXRRRC"
    .by $9b,48
    .sb "Ahora si nosotros pasamos a formar"
    .by $9b,4
    .sb "grupos   de   estos  bytes,  podemos"
    .by $9b,4
    .sb "lograr  mayores niveles  de  grupos,"
    .by $9b,4
    .sb "como  son  los bytes, los kilobytes,"
    .by $9b,4
    .sb "los megabytes, etc."
    .by $ff
;    
    .by 164
    .sb "Si hablamos de conjuntos de  bytes"
    .by $9b,4
    .sb "y  de  concatenar  estos,   nosotros"
    .by $9b,4
    .sb "podemos  crear  caracteres  atascii,"
    .by $9b,4
    .sb "este  es   un   ejemplo   para   que"
    .by $9b,4
    .sb "entiendas  el  comportamiento  y  la"
    .by $9b,4
    .sb "importancia de los bit."

    .by $ff

;ejemplo
    .by 42
    .sb +32,"QRWRWRWRWRWRWRWRE"
    .by $9b,23
    .sb "|0|0|0|0|0|0|0|0|"
    .sb " cero o uno, un bit"
    .by $9b,4
    .sb +32,"ARSRSRSRSRSRSRSRD"
    .sb " ocho bit, un byte"
    .by $9b,5
    .sb "|0|0|0|1|1|0|0|0|"
    .sb " 64 bits, un bytes"


    .by $9b,5
    .sb +32,"ARSRSRSRSRSRSRSRD"

    .by $9b,23
    .sb "|0|0|1|1|1|1|0|0|"

    .by $9b,23
    .sb +32,"ARSRSRSRSRSRSRSRD"
    .by $9b,23
    .sb "|0|1|1|0|0|1|1|0|"

    .by $9b,23
    .sb +32,"ARSRSRSRSRSRSRSRD"
    .by $9b,23
    .sb "|0|1|1|0|0|1|1|0|"

    .by $9b,23
    .sb +32,"ARSRSRSRSRSRSRSRD"
    .by $9b,23
    .sb "|0|1|1|1|1|1|1|0|"

    .by $9b,23
    .sb +32,"ARSRSRSRSRSRSRSRD"
    .by $9b,23
    .sb "|0|1|1|0|0|1|1|0|"

    .by $9b,23
    .sb +32,"ARSRSRSRSRSRSRSRD"
    .by $9b,23
    .sb "|0|0|0|0|0|0|0|0|"

    .by $9b,23
    .sb +32,"ZRXRXRXRXRXRXRXRC"
    .by $ff
;sistemas numericos
    .by 10
    .sb +128," SISTEMAS NUMERICOS "
    .by $9B,54
    .sb "Una de las  formas  mas faciles de"
    .by $9B,4
    .sb "trabajar en nuestro atari,  es poder"
    .by $9B,4
    .sb "conocer  otros  metodos  de  numerar"
    .by $9B,4
    .sb "estos bit para asi facilitar nuestra"
    .by $9B,4
    .sb "vida y para ello,  existe  una forma"
    .by $9B,4
    .sb "mas simple de poder nombrarlos."
    .by $9B,51
    .sb "Para ello existen las conversiones"
    .by $9B,4
    .sb "de binarios a numeros  hexadecimales"
    .by $9B,4
    .sb "o decimales que pasaremos a explicar"
    .by $9B,4
    .sb "detalladamente cada una de  ellas  y"
    .by $9B,4
    .sb "como se comportan."
    .by $ff
;binarios
    .by 11
    .sb +128," NUMEROS BINARIOS "
    .by $9B,55
    .sb "Para realizar las conversiones  de"
    .by $9b,4
    .sb "binarios a decimales o hexadecimales,"
    .by $9b,3
    .sb "debemos primero saber la  estructura"
    .by $9b,4
    .sb "del binario,  y esta se encuentra de"
    .by $9b,4
    .sb "la siguiente manera."
    .by $9b,150
    .sb "7 6 5 4 3 2 1 0"
    .by $9B,24
    .sb +32,"QRWRWRWRWRWRWRWRE"
    .by $9B,23
    .sb "|0|0|0|0|0|0|0|0|"
    .by $9B,23
    .sb +32,"ZRXRXRXRXRXRXRXRC"
    .by $ff
;numeros decimales
    .by 10
    .sb +128," NUMEROS DECIMALES "
    .by $9B,55
    .sb "Los decimales,   son  numeros  que"
    .by $9B,4
    .sb "estan representados por unidades  de"
    .by $9B,4
    .sb "0  a  9,  porque  es  expresado   en"
    .by $9B,4
    .sb "combinacion de digitos de 10 cifras."
    .by $9B,46
    .sb "Un ejemplo muy simple puede ser el"
    .by $9B,4
    .sb "siguiente:"
    .by $9B,150
    .sb "111 = 1 centena, 1 decena, 1 unidad."
    .by $ff
;numeros hexadecimales
    .by 8
    .sb +128," NUMEROS HEXADECIMALES "
    .by $9B,133
    .sb "Los numeros hexadecimales  son  lo"
    .by $9B,4
    .sb "mismo  que  los  decimales, con  una"
    .by $9B,4
    .sb "pequena diferencia, que estos en vez"
    .by $9B,4
    .sb "de usar la base de 10,  se rigen por"
    .by $9B,4
    .sb "la base de 16.  O  sea para entender"
    .by $9B,4
    .sb "de mejor manera, se suman a los 0  y"
    .by $9B,4
    .sb "9 las letras A hasta la F."
    .by $9B,136
    .sb "0 1 2 3 4 5 6 7 8 9 "
    
    .sb +128,"A B C D E F"

    .by $ff
    .by 11
    .sb +128," TABLA RELACIONAL "
    .by $9B,13
    .sb "binario      decimal    hexadecimal"
;0
    .by $9b,11
    .sb "0"
    .by $9b,12
    .sb "0"
    .by $9b,14
    .sb "0"
;1
    .by $9b,11
    .sb "1"
    .by $9b,12
    .sb "1"
    .by $9b,14
    .sb "1"
;2
    .by $9b,10
    .sb "10"
    .by $9b,12
    .sb "2"
    .by $9b,14
    .sb "2"
;3
     .by $9b,10
    .sb "11"
    .by $9b,12
    .sb "3"
    .by $9b,14
    .sb "3"
;4
    .by $9b,9
    .sb "100"
    .by $9b,12
    .sb "4"
    .by $9b,14
    .sb "4"
;5
    .by $9b,9
    .sb "101"
    .by $9b,12
    .sb "5"
    .by $9b,14
    .sb "5"
;6
    .by $9b,9
    .sb "110"
    .by $9b,12
    .sb "6"
    .by $9b,14
    .sb "6"
;7
    .by $9b,9
    .sb "111"
    .by $9b,12
    .sb "7"
    .by $9b,14
    .sb "7"
;8
    .by $9b,8
    .sb "1000"
    .by $9b,12
    .sb "8"
    .by $9b,14
    .sb "8"
;9
    .by $9b,8
    .sb "1001"
    .by $9b,12
    .sb "9"
    .by $9b,14
    .sb "9"
;10
    .by $9b,8
    .sb "1010"
    .by $9b,11
    .sb "10"
    .by $9b,14
    .sb "A"
;11
    .by $9b,8
    .sb "1011"
    .by $9b,11
    .sb "11"
    .by $9b,14
    .sb "B"
;12
    .by $9b,8
    .sb "1100"
    .by $9b,11
    .sb "12"
    .by $9b,14
    .sb "C"
;13
    .by $9b,8
    .sb "1101"
    .by $9b,11
    .sb "13"
    .by $9b,14
    .sb "D"
;14
    .by $9b,8
    .sb "1110"
    .by $9b,11
    .sb "14"
    .by $9b,14
    .sb "E"
;15
    .by $9b,8
    .sb "1111"
    .by $9b,11
    .sb "15"
    .by $9b,14
    .sb "F"
    .by $ff
;conversion de binario a decimal
    .by 10
    .sb +128," BINARIO A DECIMAL "
    .by $9b,54
    .sb " 128  64  32  16   8   4   2   1"
    .by $9b,11
    .sb "7   6   5   4   3   2   1   0"
    .by $9b,8
    .sb +32,"QRRRWRRRWRRRWRRRWRRRWRRRWRRRWRRRE"
    .by $9b,7
    .sb "| 1 | 0 | 0 | 1 | 0 | 1 | 0 | 1 |"
    .by $9b,7
    .sb +32,"ZRRRXRRRXRRRXRRRXRRRXRRRXRRRXRRRC"
    .by $9b,8
    .sb "128  0   0   16  0   4   0   1"
    .by $9b,50
    .sb "128+64+32+16+8+4+2+1"
    .by $9b,60
    .sb "Sumamos 128+0+0+16+0+4+0+1 = 149"



    .by $ff
tablap0 = *