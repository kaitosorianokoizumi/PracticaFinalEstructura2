*-----------------------------------------------------------
; START BUTTON
*-----------------------------------------------------------

; ----------------------------------------------------------
STBTNPLOT
; PINTA EL BOTON DE START
; INPUT    : NADA
; OUTPUT   : NADA
; MODIFICA : NADA
; ----------------------------------------------------------

        MOVEM.L D0-D4/A1, -(A7)
        
; COLOR DE FONDO
        MOVE.L  #STBTNBGCLR, D1
        MOVE.B  #81, D0
        TRAP    #15
; COLOR DEL BORDE
        MOVE.L  #STBTNBDCLR, D1
        MOVE.B  #80, D0
        TRAP    #15
; COLOR DEL TEXTO
        MOVE.L  #STBTNTXTCLR, D1
        MOVE.B  #21, D0
        TRAP    #15
; PINTAR EL RECTANGULO DEL BOTON
        MOVE.W  #STBTNX1, D1
        MOVE.W  #STBTNY1, D2
        MOVE.W  #STBTNX2, D3
        MOVE.W  #STBTNY2, D4
        MOVE.B  #87, D0
        TRAP    #15
       
; PINTAR TEXTO
        LEA     STBTNTXT, A1
        ; CENTRAR EL TEXTO EN EL RECTANGULO
        MOVE.W  #STBTNX1+(STBTNWIDTH-STBTNTXTWIDTH)/2, D1
        MOVE.W  #STBTNY1+(STBTNHEIGH-CHARHEIGH)/2, D2
        MOVE.B  #95, D0
        TRAP    #15
        
        MOVEM.L (A7)+,D0-D4/A1
        RTS
            
; ----------------------------------------------------------
STBTNCLICK
; COMPRUEBA SI EL BOTON START HA SIDO PULSADO
; INPUT    : NADA
; OUTPUT   : D0 = 0 SI NO ESTA PULSADO, D0 = 1 SI LO ESTA
; MODIFICA : NADA
; ----------------------------------------------------------
            
            MOVEM.L D1-D2, -(A7)
            
; COMPRUEBA SI EL CLICK IZQUIERDO ESTA PULSADO
            MOVE.B  #61, D0
            MOVEQ   #0, D1
            TRAP    #15
            BTST    #0, D0
            ; SI NO ESTA PULSADO, SALTA AL FINAL
            BEQ     STBTNNOCLICK
            ; USAREMOS CMP, ASI QUE NOS INTERESA TENER
            ; LAS COORDENADAS EN LA PALABRA INFERIOR
            ; COLOCAMOS LA COORDENADA Y DEL RATON EN D2
            ; Y LA COORDENADA X EN LA PALABRA INFERIOR DE D1
            MOVE.L  D1, D2
            ; PARA MOVER LA COORDENADA Y A LA PALABRA
            ; INFERIOR, USAMOS LSR
            ; LSR SOLO DEJA 8 BITS, 
            ; ASI QUE LO USAMOS DOS VECES
            LSR.L    #8, D2
            LSR.L    #8, D2
            
            ; SI ESTA PULSADO, COMPRUEBA SI ESTA EN EL BOTON
            ; COMPROBANDO SI ESTA EN LAS COORDENADAS QUE CUBRE
            ; EL BOTON
            CMP.W   #STBTNX1, D1
            BLT     STBTNNOCLICK
            CMP.W   #STBTNY1, D2
            BLT     STBTNNOCLICK
            CMP.W   #STBTNX2, D1
            BGT     STBTNNOCLICK
            CMP.W   #STBTNY2, D2
            BGT     STBTNNOCLICK
            
            MOVEQ   #1, D0
            BRA STBTNCLICKEND
STBTNNOCLICK
            MOVEQ   #0, D0
STBTNCLICKEND

            MOVEM.L (A7)+, D1-D2
            RTS
            


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
