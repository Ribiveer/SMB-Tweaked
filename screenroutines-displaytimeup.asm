DisplayTimeUp:
          lda GameTimerExpiredFlag  ;if game timer not expired, increment task
          beq NoTimeUp              ;control 2 tasks forward, otherwise, stay here
          lda #$00
          sta GameTimerExpiredFlag  ;reset timer expiration flag
          lda #$02                  ;output time-up screen to buffer
          jmp OutputInter
NoTimeUp: inc ScreenRoutineTask     ;increment control task 2 tasks forward
          jmp IncSubtask