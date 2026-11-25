; PLAYER1
; Inicializar, mover con el teclado y dibujar el cubo que representa al luchador.
; porhjfqbfhqbefv

; ----------------------------------------------------------
; Coloca el cubo en su posicion inicial en pantalla
INICIALIZAR_CUBO
            MOVEM.L D0-D1, -(A7)            ; Guardar registros en la pila

            MOVE.W  #150, D0
            MOVE.W  D0, (POS_X)             ; Posicion X inicial (izquierda)
            MOVE.W  #SCRHEIGH-ALTO_CUBO-40, D1
            MOVE.W  D1, (POS_Y)             ; Posicion Y inicial (encima del suelo)

            MOVEM.L (A7)+, D0-D1            ; Restaurar registros
            RTS

; ----------------------------------------------------------
; MOVER_CUBO
; Lee las teclas pulsadas y mueve el cubo sin salirse de los bordes de la pantalla

MOVER_CUBO
            MOVEM.L D0-D2, -(A7)            ; Guardar registros de trabajo

            ; Comprobar tecla IZQUIERDA
            MOVE.B  #19, D0                 ; Tarea 19: consultar estado de tecla
            MOVE.L  #TECLA_IZQ, D1          ; Tecla a comprobar
            TRAP    #15
            BTST.L  #0, D1                  ; Bit 0 = 1 significa tecla pulsada
            BEQ.S   COMPROBAR_DER           ; Si no esta pulsada, pasar a derecha

            MOVE.W  (POS_X), D2
            SUB.W   #VELOCIDAD_CUBO, D2     ; Mover hacia la izquierda (restar X)
            CMP.W   #0, D2                  ; Comprobar borde izquierdo
            BGE.S   GUARDAR_IZQ             ; Si no se sale, guardar
            CLR.W   D2                      ; Fijar en 0 para no salirse

GUARDAR_IZQ
            MOVE.W  D2, (POS_X)             ; Guardar nueva posicion X

COMPROBAR_DER
            ; Comprobar tecla DERECHA (D)
            MOVE.B  #19, D0
            MOVE.L  #TECLA_DER, D1
            TRAP    #15
            BTST.L  #0, D1
            BEQ.S   COMPROBAR_UP          ; Si no esta pulsada, pasar a arriba

            MOVE.W  (POS_X), D2
            ADD.W   #VELOCIDAD_CUBO, D2     ; Mover hacia la derecha (sumar X)
            CMP.W   #SCRWIDTH-ANCHO_CUBO, D2 ; Comprobar borde derecho
            BLE.S   GUARDAR_DER             ; Si cabe en pantalla, guardar
            MOVE.W  #SCRWIDTH-ANCHO_CUBO, D2 ; Fijar en el limite derecho

GUARDAR_DER
            MOVE.W  D2, (POS_X)             ; Guardar nueva posicion X

COMPROBAR_UP
            ; Comprobar tecla ARRIBA (W)
            MOVE.B  #19, D0
            MOVE.L  #TECLA_ARR, D1
            TRAP    #15
            BTST.L  #0, D1
            BEQ.S   COMPROBAR_DOWN           ; Si no esta pulsada, pasar a abajo

            MOVE.W  (POS_Y), D2
            SUB.W   #VELOCIDAD_CUBO, D2     ; Mover hacia arriba (restar Y)
            CMP.W   #0, D2                  ; Comprobar borde superior
            BGE.S   GUARDAR_ARR             ; Si no se sale, guardar
            CLR.W   D2                      ; Fijar en 0 para no salirse

GUARDAR_ARR
            MOVE.W  D2, (POS_Y)             ; Guardar nueva posicion Y

COMPROBAR_DOWN
            ; Comprobar tecla ABAJO
            MOVE.B  #19, D0
            MOVE.L  #TECLA_ABA, D1
            TRAP    #15
            BTST.L  #0, D1
            BEQ.S   FIN_MOVER_CUBO          ; Si no esta pulsada, terminar

            MOVE.W  (POS_Y), D2
            ADD.W   #VELOCIDAD_CUBO, D2     ; Mover hacia abajo (sumar Y)
            CMP.W   #SCRHEIGH-ALTO_CUBO, D2 ; Comprobar borde inferior
            BLE.S   GUARDAR_ABA             ; Si cabe en pantalla, guardar
            MOVE.W  #SCRHEIGH-ALTO_CUBO, D2 ; Fijar en el limite inferior

GUARDAR_ABA
            MOVE.W  D2, (POS_Y)             ; Guardar nueva posicion Y

FIN_MOVER_CUBO
            MOVEM.L (A7)+, D0-D2            ; Restaurar registros
            RTS

; ----------------------------------------------------------
; DIBUJAR_CUBO
; Dibuja un rectangulo coloreado en (POS_X, POS_Y)
; ----------------------------------------------------------
DIBUJAR_CUBO
            MOVEM.L D0-D4, -(A7)            ; Guardar registros

            ; Color del borde (blanco)
            MOVE.L  #$00FFFFFF, D1
            MOVE.B  #80, D0                 ; Tarea 80: color del lapiz/borde
            TRAP    #15

            ; Color del relleno
            MOVE.L  #$000000C8, D1
            MOVE.B  #81, D0                 ; Tarea 81: color de relleno
            TRAP    #15

            ; Calcular esquinas del rectangulo:
            ; (D1, D2) = superior izquierda | (D3, D4) = inferior derecha
            MOVE.W  (POS_X), D1
            MOVE.W  (POS_Y), D2
            MOVE.W  D1, D3
            ADD.W   #ANCHO_CUBO, D3
            MOVE.W  D2, D4
            ADD.W   #ALTO_CUBO, D4

            ; Dibujar rectangulo relleno
            MOVE.B  #87, D0                 ; Tarea 87: rectangulo relleno
            TRAP    #15

            MOVEM.L (A7)+, D0-D4            ; Restaurar registros
            RTS

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
