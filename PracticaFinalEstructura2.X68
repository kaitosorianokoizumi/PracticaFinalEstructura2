*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
    
    INCLUDE "CONST.X68"
    INCLUDE "SYSCONST.X68"
    INCLUDE "SYSTEM.X68"
    INCLUDE "SYSVAR.X68"
    INCLUDE "VARS.X68"
    INCLUDE "STARTBUTTON.X68"
    
START:                  ; first instruction of program

    ;-- INICIALIZATION --
    JSR SYSINIT       

.LOOP
    ;-- UPDATE -- 
    
    ;READ INPUT DEVICES
    
    ;UPDATE GAME LOGIC
    
    ;-- SYNC --
    
    ;-- PLOT --
    
    ; CODIGO DE PRUEBA PARA PINTAR EL BOTON
    
    JSR STBTNPLOT
    
    BRA .LOOP

    SIMHALT

    END    START        



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
