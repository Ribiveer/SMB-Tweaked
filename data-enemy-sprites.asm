;tiles arranged in top left, right, middle left, right, bottom left, right order
EnemyGraphicsTable:
      .db $fc, $fc, $aa, $ab, $ac, $ad  ;buzzy beetle frame 1
      .db $fc, $fc, $ae, $af, $b0, $b1  ;             frame 2
      .db $fc, $a5, $a6, $a7, $a8, $a9  ;koopa troopa frame 1
      .db $fc, $a0, $a1, $a2, $a3, $a4  ;             frame 2
      .db $69, $a5, $6a, $a7, $a8, $a9  ;koopa paratroopa frame 1
      .db $6b, $a0, $6c, $a2, $a3, $a4  ;                 frame 2
      .db $fc, $fc, $96, $97, $98, $99  ;spiny frame 1
      .db $fc, $fc, $9a, $9b, $9c, $9d  ;      frame 2
      .db $fc, $fc, $8f, $8e, $8e, $8f  ;spiny's egg frame 1
      .db $fc, $fc, $95, $94, $94, $95  ;            frame 2
      .db $fc, $fc, $dc, $dc, $df, $df  ;bloober frame 1
      .db $dc, $dc, $dd, $dd, $de, $de  ;        frame 2
      .db $fc, $fc, $b2, $b3, $b4, $b5  ;cheep-cheep frame 1
      .db $fc, $fc, $b6, $b3, $b7, $b5  ;            frame 2
      .db $fc, $fc, $70, $71, $72, $73  ;goomba
      .db $fc, $fc, $6e, $6e, $6f, $6f  ;koopa shell frame 1 (upside-down)
      .db $fc, $fc, $6d, $6d, $6f, $6f  ;            frame 2
      .db $fc, $fc, $6f, $6f, $6e, $6e  ;koopa shell frame 1 (rightsideup)
      .db $fc, $fc, $6f, $6f, $6d, $6d  ;            frame 2
      .db $fc, $fc, $f4, $f4, $f5, $f5  ;buzzy beetle shell frame 1 (rightsideup)
      .db $fc, $fc, $f4, $f4, $f5, $f5  ;                   frame 2
      .db $fc, $fc, $f5, $f5, $f4, $f4  ;buzzy beetle shell frame 1 (upside-down)
      .db $fc, $fc, $f5, $f5, $f4, $f4  ;                   frame 2
      .db $fc, $fc, $fc, $fc, $ef, $ef  ;defeated goomba
      .db $b9, $b8, $bb, $ba, $bc, $bc  ;lakitu frame 1
      .db $fc, $fc, $bd, $bd, $bc, $bc  ;       frame 2
      .db $7a, $7b, $da, $db, $d8, $d8  ;princess
      .db $cd, $cd, $ce, $ce, $cf, $cf  ;mushroom retainer
      .db $7d, $7c, $d1, $8c, $d3, $d2  ;hammer bro frame 1
      .db $7d, $7c, $89, $88, $8b, $8a  ;           frame 2
      .db $d5, $d4, $e3, $e2, $d3, $d2  ;           frame 3
      .db $d5, $d4, $e3, $e2, $8b, $8a  ;           frame 4
      .db $e5, $e5, $e6, $e6, $eb, $eb  ;piranha plant frame 1
      .db $ec, $ec, $ed, $ed, $ee, $ee  ;              frame 2
      .db $fc, $fc, $d0, $d0, $d7, $d7  ;podoboo
      .db $bf, $be, $c1, $c0, $c2, $fc  ;bowser front frame 1
      .db $c4, $c3, $c6, $c5, $c8, $c7  ;bowser rear frame 1
      .db $bf, $be, $ca, $c9, $c2, $fc  ;       front frame 2
      .db $c4, $c3, $c6, $c5, $cc, $cb  ;       rear frame 2
      .db $fc, $fc, $e8, $e7, $ea, $e9  ;bullet bill
      .db $f2, $f2, $f3, $f3, $f2, $f2  ;jumpspring frame 1
      .db $f1, $f1, $f1, $f1, $fc, $fc  ;           frame 2
      .db $f0, $f0, $fc, $fc, $fc, $fc  ;           frame 3

EnemyGfxTableOffsets:
      .db $0c, $0c, $00, $0c, $0c, $a8, $54, $3c
      .db $ea, $18, $48, $48, $cc, $c0, $18, $18
      .db $18, $90, $24, $ff, $48, $9c, $d2, $d8
      .db $f0, $f6, $fc

EnemyAttributeData:
      .db $01, $02, $03, $02, $01, $01, $03, $03
      .db $03, $01, $01, $02, $02, $21, $01, $02
      .db $01, $01, $02, $ff, $02, $02, $01, $01
      .db $02, $02, $02

EnemyAnimTimingBMask:
      .db $08, $18

JumpspringFrameOffsets:
      .db $18, $19, $1a, $19, $18