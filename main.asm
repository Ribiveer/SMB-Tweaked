;Original disassembly by doppelganger (doppelheathen@gmail.com)
;edited by Ribiveer (smbasm@ribiveer.com)

INESPRG 2
INESCHR 1
INESMAP 0
INESMIR 1

.INCLUDE "nes-defines.asm"
.INCLUDE "game-defines.asm"
.INCLUDE "constants.asm"

.org $8000              ; Makes sure that the addresses used have the proper offsets.

.INCLUDE "smb.asm"

.INCLUDE "music-data.asm"

;INTERRUPT VECTORS
      .PAD $FFFA
      .dw NonMaskableInterrupt
      .dw Start
      .dw $fff0  ;unused

.INCBIN "Super Mario Bros. (World).nes", $8010