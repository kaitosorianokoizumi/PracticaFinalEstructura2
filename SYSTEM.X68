*-----------------------------------------------------------
;SYSTEM
*-----------------------------------------------------------

; ----------------------------------------------------------
SYSINIT
; INITIALIZE SYSTEM.
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ----------------------------------------------------------

            JSR SCRINIT
            
            RTE
            
; ----------------------------------------------------------            
SCRINIT
; INICIALIZAR PANTALLA. PONER LA RESOLUCION CORRECTA, EL MODO VENTANA Y LIMPIAR
; LA PANTALLA

            MOVEM.L D0-D1, -(A7)
            
            ; RESOLUCION
            MOVE.B #33, D0
            MOVE.L #SCRWIDTH<<16|SCRHEIGH, D1
            TRAP #15
            
            ; MODO VENTANA
            MOVE.L #1, D1
            TRAP #15
            
            ; LIMPIAR
            MOVE.B #11, D0
            MOVE.W #FF00, D1
            TRAP #15
            
            MOVEM.L +(A7), D0-D1
            RTS
            
; ----------------------------------------------------------
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
