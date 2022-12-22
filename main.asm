;Original disassembly by doppelganger (doppelheathen@gmail.com)
;edited by Ribiveer (smbasm@ribiveer.com)

TWEAK_PAL_OPTIMISE_CHEEP_CHEEPS EQU 1
TWEAK_SMALL_OPTIMISATIONS EQU 1
TWEAK_SMB_DELUXE_LUIGI_PALETTE EQU 1
TWEAK_FIX_LIVES EQU 1

INESPRG 2
INESCHR 1
INESMAP 0
INESMIR 1

.INCLUDE "defines-nes.asm"
.INCLUDE "defines-game.asm"
.INCLUDE "constants.asm"

.org $8000              ; Makes sure that the addresses used have the proper offsets.

.INCLUDE "smb.asm"

;INTERRUPT VECTORS
      .PAD $FFFA
      .dw NonMaskableInterrupt
      .dw Start
      .dw $fff0  ;unused

.INCBIN "Super Mario Bros. (World).nes", $8010