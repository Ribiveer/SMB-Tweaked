# SMB Tweaked

This repo is a clean-up of a 2021 project of mine, where I aimed to make as many QoL changes and bug fixes to Super Mario Bros. on the NES as possible.
The changes are non-destructive, meaning that if you choose no Tweaks, you'll end up changing nothing to your ROM.
This repo was made for asm6f, but it might work with any other assembler.

## How to build

- Put your legally acquired Super Mario Bros. ROM in the same folder as `main.asm`. This file should have the following file name:  
`Super Mario Bros. (World).nes`.  
- In the file `main.asm`, choose which Tweaks you want to apply. You can do this by putting either `0` or `1` after the letters `EQU`.   
- With asm6f installed, run the following command:  
`asm6f main.asm "Super Mario Bros. Tweaked (World).nes"`  
The output file will contain all the Tweaks you applied.  

If you get a "value out of range" error, that means that the Tweaks in total add more bytes than they remove.
Some Tweaks, like `TWEAK_SMALL_OPTIMISATIONS` and `TWEAK_PAL_OPTIMISE_CHEEP_CHEEPS` are great sources of bytes, but if those two aren't enough, you should try a different combination of Tweaks.

## Special thanks

### The programmers at Nintendo R&D 4

While this code is full of patch-work indicative of a hasty and rocky development time, my goodness they put out something revolutionary.
I will likely never know what it's like to work on a game that pushed the limits as much as this game did back then,
and I hope the programmers and designers look back on this marvel, and the many ones they created afterwards, with contentment and pride.
I can only look starry-eyed at the immense joy they brought on this world, and working on this project has really brought home that they're regular humans too.
Regular humans who did something great.

### Doppelganger (doppelheathen@gmail.com)

The original legend. Because of his work, I was able to work with a readable file.
It is his comments, his never-ending figuring out how the game works, that I learned to read 6502 assembly without being incredibly overwhelmed.
(Well, still pretty overwhelmed, but positively so!)
His work has given me a newfound appreciation for this game, its console, and the people who made it. His work also made me a better programmer,
and probably thrown my life path into a better direction. Doppelganger, if you ever see this, thank you for everything!

### Displaced Gamers

