WriteGameText:
               pha                      ;save text number to stack
               asl
               tay                      ;multiply by 2 and use as offset
               cpy #$04                 ;if set to do top status bar or world/lives display,
               bcc LdGameText           ;branch to use current offset as-is
               cpy #$08                 ;if set to do time-up or game over,
               bcc Chk2Players          ;branch to check players
               ldy #$08                 ;otherwise warp zone, therefore set offset
Chk2Players:   lda NumberOfPlayers      ;check for number of players
               bne LdGameText           ;if there are two, use current offset to also print name
               iny                      ;otherwise increment offset by one to not print name
LdGameText:    ldx GameTextOffsets,y    ;get offset to message we want to print
               ldy #$00
GameTextLoop:  lda GameText,x           ;load message data
               cmp #$ff                 ;check for terminator
               beq EndGameText          ;branch to end text if found
               sta VRAM_Buffer1,y       ;otherwise write data to buffer
               inx                      ;and increment increment
               iny
               bne GameTextLoop         ;do this for 256 bytes if no terminator found
EndGameText:   lda #$00                 ;put null terminator at end
               sta VRAM_Buffer1,y
               pla                      ;pull original text number from stack
               tax
               cmp #$04                 ;are we printing warp zone?
               bcs PrintWarpZoneNumbers
               dex                      ;are we printing the world/lives display?
               bne CheckPlayerName      ;if not, branch to check player's name
               lda NumberofLives        ;otherwise, check number of lives
               clc                      ;and increment by one for display
               adc #$01
            .IFDEF TWEAK_FIX_LIVES
               ldy #$00
LivesLoop:     cmp #10                  ;more than 9 lives in y?
               bcc PutLives
               sbc #10                  ;if so, subtract 10 and
               iny                      ;increment the left digit
               sty VRAM_Buffer1+7  
               bne LivesLoop 
            .ELSE
               cmp #10                  ;more than 9 lives?
               bcc PutLives
               sbc #10                  ;if so, subtract 10 and put a crown tile
               ldy #$9f                 ;next to the difference...strange things happen if
               sty VRAM_Buffer1+7       ;the number of lives exceeds 19
            .ENDIF
PutLives:      sta VRAM_Buffer1+8
               ldy WorldNumber          ;write world and level numbers (incremented for display)
               iny                      ;to the buffer in the spaces surrounding the dash
               sty VRAM_Buffer1+19
               ldy LevelNumber
               iny
               sty VRAM_Buffer1+21      ;we're done here
               rts

CheckPlayerName:
             lda NumberOfPlayers    ;check number of players
             beq ExitChkName        ;if only 1 player, leave
             lda CurrentPlayer      ;load current player
             dex                    ;check to see if current message number is for time up
             bne ChkLuigi
             ldy OperMode           ;check for game over mode
             cpy #GameOverModeValue
             beq ChkLuigi
             eor #%00000001         ;if not, must be time up, invert d0 to do other player
ChkLuigi:    lsr
             bcc ExitChkName        ;if mario is current player, do not change the name
             ldy #$04
NameLoop:    lda LuigiName,y        ;otherwise, replace "MARIO" with "LUIGI"
             sta VRAM_Buffer1+3,y
             dey
             bpl NameLoop           ;do this until each letter is replaced
ExitChkName: rts

PrintWarpZoneNumbers:
             sbc #$04               ;subtract 4 and then shift to the left
             asl                    ;twice to get proper warp zone number
             asl                    ;offset
             tax
             ldy #$00
WarpNumLoop: lda WarpZoneNumbers,x  ;print warp zone numbers into the
             sta VRAM_Buffer1+27,y  ;placeholders from earlier
             inx
             iny                    ;put a number in every fourth space
             iny
             iny
             iny
             cpy #$0c
             bcc WarpNumLoop
             lda #$2c               ;load new buffer pointer at end of message
             jmp SetVRAMOffset