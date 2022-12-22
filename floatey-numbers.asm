;data is used as tiles for numbers
;that appear when you defeat enemies
FloateyNumTileData:
      .db $ff, $ff ;dummy
      .db $f6, $fb ; "100"
      .db $f7, $fb ; "200"
      .db $f8, $fb ; "400"
      .db $f9, $fb ; "500"
      .db $fa, $fb ; "800"
      .db $f6, $50 ; "1000"
      .db $f7, $50 ; "2000"
      .db $f8, $50 ; "4000"
      .db $f9, $50 ; "5000"
      .db $fa, $50 ; "8000"
      .db $fd, $fe ; "1-UP"

;high nybble is digit number, low nybble is number to
;add to the digit of the player's score
ScoreUpdateData:
      .db $ff ;dummy
      .db $41, $42, $44, $45, $48
      .db $31, $32, $34, $35, $38, $00

FloateyNumbersRoutine:
              lda FloateyNum_Control,x     ;load control for floatey number
              beq EndExitOne               ;if zero, branch to leave
              cmp #$0b                     ;if less than $0b, branch
              bcc ChkNumTimer
              lda #$0b                     ;otherwise set to $0b, thus keeping
              sta FloateyNum_Control,x     ;it in range
ChkNumTimer:  tay                          ;use as Y
              lda FloateyNum_Timer,x       ;check value here
              bne DecNumTimer              ;if nonzero, branch ahead
              sta FloateyNum_Control,x     ;initialize floatey number control and leave
              rts
DecNumTimer:  dec FloateyNum_Timer,x       ;decrement value here
              cmp #$2b                     ;if not reached a certain point, branch  
              bne ChkTallEnemy
              cpy #$0b                     ;check offset for $0b
              bne LoadNumTiles             ;branch ahead if not found
              inc NumberofLives            ;give player one extra life (1-up)
              lda #Sfx_ExtraLife
              sta Square2SoundQueue        ;and play the 1-up sound
LoadNumTiles: lda ScoreUpdateData,y        ;load point value here
              lsr                          ;move high nybble to low
              lsr
              lsr
              lsr
              tax                          ;use as X offset, essentially the digit
              lda ScoreUpdateData,y        ;load again and this time
              and #%00001111               ;mask out the high nybble
              sta DigitModifier,x          ;store as amount to add to the digit
              jsr AddToScore               ;update the score accordingly
ChkTallEnemy: ldy Enemy_SprDataOffset,x    ;get OAM data offset for enemy object
              lda Enemy_ID,x               ;get enemy object identifier
              cmp #Spiny
              beq FloateyPart              ;branch if spiny
              cmp #PiranhaPlant
              beq FloateyPart              ;branch if piranha plant
              cmp #HammerBro
              beq GetAltOffset             ;branch elsewhere if hammer bro
              cmp #GreyCheepCheep
              beq FloateyPart              ;branch if cheep-cheep of either color
              cmp #RedCheepCheep
              beq FloateyPart
              cmp #TallEnemy
              bcs GetAltOffset             ;branch elsewhere if enemy object => $09
              lda Enemy_State,x
              cmp #$02                     ;if enemy state defeated or otherwise
              bcs FloateyPart              ;$02 or greater, branch beyond this part
GetAltOffset: ldx SprDataOffset_Ctrl       ;load some kind of control bit
              ldy Alt_SprDataOffset,x      ;get alternate OAM data offset
              ldx ObjectOffset             ;get enemy object offset again
FloateyPart:  lda FloateyNum_Y_Pos,x       ;get vertical coordinate for
              cmp #$18                     ;floatey number, if coordinate in the
              bcc SetupNumSpr              ;status bar, branch
              sbc #$01
              sta FloateyNum_Y_Pos,x       ;otherwise subtract one and store as new
SetupNumSpr:  lda FloateyNum_Y_Pos,x       ;get vertical coordinate
              sbc #$08                     ;subtract eight and dump into the
              jsr DumpTwoSpr               ;left and right sprite's Y coordinates
              lda FloateyNum_X_Pos,x       ;get horizontal coordinate
              sta Sprite_X_Position,y      ;store into X coordinate of left sprite
              clc
              adc #$08                     ;add eight pixels and store into X
              sta Sprite_X_Position+4,y    ;coordinate of right sprite
              lda #$02
              sta Sprite_Attributes,y      ;set palette control in attribute bytes
              sta Sprite_Attributes+4,y    ;of left and right sprites
              lda FloateyNum_Control,x
              asl                          ;multiply our floatey number control by 2
              tax                          ;and use as offset for look-up table
              lda FloateyNumTileData,x
              sta Sprite_Tilenumber,y      ;display first half of number of points
              lda FloateyNumTileData+1,x
              sta Sprite_Tilenumber+4,y    ;display the second half
              ldx ObjectOffset             ;get enemy object offset and leave
              rts