[His video](https://www.youtube.com/watch?v=61m5MiyC17s) on the behaviour of the scroll lock helped me fix it!
His explanation of the fix is incomplete (on both the scroll lock and the warp destination sides) but his explanation of why it happens is spot-on.

### TakuikaNinja & Naoto
These two finally got me off my bum and actually release this! They're starting their own bug-fix repo [here](https://github.com/TakuikaNinja/smb1-bugfix),
which I will be contributing to. It will feature a more comprehensive overhaul of the game's code, alongside many of these Tweaks.

## Tweaks

### Small optimisations

You're going to want to enable this, no matter what! Removes a ton of unused code and makes the game run a teensy bit faster.
This is necessary to fit some of the other Tweaks.

### Sprite optimisations

This requires editing of some sprites! You'll need to edit your `Super Mario Bros. (World).nes` file for this.
This Tweak adds some optimisations. Some sprites are actually flipped or moved duplicates, so this Tweak makes sure the duplicates aren't used.
However, that does mean that if you apply this Tweak without changing the sprites, some sprites will seem to move weirdly or be flipped wrong! You have been warned.

### Miscelaneous Tweaks

#### Victory theme B-section

They said it was removed because it couldn't fit... Well, thanks to all the optimisations here, it can!
I haven't critically looked at the implementation of this since May 2021, and it's quite messy and a big bodge. But it works!!!

#### Flagpole 1-UP

When the player touches the top of the flagpole, they will now earn a 1-UP!

#### Modern scoring

This Tweak applies the scoring system of the modern Super Mario games to this one.
This means that if you bounce on many enemies in a row, defeat many enemies using a star, or kick a shell into a long enough row of enemies, you'll get 1-UPs.
The sound effect that's played when defeating an enemy will also rise in pitch, like in later games.

#### Modern power-up scaling

When Small Mario or Luigi get a Fire Flower, they will now turn Fire, rather than Super, like in later entries.

#### Modern damage scaling

When Fire Mario or Luigi get hit, they will now turn Super, rather than Small, like in later entries.

#### Modern enemy bouncing

When the player holds A while bouncing on an enemy, they will now bounce higher, like in later entries.

#### Modern enemy movement (Saves a good amount of bytes!)

When enemies land on the ground or touch the player, they will now continue to walk in their direction, like in later entries. 

#### Unconditional 1-UP blocks

Did you know that, depending on how many coins you collected in the third level of the previous world, hidden 1-UP blocks will spawn in the first level of the next world?
No? Well you're in luck! This Tweak makes sure they always spawn.

#### Title music

Adds an alternate version of the Underwater theme to the title screen.
Strictly speaking, this alternate version is an unintended side effect of two songs being queued up at the same time, but it does sound nice, doesn't it?

#### Dynamic lives screen

The lives screen now changes depending on what state Mario or Luigi are in.

#### Reroute World -1 to Bowser's sewage system

When making this project, I had a choice: do I do something about World -1, or let it take whatever form the byte configuration of the ROM gives it?
This Tweak makes it so that you'll always end up in the water section of World 8-4. It makes for fun speedrunning!

#### Consistent shell speed

Shells now move the same speed in the air as on land. They can go over 1-tile gaps now!

#### Force pipe crouching

Super and Fire Mario/Luigi now always crouch when entering a pipe, as opposed to sometimes.

#### Allow Player 2 pausing

In the original game, only Player 1 can pause the game, since the Famicom only gave Player 1 a start button. This Tweak makes it so that both players can pause!

#### Remove hammer bounce

Hammers now travel along their arcs when they hit the player. They are only bounced back when the player is invincible.

#### Start With Five Lives

Mario and Luigi now start with five lives, instead of three. This change resembles Super Mario All-Stars.

### Palette changes

#### Distinct Luigi palette

These two tweaks change Luigi's palette so he has a distinct Fire Flower palette. Miraculously, this Tweak saves bytes!
The following Subtweaks are available:
- Super Mario Bros. Deluxe Luigi
- Super Mario Maker 2 Luigi

#### Green Cheep Cheeps

Makes the Cheep Cheeps underwater green. They got their liveliness back!

### Fixes

#### Fix lives

You can choose which type of fix you want! The following Subtweaks are available:
- Lives are now capped at 99, and displayed properly with leading zero.
- Lives are now capped at 99, and displayed properly without leading zero.
- Lives are now capped at 255, and displayed properly with leading zero.
- Lives are now capped at 255, and displayed properly without leading zero.
- Lives will seem to go normal with a leading zero until you go past 99, at which point you'll get crowns. Lives are capped at 👑👑.
- Lives will seem to go normal without a leading zero until you go past 99, at which point you'll get crowns. Lives are capped at 👑👑.

#### Fix powerup momentum

When you collect a power-up while jumping, you'll keep your vertical speed now. This sadly also removes the power up jump glitch.

#### Fix star flagpole glitch

When you are invincible while touching the flagpole, you'll now lose your invincibility, rather than having the music glitch out.

#### Fix warp zone scrolling

Thanks to [Displaced Gamers' video](https://www.youtube.com/watch?v=61m5MiyC17s) on the behaviour of the scroll lock, it is now fixed and behaving as intended.
This Tweak wasn't in the original 2021 version, but I got carried away while reviving this project as a Github repo.

#### Fix crouching

The player now can crouch while falling from tiles, and while left/right is also pressed.
Swimming while crouching will now properly make the player stop crouching, so they can't get stuck at the end of water levels anymore.

#### Fix Spiny velocity

Lakitu now throws his Spinies with the velocity the designers intended.

#### Fix hidden block collisions

You can now run over their 1-tile gaps, and they don't allow you to phase through blocks anymore.

#### Fix starting input

When the player holds A or B while entering a level or exiting a warp pipe, the player will no lunger jump or fire a fireball. This removes the skating glitch as well.

#### Fix 5-1 small castle

Turn the small castle at the start of level 5-1 into a big castle, like it should be.

#### Fix Spiny block defeating

When the player bumps a block with a Spiny on it, the Spiny will now be defeated.

#### Fix the star power-up jumping out of the block

When a star comes out of a block, it will now always jump out, instead of sometimes falling out.

#### Fix small Mario's reversed walk cycle

Small Mario now doesn't moonwalk anymore.

### Changes from the PAL (European) version of the game.

#### Optimise Cheep Cheeps

Takes the Cheep Cheep code, and makes it a whole lot shorter and faster. I haven't looked into what they did, but it seems to work wonders.

#### Fix spring spawning

Makes it so that the spring spawning function doesn't override important sprite slots, leading to fewer glitches.

#### Fix spring force

I'll be completely honest: I have no idea why this matters. It's a change in the PAL version that might be useful, however.

#### Fix stomping

Reduces the possibility for "moustache jumps". While I'm personally not fond of this, other people might disagree.

#### Enlarge hitboxes

Makes hitboxes for certain enemies bigger. While I'm personally not fond of this, other people might disagree.
