    icl 'base/sys_equates.m65'
    org $2000
    icl 'base/macros.asm'
    icl 'base/pantallas.asm'
    icl 'base/funciones.asm'
    icl 'base/panpri.asm'
tmp .by 0,0,0
inicio
;iniciamos motor
    poke 559,0
    poke 54018,52
    pausa 100
;iniciamos puntero de data
    lda #<showdata
    sta ptdata
    lda #>showdata
    sta ptdata+1
;iniciamos pantalla principal
    poke 559,34
    jsr portada
;pantalla titulo introducción
    titulo introduccion
;pantalla de texto introducción
    texto
    fsk
    ;start
;pantalla titulo temario
    titulo temario
;pantalla de temario del curso
    texto
    fsk
    jsr mstart
;pantalla titulo conociendo el atari
    titulo title01
;pantalla texto conociendo el atari
    texto
    fsk
;pantalla titulo memoria rom
    titulo title02
;texto memoria rom
    texto
    fsk
    jsr mstart
;pantalla titulo memoria ram
    titulo title03
;texto memoria ram
    texto
    fsk
    jsr mstart
;titulo interior de una memoria
    titulo title04
;texto interior de una memoria
    texto
    fsk
    ;00
    lda #16
    sta showtexto+364
    lda #16
    sta showtexto+365
    pausa 50
    fsk
    ;start
    ;B3
    lda #34
    sta showtexto+373
    lda #19
    sta showtexto+374
    pausa 50
    fsk
    ;C5
    lda #35
    sta showtexto+394
    lda #21
    sta showtexto+395
    pausa 50
    fsk
    ;start
    ;F7
    lda #38
    sta showtexto+382
    lda #23
    sta showtexto+383
    pausa 50
    fsk
    jsr mstart
;titulo componentes de un atari
    titulo title05
;antic
    texto
    fsk
    jsr mstart
;gtia
    texto
    fsk
    jsr mstart
;pokey
    texto
    fsk
    jsr mstart
;6502
    texto
    fsk
    jsr mstart


;despedida
    texto
    fsk
    jsr mstart
    ldy #10
    sty tmp
apago
    ldy tmp
    pausa 3
    dey
    sty tmp
    sty 709
    bpl apago


;final del capitulo
    titulo final
    fsk
    poke 54018,60
;mostramos reset
    jsr pfin
    jmp *
;*****************************************
; data del programa
;*****************************************
introduccion
	.sb "    INTRODUCCION    "
temario
    .sb "      TEMARIO       "
title01
	.sb "CONOCIENDO EL ATARI "
title02
	.sb "    MEMORIA  ROM    "
title03
	.sb "    MEMORIA  RAM    "
title04
	.sb "INTERIOR DE MEMORIA "
title05
    .sb " COMPONENTES  ATARI "





final
    .sb "  FIN DEL CAPITULO  "
showdata
;bienvenida al curso
    .by 4
    .sb "Bienvenidos al curso de Assembler,"
    .by $9b,4
    .sb "para  computadoras  Atari, versiones"
    .by $9b,4
    .sb "xl y xe."
    .by $9b,74
    .sb "En  este curso  podras  aprender a"
    .by $9b,4
    .sb "manejar,  programar  y  conocer, los"
    .by $9b,4
    .sb "conceptos basicos de la programacion"
    .by $9b,4
    .sb "de assembler, para que practiques en"
    .by $9b,4
    .sb "tu computadora,  y crees tus propios"
    .by $9b,4
    .sb "proyectos."
    .by $9b,72
    .sb "Te dejo con  estos  tutoriales que"
    .by $9b,4
    .sb "estaran  en  varios  tomos  para  tu"
    .by $9b,4
    .sb "aprendisaje."
    .by $9b,86
    .sb "Te saluda Dogdark."
    .by $ff
