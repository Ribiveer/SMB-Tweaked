InitializeArea:
               ldy #$4b                 ;clear all memory again, only as far as $074b
               jsr InitializeMemory     ;this is only necessary in game mode
               ldx #$21
               lda #$00
ClrTimersLoop: sta Timers,x             ;clear out memory between
               dex                      ;$0780 and $07a1
               bpl ClrTimersLoop
               lda HalfwayPage
               ldy AltEntranceControl   ;if AltEntranceControl not set, use halfway page, if any found
               beq StartPage
               lda EntrancePage         ;otherwise use saved entry page number here
StartPage:     sta ScreenLeft_PageLoc   ;set as value here
               sta CurrentPageLoc       ;also set as current page
               sta BackloadingFlag      ;set flag here if halfway page or saved entry page number found
               jsr GetScreenPosition    ;get pixel coordinates for screen borders
               ldy #$20                 ;if on odd numbered page, use $2480 as start of rendering
               and #%00000001           ;otherwise use $2080, this address used later as name table
               beq SetInitNTHigh        ;address for rendering of game area
               ldy #$24
SetInitNTHigh: sty CurrentNTAddr_High   ;store name table address
               ldy #$80
               sty CurrentNTAddr_Low
               asl                      ;store LSB of page number in high nybble
               asl                      ;of block buffer column position
               asl
               asl
               sta BlockBufferColumnPos
               dec AreaObjectLength     ;set area object lengths for all empty
               dec AreaObjectLength+1
               dec AreaObjectLength+2
               lda #$0b                 ;set value for renderer to update 12 column sets
               sta ColumnSets           ;12 column sets = 24 metatile columns = 1 1/2 screens
               jsr GetAreaDataAddrs     ;get enemy and level addresses and load header
               lda PrimaryHardMode      ;check to see if primary hard mode has been activated
               bne SetSecHard           ;if so, activate the secondary no matter where we're at
               lda WorldNumber          ;otherwise check world number
               cmp #World5              ;if less than 5, do not activate secondary
               bcc CheckHalfway
               bne SetSecHard           ;if not equal to, then world > 5, thus activate
               lda LevelNumber          ;otherwise, world 5, so check level number
               cmp #Level3              ;if 1 or 2, do not set secondary hard mode flag
               bcc CheckHalfway
SetSecHard:    inc SecondaryHardMode    ;set secondary hard mode flag for areas 5-3 and beyond
CheckHalfway:  lda HalfwayPage
               beq DoneInitArea
               lda #$02                 ;if halfway page set, overwrite start position from header
               sta PlayerEntranceCtrl
DoneInitArea:  lda #Silence             ;silence music
               sta AreaMusicQueue
               lda #$01                 ;disable screen output
               sta DisableScreenFlag
               inc OperMode_Task        ;increment one of the modes
               rts