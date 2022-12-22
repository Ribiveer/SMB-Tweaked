GetAlternatePalette:
               lda AreaStyle            ;check for mushroom level style
               cmp #$01
               bne NoAltPal
               lda #$0b                 ;if found, load appropriate palette
SetVRAMAddr_B: sta VRAM_Buffer_AddrCtrl
NoAltPal:      jmp IncSubtask           ;now onto the next task