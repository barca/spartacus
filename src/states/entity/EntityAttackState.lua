  

EntityAttackState = Class{__includes = BaseState}

function EntityAttackState:init(entity, player)
    self.entity = entity
    self.player = player

    -- render offset for spaced character sprite
    self.entity.offsetY = -15
    self.entity.offsetX = -15

    -- create hitbox based on where the player is and facing
    local direction = self.entity.direction
    
    local hitboxX, hitboxY, hitboxWidth, hitboxHeight

    if direction == 'left' then
        hitboxWidth = 16
        hitboxHeight = 16
        hitboxX = self.entity.x - hitboxWidth
        hitboxY = self.entity.y + 2
    elseif direction == 'right' then
        hitboxWidth = 16
        hitboxHeight = 16
        hitboxX = self.entity.x + self.entity.width
        hitboxY = self.entity.y + 2
    elseif direction == 'up' then
        hitboxWidth = 16
        hitboxHeight = 16
        hitboxX = self.entity.x
        hitboxY = self.entity.y - hitboxHeight
    else
        hitboxWidth = 16
        hitboxHeight = 16
        hitboxX = self.entity.x
        hitboxY = self.entity.y + self.entity.height
    end

    self.swordHitbox = Hitbox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
    self.entity:changeAnimation('attack-' .. self.entity.direction)
end

function EntityAttackState:enter(params)
    gSounds['sword']:stop()
    gSounds['sword']:play()

    -- restart sword swing animation
    self.entity.currentAnimation:refresh()
end

function EntityAttackState:processAI(params, dt)
    -- check if hitbox collides with any entities in the scene
    if self.player:collides(self.swordHitbox) then
        self.player:damage(1)
        if(self.player.health == 0) then
            gStateMachine:change('game-over')
        end
        gSounds['hit-enemy']:play()
    end

    if self.entity.currentAnimation.timesPlayed > 0 then
        self.entity.currentAnimation.timesPlayed = 0
        self.entity:changeState('walk')
    end
end

function EntityAttackState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures["attack"], gFrames["attack"][anim:getCurrentFrame() + self.entity.frameOffset],
        math.floor(self.entity.x + self.entity.offsetX), math.floor(self.entity.y + self.entity.offsetY))

    -- debug for player and hurtbox collision rects
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    -- love.graphics.rectangle('line', self.swordHurtbox.x, self.swordHurtbox.y,
    --     self.swordHurtbox.width, self.swordHurtbox.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end