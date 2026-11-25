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

; ----------------------------------------------------------
; CONSTANTES RELACIONADAS AL JUGADOR (CUBO)
; ----------------------------------------------------------
; Constantes del cubo
CUBE_W       EQU     40      ; Ancho del cubo (futuro sprite)
CUBE_H       EQU     80      ; Alto del cubo (futuro sprite)
CUBE_SPEED   EQU     6       ; Píxels por fotograma al moverse
GROUND_Y     EQU     400     ; Altura del suelo (coord Y)
     
; Teclas para movimiento
KEY_LEFT      EQU      'A'
KEY_RIGHT     EQU      'D'
KEY_UP        EQU      'W'
KEY_DOWN      EQU      'S'

; Constantes del cubo (fighter)
ANCHO_CUBO      EQU     50              ; Ancho del cubo en pixeles
ALTO_CUBO       EQU     90              ; Alto del cubo en pixeles
VELOCIDAD_CUBO  EQU     5               ; Desplazamiento en pixeles por ciclo

TECLA_IZQ       EQU     'A'             ; Codigo ASCII mover izquierda
TECLA_DER       EQU     'D'             ; Codigo ASCII mover derecha
TECLA_ARR       EQU     'W'             ; Codigo ASCII mover arriba
TECLA_ABA       EQU     'S'             ; Codigo ASCII mover abajo

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
