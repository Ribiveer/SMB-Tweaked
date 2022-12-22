InitializeGame:
             ldy #$6f              ;clear all memory as in initialization procedure,
             jsr InitializeMemory  ;but this time, clear only as far as $076f
             ldy #$1f
ClrSndLoop:  sta SoundMemory,y     ;clear out memory used
             dey                   ;by the sound engines
             bpl ClrSndLoop
             lda #$18              ;set demo timer
             sta DemoTimer
             jsr LoadAreaPointer