;temario del curso
    .by 10
    .sb +128," TEMARIO DEL CURSO "
    .by $9c
    .by 53
    .sb "A) CONOCIENDO EL ATARI"
    .by $9c
    .by 18
    .sb "B) BIT & BYTES"
    .by $9c
    .by 26
    .sb "C) EDITORES DE CODIGO"
    .by $9c
    .by 19
    .sb "D) SISTEMAS NUMERICOS: DECIMAL,"
    .by $9b
    .by 12
    .sb "BINARIOS Y HEXADECIMAL"
    .by $9c
    .by 15
    .sb "E) INTRUCCIONES LDA,LDX,LDY"
    .by $9c
    .by 13
    .sb "F) INTRUCCIONES STA,STX,STY"
    .by $9c
    .by 13
    .sb "G) SALTANDO CON JMP"
    .by $9c
    .by 21
    .sb "H) COMPARANDO Y SALTOS BRANCH"
    .by $9c
    .by 11
    .sb "I) INDEXACIONES"
    .by $9c
    .by 25
    .sb "J) DISPLAY LIST"
    .by $9c
    .by 25
    .sb "K) VARIOS ITEM"
    .by $ff
;conociendo tu atari
    .by 10
    .sb +128," CONOCIENDO EL ATARI "
    .by $9c
    .by 93
    .sb "El atari consta con  dos  tipos de"
    .by $9b,4
    .sb "memoria  en  su  interior, ambas son"
    .by $9b,4
    .sb "importantes para  su funcionamiento,"
    .by $9b,4
    .sb "pero  son  distintas,  ya que una es"
    .by $9b,4
    .sb "modificable y la otra no, excepto en"
    .by $9b,4
    .sb "algunos bytes que estan libres para"
    .by $9b,5
    .sb "su uso."
    .by $9c,80
    .sb +32,"QRRRRRRRE"
    .sb "   "
    .sb +32,"QRRRRRRRE"
    .by $9b,19
    .sb "|  ROM  |   |  RAM  |"
    .by $9b,19
    .sb +32,"ZRRRRRRRC"
    .sb "   "
    .sb +32,"ZRRRRRRRC"
    .by $ff
;memoria rom
    .by 13
    .sb +128," MEMORIA  ROM "
    .by $9c,57
    .sb "La ROM, es  una  memoria reservada"
    .by $9b,4
    .sb "del Atari, que no se puede escribir,"
    .by $9b,4
    .sb "salvo algunas posiciones de  memoria"
    .by $9b,4
    .sb "disponibles, por lo cual el  usuario"
    .by $9b,4
    .sb "no puede modificiar pero si obtener"
    .by $9b,5
    .sb "los bytes de sus posiciones."
    .by $9c,54
    .sb "Sus bytes disponibles son:"
    .by $9b,53
    .sb "$CB-$CC,$CD-$80-$81-$82,$83"
    .by $9b,53
    .sb "Entre otros."
    .by $ff
;memoria ram
    .by 13
    .sb +128," MEMORIA  RAM "
    .by $9c,57
    .sb "La  memoria  RAM,   es  totalmente"
    .by $9b,4
    .sb "volatil y esta puede ser escrita por"
    .by $9b,4
    .sb "bytes, a gusto del programador."
    .by $9b,51
    .sb "Pero existe  una  gran  desventaja"
    .by $9b,4
    .sb "con  la  memoria  RAM,  esta al  ser"
    .by $9b,4
    .sb "volatil,  al  momento  de  apagar tu"
    .by $9b,4
    .sb "Atari, todo  lo  que se encuentra en"
    .by $9b,4
    .sb "la RAM,  desaparece automaticamente,"
    .by $9b,4
    .sb "no quedando registro  alguno  de  tu"
    .by $9b,4
    .sb "trabajo,  por eso es muy importante,"
    .by $9b,4
    .sb "siempre respaldar todo."
    .by $ff
;celdas de memoria
    .by 7
    .sb +128," INTERIOR DE UNA MEMORIA "
    .by $9c,52
    .sb "Las memorias,  son  almacenaje  de"
    .by $9b,4
    .sb "bytes, es como una colmena de abejas"
    .by $9b,4
    .sb "donde  en   cada   cubiculo   puedes"
    .by $9b,4
    .sb "insertar un byte."
    .by $9b,104
    .sb +32,"QRRWRRWRRWRRWRRWRRWRRWRRWRRWRRWRRE"
    .by $9b,6
    .sb     "|  |  |  |  |  |  |  |  |  |  |  |"
    .by $9b,6
    .sb +32,"ZRRXRRXRRXRRXRRXRRXRRXRRXRRXRRXRRC"
    .by $ff
