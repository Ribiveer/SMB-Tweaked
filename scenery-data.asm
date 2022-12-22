BSceneDataOffsets:
      .db $00, $30, $60 

BackSceneryData:
   .db $93, $00, $00, $11, $12, $12, $13, $00 ;clouds
   .db $00, $51, $52, $53, $00, $00, $00, $00
   .db $00, $00, $01, $02, $02, $03, $00, $00
   .db $00, $00, $00, $00, $91, $92, $93, $00
   .db $00, $00, $00, $51, $52, $53, $41, $42
   .db $43, $00, $00, $00, $00, $00, $91, $92

   .db $97, $87, $88, $89, $99, $00, $00, $00 ;mountains and bushes
   .db $11, $12, $13, $a4, $a5, $a5, $a5, $a6
   .db $97, $98, $99, $01, $02, $03, $00, $a4
   .db $a5, $a6, $00, $11, $12, $12, $12, $13
   .db $00, $00, $00, $00, $01, $02, $02, $03
   .db $00, $a4, $a5, $a5, $a6, $00, $00, $00

   .db $11, $12, $12, $13, $00, $00, $00, $00 ;trees and fences
   .db $00, $00, $00, $9c, $00, $8b, $aa, $aa
   .db $aa, $aa, $11, $12, $13, $8b, $00, $9c
   .db $9c, $00, $00, $01, $02, $03, $11, $12
   .db $12, $13, $00, $00, $00, $00, $aa, $aa
   .db $9c, $aa, $00, $8b, $00, $01, $02, $03

BackSceneryMetatiles:
   .db $80, $83, $00 ;cloud left
   .db $81, $84, $00 ;cloud middle
   .db $82, $85, $00 ;cloud right
   .db $02, $00, $00 ;bush left
   .db $03, $00, $00 ;bush middle
   .db $04, $00, $00 ;bush right
   .db $00, $05, $06 ;mountain left
   .db $07, $06, $0a ;mountain middle
   .db $00, $08, $09 ;mountain right
   .db $4d, $00, $00 ;fence
   .db $0d, $0f, $4e ;tall tree
   .db $0e, $4e, $4e ;short tree

FSceneDataOffsets:
      .db $00, $0d, $1a

ForeSceneryData:
   .db $86, $87, $87, $87, $87, $87, $87   ;in water
   .db $87, $87, $87, $87, $69, $69

   .db $00, $00, $00, $00, $00, $45, $47   ;wall
   .db $47, $47, $47, $47, $00, $00

   .db $00, $00, $00, $00, $00, $00, $00   ;over water
   .db $00, $00, $00, $00, $86, $87

TerrainMetatiles:
      .db $69, $54, $52, $62

TerrainRenderBits:
      .db %00000000, %00000000 ;no ceiling or floor
      .db %00000000, %00011000 ;no ceiling, floor 2
      .db %00000001, %00011000 ;ceiling 1, floor 2
      .db %00000111, %00011000 ;ceiling 3, floor 2
      .db %00001111, %00011000 ;ceiling 4, floor 2
      .db %11111111, %00011000 ;ceiling 8, floor 2
      .db %00000001, %00011111 ;ceiling 1, floor 5
      .db %00000111, %00011111 ;ceiling 3, floor 5
      .db %00001111, %00011111 ;ceiling 4, floor 5
      .db %10000001, %00011111 ;ceiling 1, floor 6
      .db %00000001, %00000000 ;ceiling 1, no floor
      .db %10001111, %00011111 ;ceiling 4, floor 6
      .db %11110001, %00011111 ;ceiling 1, floor 9
      .db %11111001, %00011000 ;ceiling 1, middle 5, floor 2
      .db %11110001, %00011000 ;ceiling 1, middle 4, floor 2
      .db %11111111, %00011111 ;completely solid top to bottom