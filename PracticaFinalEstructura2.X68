*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
    
    INCLUDE "SYSCONST.X68"
    INCLUDE "SYSTEM.X68"
    INCLUDE "SYSVAR.X68"
    INCLUDE "VARS.X68"
    INCLUDE "CONST.X68"
    
    
START:                  ; first instruction of program

    ;-- INICIALIZATION --
           

.LOOP
    ;-- UPDATE -- 
    
    ;READ INPUT DEVICES
    
    ;UPDATE GAME LOGIC
    
    ;-- SYNC --
    
    ;-- PLOT --
    
    BRA .LOOP

    SIMHALT

    END    START        


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
