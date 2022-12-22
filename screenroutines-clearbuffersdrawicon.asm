ClearBuffersDrawIcon:
             lda OperMode               ;check game mode
             bne IncModeTask_B          ;if not title screen mode, leave
             ldx #$00                   ;otherwise, clear buffer space
TScrClear:   sta VRAM_Buffer1-1,x
             sta VRAM_Buffer1-1+$100,x
             dex
             bne TScrClear
             jsr DrawMushroomIcon       ;draw player select icon
IncSubtask:  inc ScreenRoutineTask      ;move onto next task
             rts