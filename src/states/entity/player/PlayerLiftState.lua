  

PlayerLiftState = Class{__includes = BaseState}

function PlayerLiftState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 8
    self.player.holding = false
    -- create hitbox based on where the player is and facing
    local direction = self.player.direction
    self.player:changeAnimation('lift-' .. self.player.direction)
    
end

function PlayerLiftState:enter(params)
    self.player.holding = false
    if(self.player.blockedBy ~= nil) then 
        for k, object in pairs(self.dungeon.currentRoom.objects) do
            if self.player.blockedBy == object then
                table.remove(self.dungeon.currentRoom.objects, k)
                self.player.holding = true
            end
        end
    end
    self.player.currentAnimation:refresh()
end

function PlayerLiftState:update(dt)
    
    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        if(self.player.holding == true) then
            self.player:changeState('pot-idle')
        else 
            self.player:changeState('idle')
        end
    end

end

function PlayerLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        self.player.x , self.player.y - self.player.offsetY)
end