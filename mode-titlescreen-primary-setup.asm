PrimaryGameSetup:
      lda #$01
      sta FetchNewGameTimerFlag   ;set flag to load game timer from header
      sta PlayerSize              ;set player's size to small
      lda #$02
      sta NumberofLives           ;give each player three lives
      sta OffScr_NumberofLives
    
; continues to SecondaryGameSetup