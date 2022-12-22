GetBackgroundColor:
           ldy BackgroundColorCtrl   ;check background color control
           beq NoBGColor             ;if not set, increment task and fetch palette
           lda BGColorCtrl_Addr-4,y  ;put appropriate palette into vram
           sta VRAM_Buffer_AddrCtrl  ;note that if set to 5-7, $0301 will not be read
NoBGColor: inc ScreenRoutineTask     ;increment to next subtask and plod on through

; goes to GetPlayerColors