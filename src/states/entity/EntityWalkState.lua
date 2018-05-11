  

EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, dungeon)
    self.entity = entity
    self.entity:changeAnimation('walk-down')

    self.dungeon = dungeon

    -- used for AI control
    self.moveDuration = 0
    self.movementTimer = 0

    -- keeps track of whether we just hit a wall
    self.bumped = false
end
local function checkCollision(entity, dungeon, dx, dy)
    if( not dungeon) then 
        return false
    end
    entity.x = entity.x + dx
    entity.y = entity.y + dy
    
    for k, object in pairs(dungeon.currentRoom.objects) do
        -- trigger collision callback on object
        if entity:collides(object) then
            if object.solid then
                entity.x = entity.x - dx
                entity.y = entity.y - dy
                entity.blockedBy = object
                return true
            end
        end
    end
    entity.blockedBy = nil
    entity.x = entity.x - dx
    entity.y = entity.y - dy
    return false
end

function EntityWalkState:update(dt)
    -- assume we didn't hit a wall
    self.bumped = false
    if self.entity.direction == 'left'then
        if(checkCollision(self.entity, self.dungeon, -(self.entity.walkSpeed * dt), 0)) then 
            return 
        end
        self.entity.x = self.entity.x - self.entity.walkSpeed * dt
        if self.entity.x <= MAP_RENDER_OFFSET_X + TILE_SIZE then 
            self.entity.x = MAP_RENDER_OFFSET_X + TILE_SIZE
            self.bumped = true
        end
    elseif self.entity.direction == 'right' then
        if(checkCollision(self.entity, self.dungeon, (self.entity.walkSpeed * dt), 0)) then 
            return 
        end
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt
        if self.entity.x + self.entity.width >= VIRTUAL_WIDTH - TILE_SIZE * 2 then
            self.entity.x = VIRTUAL_WIDTH - TILE_SIZE * 2 - self.entity.width
            self.bumped = true
        end
    elseif self.entity.direction == 'up' then
        if(checkCollision(self.entity, self.dungeon, 0,-(self.entity.walkSpeed * dt))) then 
            return 
        end
        self.entity.y = self.entity.y - self.entity.walkSpeed * dt
        if self.entity.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE - self.entity.height / 2 then 
            self.entity.y = MAP_RENDER_OFFSET_Y + TILE_SIZE - self.entity.height / 2
            self.bumped = true
        end
    elseif self.entity.direction == 'down' then
        if(checkCollision(self.entity, self.dungeon, 0, (self.entity.walkSpeed * dt))) then 
            return 
        end
        self.entity.y = self.entity.y + self.entity.walkSpeed * dt
        local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) 
            + MAP_RENDER_OFFSET_Y - TILE_SIZE

        if self.entity.y + self.entity.height >= bottomEdge then
            self.entity.y = bottomEdge - self.entity.height
            self.bumped = true
        end
    end
    self.entity.blocked = "none"
end

function EntityWalkState:processAI(params, dt)
    local room = params.room
    local directions = {'left', 'right', 'up', 'down'}

    if self.moveDuration == 0 or self.bumped then
        
        -- set an initial move duration and direction
        self.moveDuration = math.random(5)
        self.entity.direction = directions[math.random(#directions)]
        self.entity:changeAnimation('walk-' .. tostring(self.entity.direction))
    elseif self.movementTimer > self.moveDuration then
        self.movementTimer = 0

        -- chance to go idle
        if math.random(3) == 1 then
            self.entity:changeState('idle')
        else
            self.moveDuration = math.random(5)
            self.entity.direction = directions[math.random(#directions)]
            self.entity:changeAnimation('walk-' .. tostring(self.entity.direction))
        end
    end

    self.movementTimer = self.movementTimer + dt
end


function EntityWalkState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[self.entity:getTexture(anim)], gFrames[self.entity:getTexture(anim)][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
    if(self.entity.holding) then
        love.graphics.draw(gTextures['tiles'], gFrames['pot'][111], self.entity.x  , self.entity.y - 5)
    end
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end