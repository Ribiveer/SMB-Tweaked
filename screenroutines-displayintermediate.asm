DisplayIntermediate:
               lda OperMode                 ;check primary mode of operation
               beq NoInter                  ;if in title screen mode, skip this
               cmp #GameOverModeValue       ;are we in game over mode?
               beq GameOverInter            ;if so, proceed to display game over screen
               lda AltEntranceControl       ;otherwise check for mode of alternate entry
               bne NoInter                  ;and branch if found
               ldy AreaType                 ;check if we are on castle level
               cpy #$03                     ;and if so, branch (possibly residual)
               beq PlayerInter
               lda DisableIntermediate      ;if this flag is set, skip intermediate lives display
               bne NoInter                  ;and jump to specific task, otherwise
PlayerInter:   jsr DrawPlayer_Intermediate  ;put player in appropriate place for
               lda #$01                     ;lives display, then output lives display to buffer
OutputInter:   jsr WriteGameText
               jsr ResetScreenTimer
               lda #$00
               sta DisableScreenFlag        ;reenable screen output
               rts
GameOverInter: lda #$12                     ;set screen timer
               sta ScreenTimer
               lda #$03                     ;output game over screen to buffer
               jsr WriteGameText
               jmp IncModeTask_B
NoInter:       lda #$08                     ;set for specific task and leave
               sta ScreenRoutineTask
               rts