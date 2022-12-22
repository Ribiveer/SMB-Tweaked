WriteTopStatusLine:
      lda #$00          ;select main status bar
      jsr WriteGameText ;output it
      jmp IncSubtask    ;onto the next task