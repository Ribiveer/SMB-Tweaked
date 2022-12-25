;Original disassembly by doppelganger (doppelheathen@gmail.com)
;Tweaks by Ribiveer (smbtweaks@ribiveer.com)

TWEAK_SMALL_OPTIMISATIONS EQU 1

;REQUIRES SPRITE EDITING. 
;Since I can't include the original file in this repo for obvious reasons, it's best if you figure out yourself what changed, and which sprites to flip / move to make this look right.
;After that, you have some sprites cleared for other uses!
TWEAK_SPRITE_OPTIMISATIONS EQU 0

TWEAK_VICTORY_B_SECTION EQU 1
TWEAK_FLAGPOLE_1UP EQU 1
TWEAK_MODERN_SCORING EQU 1
TWEAK_MODERN_POWERUP EQU 1
TWEAK_MODERN_DAMAGE EQU 1
TWEAK_MODERN_ENEMY_BOUNCE EQU 1
TWEAK_MODERN_ENEMY_MOVEMENT EQU 1
TWEAK_UNCONDITIONAL_1UP EQU 1
TWEAK_TITLE_MUSIC EQU 1
TWEAK_DYNAMIC_LIVES_SCREEN EQU 1
TWEAK_REROUTE_MINUS_WORLD_TO_BOWSERS_SEWAGE EQU 1
TWEAK_CONSISTENT_SHELL_AIR_SPEED EQU 1
TWEAK_FORCE_PIPE_CROUCHING EQU 1
TWEAK_PLAYER2_PAUSE EQU 1
TWEAK_REMOVE_HAMMER_BOUNCE EQU 1

TWEAK_SMB_DELUXE_LUIGI_PALETTE EQU 1
TWEAK_SMM2_LUIGI_PALETTE EQU 0
TWEAK_GREEN_CHEEP_CHEEPS EQU 1

TWEAK_FIX_LIVES EQU 1
TWEAK_FIX_POWERUP_MOMENTUM EQU 1
TWEAK_FIX_STAR_FLAGPOLE EQU 1
TWEAK_FIX_WARP_ZONE_SCROLL EQU 1
TWEAK_FIX_CROUCHING EQU 1
TWEAK_FIX_SPINY_VELOCITY EQU 1
TWEAK_FIX_STARTING_INPUT EQU 1
TWEAK_FIX_SMALL_CASTLES EQU 1
TWEAK_FIX_SPINY_BLOCK_HIT EQU 1
TWEAK_FIX_STAR_JUMP EQU 1
TWEAK_FIX_REVERSED_WALK_CYCLE EQU 1

TWEAK_PAL_OPTIMISE_CHEEP_CHEEPS EQU 1
TWEAK_PAL_FIX_SPRING_SPAWNING EQU 1
TWEAK_PAL_FIX_SPRING_FORCE EQU 1
TWEAK_PAL_FIX_STOMPING EQU 0
TWEAK_PAL_ENLARGE_HITBOXES EQU 0

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