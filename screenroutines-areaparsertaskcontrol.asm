AreaParserTaskControl:
           inc DisableScreenFlag     ;turn off screen
TaskLoop:  jsr AreaParserTaskHandler ;render column set of current area
           lda AreaParserTaskNum     ;check number of tasks
           bne TaskLoop              ;if tasks still not all done, do another one
           dec ColumnSets            ;do we need to render more column sets?
           bpl OutputCol
           inc ScreenRoutineTask     ;if not, move on to the next task
OutputCol: lda #$06                  ;set vram buffer to output rendered column set
           sta VRAM_Buffer_AddrCtrl  ;on next NMI
           rts