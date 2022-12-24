SecondaryGameSetup:
             lda #$00
             sta DisableScreenFlag     ;enable screen output
             tay
ClearVRLoop: sta VRAM_Buffer1-1,y      ;clear buffer at $0300-$03ff
             iny
             bne ClearVRLoop
             sta GameTimerExpiredFlag  ;clear game timer exp flag
             sta DisableIntermediate   ;clear skip lives display flag
             sta BackloadingFlag       ;clear value here
             lda #$ff
             sta BalPlatformAlignment  ;initialize balance platform assignment flag
             lda ScreenLeft_PageLoc    ;get left side page location
             lsr Mirror_PPU_CTRL_REG1  ;shift LSB of ppu register #1 mirror out
             and #$01                  ;mask out all but LSB of page location
             ror                       ;rotate LSB of page location into carry then onto mirror
             rol Mirror_PPU_CTRL_REG1  ;this is to set the proper PPU name table
             jsr GetAreaMusic          ;load proper music into queue
             lda #$38                  ;load sprite shuffle amounts to be used later
             sta SprShuffleAmt+2
             lda #$48
             sta SprShuffleAmt+1
             lda #$58
             sta SprShuffleAmt
             ldx #$0e                  ;load default OAM offsets into $06e4-$06f2
ShufAmtLoop: lda DefaultSprOffsets,x
             sta SprDataOffset,x
             dex                       ;do this until they're all set
             bpl ShufAmtLoop
             ldy #$03                  ;set up sprite #0
ISpr0Loop:   lda Sprite0Data,y
             sta Sprite_Data,y
             dey
             bpl ISpr0Loop
            .IFNDEF TWEAK_SMALL_OPTIMISATIONS
             jsr DoNothing2            ;these jsrs doesn't do anything useful
             jsr DoNothing1
            .ENDIF
             inc Sprite0HitDetectFlag  ;set sprite #0 check flag
             inc OperMode_Task         ;increment to next task
             rts