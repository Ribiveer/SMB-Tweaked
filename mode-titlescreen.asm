TitleScreenMode:
      lda OperMode_Task
      jsr JumpEngine

      .dw InitializeGame
      .dw ScreenRoutines
      .dw PrimaryGameSetup
      .dw GameMenuRoutine