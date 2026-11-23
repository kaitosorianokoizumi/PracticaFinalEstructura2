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
            


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
