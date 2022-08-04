tmp .by 0,0,0
;presiona start
funstart
    poke 77,0
    lda 53279
    cmp #6
    bne funstart
start01
    poke 77,0
    lda 53279
    cmp #6
    beq start01
    rts
;presiona option
select

    rts
;presiona select
option

    rts
limpiotexto
    lda #<showtexto
    sta pt
    lda #>showtexto
    sta pt+1
    ldy #0
    sty tmp
    sty tmp+1
limpiotexto01
    lda #$00
    sta (pt),y
    suma pt,1
    suma tmp,1
    lda tmp
    cmp #32
    bne limpiotexto01
    lda tmp+1
    cmp #3
    bne limpiotexto01
    rts
;muestro start en pantalla y esperamos
;que presionen start
mstart
    ldx #39
mstart01
    lda txtstart,x
    sta showmensaje,x
    dex
    bpl mstart01
    poke 54018,60
    start
    rts
funpausa
    stx $021c
pausa01
    ldx $021c
    bne pausa01
    rts
;funcion espero fsk
funfsk
	lda $d20f   ;53775
	and #$10
	bne funfsk
	rts
;*****************************************
; reseteo de colores
;*****************************************
resetcolor
;color 0
	lda #$28
	sta $2c4    ;color0
;color 1
	lda #$ca
	sta $2c5    ;color1
;color 2
	lda #$94
	sta $2c6    ;color2
;color 4
	lda #$00
	sta $2c8    ;color4
	rts