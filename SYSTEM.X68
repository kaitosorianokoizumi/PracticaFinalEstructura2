*-----------------------------------------------------------
; SYSTEM
*-----------------------------------------------------------

; ----------------------------------------------------------
SYSINIT
; INICIALIZA EL SISTEMA
; INPUT    : NADA
; OUTPUT   : NADA
; MODIFICA : NADA
; ----------------------------------------------------------

            JSR SCRINIT
            
            RTS
            
; ----------------------------------------------------------            
SCRINIT
; INICIALIZAR PANTALLA. PONER LA RESOLUCION CORRECTA, 
; EL MODO VENTANA, LIMPIAR LA PANTALLA E INICIALIZAR
; EL DOBLE BUFFER
; INPUT     : NADA
; OUTPUT    : NADA
; MODIFICA  : NADA
; ----------------------------------------------------------   
            
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
            MOVE.W #$FF00, D1
            TRAP #15
            
            ; INICIALIZAR EL DOBLE BUFFER
            MOVE.B #92, D0
            MOVE.B #17, D1
            TRAP #15
                        
            MOVEM.L (A7)+,D0-D1
            RTS
; ----------------------------------------------------------

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
