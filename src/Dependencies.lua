--
-- libraries
--

Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/constants'
require 'src/Entity'
require 'src/entity_defs'
require 'src/GameObject'
require 'src/game_objects'
require 'src/Hitbox'
require 'src/Player'
require 'src/StateMachine'
require 'src/Util'

require 'src/world/Doorway'
require 'src/world/Dungeon'
require 'src/world/Room'

require 'src/states/BaseState'

require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'
require 'src/states/entity/EntityAttackState'

require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerPotIdleState'
require 'src/states/entity/player/PlayerSwingSwordState'
require 'src/states/entity/player/PlayerLiftState'
require 'src/states/entity/player/PlayerThrowState'
require 'src/states/entity/player/PlayerWalkState'
require 'src/states/entity/player/PlayerPotWalkState'

require 'src/states/game/GameOverState'
require 'src/states/game/CharacterSelectState'
require 'src/states/game/PlayState'
require 'src/states/game/GameWinState'
require 'src/states/game/StartState'

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/tilesheet.png'),
    ['pot'] = love.graphics.newImage('graphics/tilesheet.png'),
    ['background'] = love.graphics.newImage('graphics/background.png'),
    ['character-walk'] = love.graphics.newImage('graphics/character_walk.png'),
    ['character-pot-walk'] = love.graphics.newImage('graphics/character_pot_walk.png'),
    ['character-swing-sword'] = love.graphics.newImage('graphics/character_swing_sword.png'),
    ['character-pot-lift'] = love.graphics.newImage('graphics/character_pot_lift.png'),
    ['hearts'] = love.graphics.newImage('graphics/hearts.png'),
    ['switches'] = love.graphics.newImage('graphics/switches.png'),
    ['entities'] = love.graphics.newImage('graphics/entities.png'),
    ['sword'] = love.graphics.newImage('graphics/sword.png'),
    ['spear'] = love.graphics.newImage('graphics/spear.png'),
    ['spearman'] = love.graphics.newImage('graphics/character(Spear).png'),
    ['swordman'] = love.graphics.newImage('graphics/character(Sword).png'),
    ['spearwoman'] = love.graphics.newImage('graphics/spearwoman.png'),
    ['swordswoman'] = love.graphics.newImage('graphics/swordswoman.png'),
    ['goblin'] = love.graphics.newImage('graphics/goblin.png'),
    ['attack'] = love.graphics.newImage('graphics/goblin.png')
}
gFrames = {
    ['sword'] = GenerateQuads(gTextures['sword'], 15, 32),
    ['spear'] = GenerateQuads(gTextures['spear'], 16, 16),
    ['goblin'] = GenerateQuads(gTextures['goblin'], 32, 32),
    ['attack'] = GenerateQuads(gTextures['attack'], 96, 96),
    ['swordswoman'] = GenerateQuads(gTextures['swordswoman'], 32, 32),
    ['spearwoman'] = GenerateQuads(gTextures['spearwoman'], 32, 32),
    ['swordman'] = GenerateQuads(gTextures['swordman'], 32, 32),
    ['spearman'] = GenerateQuads(gTextures['spearman'], 32, 32),
    ['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
    ['pot'] = GenerateQuads(gTextures['pot'], 16, 16),
    ['character-walk'] = GenerateQuads(gTextures['character-walk'], 16, 32),
    ['character-swing-sword'] = GenerateQuads(gTextures['character-swing-sword'], 32, 32),
    ['character-pot-lift'] = GenerateQuads(gTextures['character-pot-lift'], 16, 32),
    ['character-pot-walk'] = GenerateQuads(gTextures['character-pot-walk'], 16, 32),
    ['entities'] = GenerateQuads(gTextures['entities'], 16, 16),
    ['hearts'] = GenerateQuads(gTextures['hearts'], 16, 16),
    ['switches'] = GenerateQuads(gTextures['switches'], 16, 18)
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['gothic-medium'] = love.graphics.newFont('fonts/GothicPixels.ttf', 16),
    ['gothic-large'] = love.graphics.newFont('fonts/GothicPixels.ttf', 32),
    ['zelda'] = love.graphics.newFont('fonts/zelda.otf', 64),
    ['zelda-small'] = love.graphics.newFont('fonts/zelda.otf', 32)
}

gSounds = {
    ['music'] = love.audio.newSource('sounds/music.mp3'),
    ['sword'] = love.audio.newSource('sounds/sword.wav'),
    ['hit-enemy'] = love.audio.newSource('sounds/hit_enemy.wav'),
    ['hit-player'] = love.audio.newSource('sounds/hit_player.wav'),
    ['door'] = love.audio.newSource('sounds/door.wav')
}