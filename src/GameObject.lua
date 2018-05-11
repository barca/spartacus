  

GameObject = Class{}

function GameObject:init(def, x, y)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states
    self.consumable = def.consumable

    -- dimensions
    self.x = x
    self.y = y
    self.dx = 0
    self.dy = 0
    self.total = 0;
    self.width = def.width
    self.height = def.height
    self.projectile = false
    -- default empty collision callback
    self.onCollide = function() end
    self.onConsume = function() end
end

function GameObject:update(dt)    
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
    self.total = self.total + (self.dx * dt) + (self.dy * dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    if(self.type == "pot") then
        love.graphics.draw(gTextures['tiles'], gFrames['pot'][111], self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    elseif(self.type == "heart") then
        love.graphics.draw(gTextures['hearts'], gFrames['hearts'][5], self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    elseif(self.states) then 
       love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
          self.x + adjacentOffsetX, self.y + adjacentOffsetY) 
    else 
        love.graphics.draw(gTextures[self.type], gFrames[self.type][self.frame], self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    end
end