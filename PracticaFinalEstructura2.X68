*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
    
    INCLUDE "SYSCONST.X68"
    INCLUDE "CONST.X68"
    INCLUDE "SYSTEM.X68"
    INCLUDE "SYSVAR.X68"
    INCLUDE "VARS.X68"
    INCLUDE "STARTBUTTON.X68"
    INCLUDE "PLAYER1.X68"
    
START:                  ; first instruction of program

    ;-- INICIALIZATION --
    JSR SYSINIT       

.LOOP
    ;-- UPDATE -- 
    
    ;READ INPUT DEVICES
    JSR STBTNCLICK
    ;UPDATE GAME LOGIC
    
    ;-- SYNC --
    
    ;-- PLOT --
    
    ; CODIGO DE PRUEBA PARA PINTAR EL BOTON
    
    JSR STBTNPLOT
    
    ; SI EL BOTON ESTA PULSADO, PINTA UN CUADRADO ROJO EN LA ESQUINA
    CMP #0, D0
    BEQ  .NOPINTAR
    MOVE.L  #$000000FF, D1
    BRA .ACABARPRUEBA
    
    
    ; SI NO TIENE QUE PINTAR, RELLENA DE NEGRO EL ESPACIO DE ANTES
.NOPINTAR
    MOVE.L  #$00000000, D1
    
.ACABARPRUEBA
    MOVE.B  #81, D0
    TRAP    #15
    MOVE.W  #0, D1
    MOVE.W  #0, D2
    MOVE.W  #100, D3
    MOVE.W  #100, D4
    MOVE.B  #87, D0
    TRAP    #15
    
    
    
    
    MOVE.B  #94, D0
    TRAP #15
    
    BRA .LOOP

    SIMHALT

    END    START        




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
