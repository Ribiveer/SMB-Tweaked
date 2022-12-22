WriteTopScore:
               lda #$fa           ;run display routine to display top score on title
               jsr UpdateNumber
IncModeTask_B: inc OperMode_Task  ;move onto next mode
               rts