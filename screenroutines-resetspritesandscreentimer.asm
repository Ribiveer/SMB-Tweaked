ResetSpritesAndScreenTimer:
         lda ScreenTimer             ;check if screen timer has expired
         bne NoReset                 ;if not, branch to leave
         jsr MoveAllSpritesOffscreen ;otherwise reset sprites now

ResetScreenTimer:
         lda #$07                    ;reset timer again
         sta ScreenTimer
         inc ScreenRoutineTask       ;move onto next task
NoReset: rts