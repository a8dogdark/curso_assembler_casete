;*****************************************
; macros
;*****************************************
;
;*****************************************
; suma bytes
;*****************************************
.macro suma
	.if :0 <> 2
		.error "Suma error"
	.else
		clc
		lda :1
		adc #:2
		sta :1
		lda :1+1
		adc #$00
		sta :1+1
	.endif
.endm
;*****************************************
; suma variables
;*****************************************
.macro sumav
	.if :0 <> 2
		.error "Suma error"
	.else
		clc
		lda :1
		adc :2
		sta :1
		lda :1+1
		adc #$00
		sta :1+1
	.endif
.endm
;*****************************************
; cargo data a titulo
;*****************************************
.macro titulo
	ldx #19
mtitulo01
	lda :1,x
	sta showtitulo2,x
	dex
	bpl mtitulo01
	jsr funtitulo
.endm

.macro texto
	jsr funtexto
.endm

.macro start
	jsr funstart
.endm

.macro pausa
	.if :0 <> 1
		.error "Pausa error"
	.else
		ldx #:1
		jsr funpausa	
	.endif
.endm

.macro poke
	.if :0 <> 2
		.error "Poke error"
	.else
		lda #:2
		sta :1	
	.endif
.endm
.macro fsk
	jsr funfsk
.endm

.macro motor
	.if :0 <> 1
		.error "Error, motor 0 apagado 1 encendido"
	.else
		.if :1 = 0
			poke 54018,60
		.else
			poke 54018,52
		.endif
	.endif
.endm

.macro inipuntero
;iniciamos puntero de data
	lda #<showdata
    sta ptdata
    lda #>showdata
    sta ptdata+1
.endm