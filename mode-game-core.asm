GameCoreRoutine:
      ldx CurrentPlayer          ;get which player is on the screen
      lda SavedJoypadBits,x      ;use appropriate player's controller bits
      sta SavedJoypadBits        ;as the master controller bits
      jsr GameRoutines           ;execute one of many possible subs
      lda OperMode_Task          ;check major task of operating mode
      cmp #$03                   ;if we are supposed to be here,
      bcs GameEngine             ;branch to the game engine itself
      rts