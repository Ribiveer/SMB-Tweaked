This is a pre-built version of Super Mario Bros. Tweaked. It contains most of the tweaks found in the original repo (https://github.com/Ribiveer/SMB-Tweaked).
Here is a list of the Tweaks made:

### Modifications ###
- Victory theme B-section: They said it was removed because it couldn't fit... Well, thanks to all the optimisations here, it can!
- Flagpole 1-UP: When the player touches the top of the flagpole, they will now earn a 1-UP!
- Modern scoring: If you bounce on many enemies in a row, defeat many enemies using a star, or kick a shell into a long enough row of enemies, you'll get more points and eventually 1-UPs.
- Modern power-up scaling & damage scaling: Power-ups now work like they do in later games!
- Modern enemy bouncing: When the player holds A while bouncing on an enemy, they will now bounce higher, like in later entries.
- Modern enemy movement: When enemies land on the ground or touch the player, they will now continue to walk in their direction, like in later entries. 
- Unconditional 1-Up blocks: 1-Up blocks now always spawn.
- Title music: Adds an alternate version of the Underwater theme to the title screen. Strictly speaking, this alternate version is an unintended side effect of a bug, but it does sound nice, doesn't it?
- Dynamic lives screen: The lives screen now changes depending on what state Mario or Luigi ia in.
- Super Mario Bros. Deluxe Luigi palette
- Consistent shell speed: Shells now move the same speed in the air as on land. They can go over 1-tile gaps now!
- Force pipe crouching: Super and Fire Mario/Luigi now always crouch when entering a pipe, as opposed to sometimes.
- Allow Player 2 pausing: In the original game, only Player 1 can pause the game, since the Famicom only gave Player 1 a start button. This Tweak makes it so that both players can pause!
- Remove hammer bounce: Hammers now travel along their arcs when they hit the player. They are only bounced back when the player is invincible.
- Green underwater Cheep Cheeps

### Fixes ###

- Fix World -1: The scroll locking now works as intended. Also, you'll be in for a surprise if you still manage to pull off the glitch!
- Fix lives: Lives are now displayed properly. If you get more than 99 lives, you'll get crowns for lives.
- Fix Spiny velocity: Lakitu now throws his Spinies with the velocity the designers intended.
- Fix crouching: Crouching is improved, removing some glitches like the infamous "getting stuck in the water levels" glitch.
- Fix powerup momentum: When you collect a power-up while jumping, you'll keep your vertical speed now. This sadly also removes the power up jump glitch.
- Fix star flagpole glitch: When you are invincible while touching the flagpole, you'll now lose your invincibility, rather than having the music glitch out.
- Fix starting input: When the player holds A or B while entering a level or exiting a warp pipe, the player will no lunger jump or fire a fireball. This removes the skating glitch as well.
- Fix 5-1 small castle: Turn the small castle at the start of level 5-1 into a big castle, like it should be.
- Fix Spiny block defeating: When the player bumps a block with a Spiny on it, the Spiny will now be defeated.
- Fix the star power-up jumping out of the block: When a star comes out of a block, it will now always jump out, instead of sometimes falling out.
- Fix small Mario's reversed walk cycle: Small Mario now doesn't moonwalk anymore.
- Fix the collision of invisible blocks.

### Changes from the PAL (European) version of the game ###

- Optimise Cheep Cheeps: Takes the Cheep Cheep code, and makes it a whole lot shorter and faster. I haven't looked into what they did, but it seems to work wonders.
- Fix spring spawning: Makes it so that the spring spawning function doesn't override important sprite slots, leading to fewer glitches.
- Fix spring force: I'll be completely honest: I have no idea why this matters. It's a change in the PAL version that might be useful, however.

### Special thanks to ###

### The programmers at Nintendo R&D 4 ###

While this code is full of patch-work indicative of a hasty and rocky development time, my goodness they put out something revolutionary.
I will likely never know what it's like to work on a game that pushed the limits as much as this game did back then,
and I hope the programmers and designers look back on this marvel, and the many ones they created afterwards, with contentment and pride.
I can only look starry-eyed at the immense joy they brought on this world, and working on this project has really brought home that they're regular humans too.
Regular humans who did something great.

### Doppelganger (doppelheathen@gmail.com) ###

The original legend. Because of his work, I was able to work with a readable file.
It is his comments, his never-ending figuring out how the game works, that I learned to read 6502 assembly without being incredibly overwhelmed.
(Well, still pretty overwhelmed, but positively so!)
His work has given me a newfound appreciation for this game, its console, and the people who made it. His work also made me a better programmer,
and probably thrown my life path into a better direction. Doppelganger, if you ever see this, thank you for everything!

### Displaced Gamers ###

[His video](https://www.youtube.com/watch?v=61m5MiyC17s) on the behaviour of the scroll lock helped me fix it!
His explanation of the fix is incomplete (on both the scroll lock and the warp destination sides) but his explanation of why it happens is spot-on.

### TakuikaNinja & Naoto ###
These two finally got me off my bum and actually release this! They're starting their own bug-fix repo (https://github.com/TakuikaNinja/smb1-bugfix),
which I will be contributing to. It will feature a more comprehensive overhaul of the game's code, alongside these Tweaks.