*-----------------------------------------------------------
; CONSTANTES DEL JUEGO
*-----------------------------------------------------------

; ----------------------------------------------------------
; CONSTANTES RELACIONADAS A BOTONES
; ----------------------------------------------------------

CHARWIDTH       EQU     8
CHARHEIGH       EQU     16

; START

; COLORES DEL FONDO Y DEL TEXTO
STBTNBGCLR      EQU     $00FFFFFF
STBTNBDCLR      EQU     $00C0C0C0
STBTNTXTCLR     EQU     $00000000
; TAMAÑO Y COORDENADAS
STBTNWIDTH      EQU     100
STBTNHEIGH      EQU     50
STBTNX1         EQU     (SCRWIDTH-STBTNWIDTH)/2   
STBTNY1         EQU     (SCRHEIGH-STBTNHEIGH)/2
STBTNX2         EQU     (SCRWIDTH+STBTNWIDTH)/2
STBTNY2         EQU     (SCRHEIGH+STBTNHEIGH)/2
; TEXTO DEL BOTON
STBTNTXT        DC.B    'START', 0
STBTNLEN        EQU     5
STBTNTXTWIDTH   EQU     CHARWIDTH*STBTNLEN

     




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
