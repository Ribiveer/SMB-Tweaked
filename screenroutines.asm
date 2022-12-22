ScreenRoutines:
      lda ScreenRoutineTask        ;run one of the following subroutines
      jsr JumpEngine
    
      .dw InitScreen
      .dw SetupIntermediate
      .dw WriteTopStatusLine
      .dw WriteBottomStatusLine
      .dw DisplayTimeUp
      .dw ResetSpritesAndScreenTimer
      .dw DisplayIntermediate
      .dw ResetSpritesAndScreenTimer
      .dw AreaParserTaskControl
      .dw GetAreaPalette
      .dw GetBackgroundColor
      .dw GetAlternatePalette
      .dw DrawTitleScreen
      .dw ClearBuffersDrawIcon
      .dw WriteTopScore