*-----------------------------------------------------------
; Title      : Street Fighter (Base Cubo)
; Written by :
; Date       :
; Description: Bucle principal con boton Start y cubo movil.
*-----------------------------------------------------------
    ORG     $1000

    INCLUDE "SYSCONST.X68"
    INCLUDE "CONST.X68"
    INCLUDE "SYSTEM.X68"
    INCLUDE "SYSVAR.X68"
    INCLUDE "VARS.X68"
    INCLUDE "STARTBUTTON.X68"
    INCLUDE "PLAYER1.X68"

START:                  ; Primera instruccion del programa

    ;-- INICIALIZACION --
    JSR     SYSINIT
    JSR     INICIALIZAR_CUBO

BUCLE_PRINCIPAL:
    ;-- UPDATE --
    ; Leer dispositivos de entrada
    JSR     STBTNCLICK
    ; Actualizar logica del juego
    JSR     MOVER_CUBO

    ;-- SYNC --

    ;-- PLOT --
    ; Limpiar buffer oculto antes de redibujar el frame
    MOVE.B  #11, D0
    MOVE.W  #$FF00, D1
    TRAP    #15

    ; Codigo de prueba para pintar el boton
    JSR     STBTNPLOT

    ; Pintar el cubo luchador
    JSR     DIBUJAR_CUBO

    ; Si el boton esta pulsado, pinta un cuadrado rojo en la esquina
    CMP.W   #0, D0
    BEQ     NO_PINTAR_CUADRO
    MOVE.L  #$000000FF, D1
    BRA     FIN_PRUEBA_CUADRO

    ; Si no esta pulsado, rellena de negro el espacio anterior
NO_PINTAR_CUADRO:
    MOVE.L  #$00000000, D1

FIN_PRUEBA_CUADRO:
    MOVE.B  #81, D0
    TRAP    #15
    MOVE.W  #0, D1
    MOVE.W  #0, D2
    MOVE.W  #100, D3
    MOVE.W  #100, D4
    MOVE.B  #87, D0
    TRAP    #15

    ; Volcar buffer oculto a pantalla
    MOVE.B  #94, D0
    TRAP    #15

    BRA     BUCLE_PRINCIPAL

    SIMHALT
    END     START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
