; TO-DO: this can be replaced with incrementing y, instead of doing the lookup.
AreaPalette:
      .db $01, $02, $03, $04

GetAreaPalette:
               ldy AreaType             ;select appropriate palette to load
               ldx AreaPalette,y        ;based on area type
SetVRAMAddr_A: stx VRAM_Buffer_AddrCtrl ;store offset into buffer control
NextSubtask:   jmp IncSubtask           ;move onto next task