;componentes de un atari
    .by 7
    .sb +128," COMPONENTES DE UN ATARI "
    .by $9c,52
    .sb "El Atari tiene varios chips en  su"
    .by $9b,4
    .sb "interior,  solo  nombraremos los mas"
    .by $9b,4
    .sb "importantes."
    .by $9b,68
    .sb "ANTIC: Junto con el GTIA,   formaron"
    .by $9b,4
    .sb "el corazon de los graficos atari, ya"
    .by $9b,4
    .sb "que  era  un  micropocesador   quien"
    .by $9b,4
    .sb "procesaba     instrucciones       de"
    .by $9b,4
    .sb "visualizacion.  Una   secuencia   de"
    .by $9b,4
    .sb "instrucciones completa era  conocida"
    .by $9b,4
    .sb "como   Display   List   ( lista   de"
    .by $9b,4
    .sb "despliegue)."
    .by $ff
;gtia
    .by 84
    .sb "GTIA: Este recibe  la  informacion"
    .by $9b,4
    .sb "grafica del antic y tambien controla"
    .by $9b,4
    .sb "los sprites, deteccion de coliciones"
    .by $9b,4
    .sb "control de prioridad y el control de"
    .by $9b,4
    .sb "luminancia  del  color(Brillo). GTIA"
    .by $9b,4
    .sb "toma toda la informacion y  hace una"
    .by $9b,4
    .sb "conversion  digital   analoga,   asi"
    .by $9b,4
    .sb "produce las senales de video."
    .by $ff
;pokey
    .by 44
    .sb "POKEY: Es reponsable  de  leer  el"
    .by $9b,4
    .sb "teclado, generar sonidos y controlar"
    .by $9b,4
    .sb "las  comunicaciones  seriales.  Este"
    .by $9b,4
    .sb "ultimo trabaja en  conjunto  con  la"
    .by $9b,4
    .sb "PIA."
    .by $9b,78
    .sb "Tambien aporta con  temporizadores"
    .by $9b,4
    .sb "(Timers),  un  generador  de numeros"
    .by $9b,4
    .sb "aleatorios  ( Para  crear  ruidos  o"
    .by $9b,4
    .sb "numeros al azar),  e  interrupciones"
    .by $9b,4
    .sb "enmascarables. "
    .by $9b,67
    .sb "Pokey tiene 4 canales de audio, de"
    .by $9b,4
    .sb "8 bits semi-independientes,  y  cada"
    .by $9b,4
    .sb "uno con  sus  propios  registros  de"
    .by $9b,4
    .sb "control  de  frecuencia,   ruido   y"
    .by $9b,4
    .sb "volumen."
    .by $ff
;6502
    .by 84
    .sb "6502: Uno de los mas importante en"
    .by $9b,4
    .sb "nuestro atari,  es un micropocesador"
    .by $9b,4
    .sb "de  8  bits con un bus de  direccion"
    .by $9b,4
    .sb "de  16  bits,  con   una   velocidad"
    .by $9b,4
    .sb "aproximada  de   1mhz,   y   es   el"
    .by $9b,4
    .sb "encargado  de  la  mayoria   de  los"
    .by $9b,4
    .sb "procesos  que  genera  el computador"
    .by $9b,4
    .sb "Atari, sin embargo, se ocupa mas que"
    .by $9b,4
    .sb "nada  de  ordenar el  atari  en  los"
    .by $9b,4
    .sb "procesos ya que cada microprocesador"
    .by $9b,4
    .sb "incluido tiene su tarea propia."
    .by $ff
;pantalla final de despedida
    .by 14
    .sb +128," DESPEDIDA "
    .by $9b,139
    .sb "Esperando que este  capitulo  haya"
    .by $9b,4
    .sb "sido de tu agrado, te espero  en  el"
    .by $9b,4
    .sb "proximo,   para  seguir  aprendiendo"
    .by $9b,4
    .sb "assembler,  ya  entrando de lleno en"
    .by $9b,4
    .sb "la programacion  y  conocimientos de"
    .by $9b,4
    .sb "los comportamientos de  assembler en"
    .by $9b,4
    .sb "Atari."
    .by $9b,126
    .sb " Un gran abrazo para ti."
    .by $ff


	.by $00
    run inicio