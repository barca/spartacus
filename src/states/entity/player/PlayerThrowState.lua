  

PlayerThrowState = Class{__includes = BaseState}

function PlayerThrowState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 8
    self.player.holding = false
    -- create hitbox based on where the player is and facing
    local direction = self.player.direction
    self.player:changeAnimation('throw-' .. self.player.direction)
    
end

function PlayerThrowState:enter(params)
    local pot = GameObject(
            GAME_OBJECT_DEFS['pot'],
            self.player.x, self.player.y - 5
        )
    if(self.player.direction == 'up') then
        pot.dy = -40    
    elseif(self.player.direction == 'down') then
        pot.dy = 40    
    elseif(self.player.direction == 'left') then
        pot.dx = -40    
    else
        pot.dx = 40
    end
    pot.projectile = true
    table.insert(self.dungeon.currentRoom.objects, pot)
    self.player.currentAnimation:refresh()
end

function PlayerThrowState:update(dt)
	if self.player.currentAnimation.timesPlayed > 0 then
		self.player.currentAnimation.timesPlayed = 0
		self.player:changeState('idle')
	end
end

function PlayerThrowState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[self.player:getTexture(anim)], gFrames[self.player:getTexture(anim)][anim:getCurrentFrame()],
        self.player.x , self.player.y - self.player.offsetY)
end