;display list texto
dlitexto
:3  .by $70
    .by $4e
    .wo showlogo
:8  .by $0e
:2  .by $70
:20 .by $02
    .by $41
    .wo dlitexto
;datos de logo
showlogo
    .by $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$15,$40,$55,$41,$55,$05,$50,$10,$41,$55,$01,$40,$05,$50,$55,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .by $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$51,$51,$50,$05,$40,$15,$54,$51,$50,$41,$05,$40,$15,$54,$10,$50,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .by $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$50,$51,$50,$05,$40,$14,$00,$55,$50,$55,$45,$40,$14,$00,$11,$50,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .by $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$55,$50,$55,$41,$55,$15,$54,$44,$50,$51,$45,$40,$15,$54,$15,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .by $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$50,$01,$40,$05,$15,$00,$40,$50,$41,$45,$40,$15,$00,$11,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .by $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$50,$01,$40,$05,$15,$00,$40,$51,$55,$45,$54,$15,$00,$10,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .by $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$51,$55,$05,$54,$05,$54,$40,$51,$55,$01,$55,$05,$54,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
:40 .by $00
    .by $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
showtexto
;:20     .sb "                                        "
:19 .sb "****************************************"
showmensaje
    .sb "*************************************fin"
funtexto
    poke 54018,52
    jsr limpiotexto
    lda #<dlitexto
    sta $230
    lda #>dlitexto
    sta $231
    lda #$40
    sta 710
    sta 712
; iniciamos puntero de data de show
    lda #<showtexto
    sta pt
    lda #>showtexto
    sta pt+1
    ldy #0
    sty tmp
    sty tmp+1
texto01
    lda (ptdata),y
    sta tmp
    suma ptdata,1
    sumav pt,tmp
    sta (pt),y
texto02
    poke 77,0
    lda (ptdata),y
    sta (pt),y
    suma ptdata,1
    suma pt,1
    ldx #3
    pausa 3
    lda (ptdata),y
    cmp #$ff
    beq fintexto
    cmp #$9c
    beq textofsk

    cmp #$9b
    bne texto02
textosigo
    suma ptdata,1
    jmp texto01
textofsk
    fsk
    jmp textosigo
fintexto
    suma ptdata,1
    rts
txtstart
    .sb "    PRESIONE "
    .sb +128," START "
    .sb " PARA CONTINUAR.    "
;*****************************************
; pantalla titulos
;*****************************************
dlititulo
:3	.by $70
	.by $46
	.wo showtitulo
:10	.by $70
	.by $06
:9	.by $70
	.by $02
	.by $41
	.wo dlititulo
showtitulo
	.sb " "
	.sb +128,"dogdark"
	.sb "  softwares "
showtitulo2
	.sb "--ACA VA EL TITULO--"
	.sb "  Programas educacionales Dogdark 2022  "
	;.sb "                                        "
funtitulo
    poke 54018,52
	lda #<dlititulo
	sta $230
	lda #>dlititulo
	sta $231
	jsr resetcolor
    poke 710,0
    poke 77,0
	pausa 100
    fsk
    ;start
	rts
dlifin
:10 .by $70
    .by $42
    .wo showfin
    .by $41
    .wo dlifin
showfin
    .sb "    PRESIONE "
    .sb +128," RESET "
    .sb " PARA CONTINUAR.    "
pfin
    lda #<dlifin
    sta $230
    lda #>dlifin
    sta $231
    poke 710,0
    poke 712,0
    poke 709,12
    rts