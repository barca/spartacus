  

Room = Class{}

function Room:init(player)
    self.width = MAP_WIDTH
    self.height = MAP_HEIGHT

    self.tiles = {}
    self:generateWallsAndFloors()
    -- reference to player for collisions, etc.
    self.player = player

    -- entities in the room
    self.objects = {}
    self.entities = {}
    
    if(self.player.level == 7 or self.player.level == 12) then
        self:killAllRoom()
    elseif(self.player.level == 3) then
        self:puzzle1();
    elseif(self.player.level == 5) then
        self:puzzle2();
    elseif(self.player.level == 14) then
        self:generateEntities();
        self:puzzle4();
    elseif(self.player.level == 9) then
        self:generateEntities();
        self:puzzle3();
    elseif(self.player.level == 15) then
        self:GenerateGoblin()

    else 
        self:generateEntities();
        self:generateObjects();
    end
    -- game objects in the room

    -- doorways that lead to other dungeon rooms
    self.doorways = {}
    table.insert(self.doorways, Doorway('top', false, self))
    table.insert(self.doorways, Doorway('bottom', false, self))
    table.insert(self.doorways, Doorway('left', false, self))
    table.insert(self.doorways, Doorway('right', false, self))


    -- used for centering the dungeon rendering
    self.renderOffsetX = MAP_RENDER_OFFSET_X
    self.renderOffsetY = MAP_RENDER_OFFSET_Y

    -- used for drawing when this room is the next room, adjacent to the active
    self.adjacentOffsetX = 0
    self.adjacentOffsetY = 0
    self.level = self.player.level;
    self.count = 10;
end

function Room:killAllRoom()
    local types = {'spider', 'skeleton', 'slime', 'bat', 'ghost'}
    for i = 1, 10 do
         type = types[math.random(math.min(#types, self.player.level))]
         table.insert(self.entities, Entity {
            type = type, 
            animations = ENTITY_DEFS[type].animations,
            walkSpeed = ENTITY_DEFS[type].walkSpeed or 20,

            -- ensure X and Y are within bounds of the map
            x = math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
            y  = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 16),
            width = 16,
            height = 16,
            health = 1, 
        })
        self.entities[i].OnDeath = function()
           self.count = self.count - 1;
           if(self.count == 0) then
                for k, doorway in pairs(self.doorways) do
                    gSounds['door']:play()
                    doorway.open = true
                end
           end
        end;

        self.entities[i].stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(self.entities[i]) end,
            ['idle'] = function() return EntityIdleState(self.entities[i]) end
        }
        self.entities[i]:changeState('walk')
    end

end


function Room:puzzle1()
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'],
        math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                    VIRTUAL_WIDTH - TILE_SIZE * 2 - 96),
        math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE * 2 - 96)
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'],
        math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                    VIRTUAL_WIDTH - TILE_SIZE * 2 - 96),
        math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE * 2 - 96)
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'],
        math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                    VIRTUAL_WIDTH - TILE_SIZE * 2 - 96),
        math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE * 2 - 96)
    ))
    local switch = self.objects[1]
    switch.onCollide = function()
        if switch.state == 'unpressed' then
            switch.state = 'pressed'
            
            -- open every door in the room if we press the switch
            for k, doorway in pairs(self.doorways) do
                doorway.open = true
            end

            gSounds['door']:play()
        end
    end
end


function Room:puzzle2()

    check = {true, false, true, false, false, false, true, false, true }

    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 9.5 * TILE_SIZE, 4 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 9.5 * TILE_SIZE, 6 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 9.5 * TILE_SIZE, 8 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 11.5 * TILE_SIZE, 4 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 11.5 * TILE_SIZE, 6 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 11.5 * TILE_SIZE, 8 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 13.5 * TILE_SIZE, 4 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 13.5 * TILE_SIZE, 6 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 13.5 * TILE_SIZE, 8 * TILE_SIZE
    ))
    for i = 1,9 do
        local switch = self.objects[i]
        switch.onCollide = function()
            passed = true;
            if switch.state == 'unpressed' then
                switch.state = 'pressed'
                if(i == 2 or
                   i == 4 or i == 5 or i == 6 or
                   i == 8 ) then 
                    check[i] = true
                else 
                    check[i] = false
                end
                -- open every door in the room if we press the switch
            end
            for i = 1,9 do
                if(check[i] ~= true) then
                    passed = false
                end
            end
            if(passed == true) then
                for k, doorway in pairs(self.doorways) do
                    doorway.open = true
                end
                gSounds['door']:play()
            end
            local reset = true;
            for j = 1,9 do
                local togl = self.objects[j]
                if(togl.state == 'unpressed') then
                    reset = false;
                end
                if(reset == true and j == 9) then
                    check = {true, false, true, false, false, false, true, false, true }
                    for k = 1,9 do
                        local togl = self.objects[k]
                        togl.state = 'unpressed'  
                    end
                end
            end 

        end
    end
end

function Room:puzzle3()

    check = {false, false, false, false, true, false, false, false, false }

    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 9.5 * TILE_SIZE, 4 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 9.5 * TILE_SIZE, 6 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 9.5 * TILE_SIZE, 8 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 11.5 * TILE_SIZE, 4 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 11.5 * TILE_SIZE, 6 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 11.5 * TILE_SIZE, 8 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 13.5 * TILE_SIZE, 4 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 13.5 * TILE_SIZE, 6 * TILE_SIZE
    ))
   table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 13.5 * TILE_SIZE, 8 * TILE_SIZE
    ))
    for i = 1,9 do
        local switch = self.objects[i]
        switch.onCollide = function()
            passed = true;
            if switch.state == 'unpressed' then
                switch.state = 'pressed'
                if(i == 1 or i == 2 or i == 3 or 
                   i == 4 or i == 6 or
                   i == 7 or i == 8 or i == 9) then 
                    check[i] = true
                else 
                    check[i] = false
                end
                -- open every door in the room if we press the switch
            end
            for i = 1,9 do
                if(check[i] ~= true) then
                    passed = false
                end
            end
            if(passed == true) then
                for k, doorway in pairs(self.doorways) do
                    doorway.open = true
                end
                gSounds['door']:play()
            end
            local reset = true;
            for j = 1,9 do
                local togl = self.objects[j]
                if(togl.state == 'unpressed') then
                    reset = false;
                end
                if(reset == true and j == 9) then
                    check = {false, false, false, false, true, false, false, false, false }
                    for k = 1,9 do
                        local togl = self.objects[k]
                        togl.state = 'unpressed'  
                    end
                end
            end 

        end
    end

end
function Room:puzzle4()

    check = {false, false, false, false}

    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 4 * TILE_SIZE, 3 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 19 * TILE_SIZE, 3 * TILE_SIZE
    ))
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 4 * TILE_SIZE, 9 * TILE_SIZE
    ))
    
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'], 19 * TILE_SIZE, 9 * TILE_SIZE
    ))
    
    for i = 1,4 do
        local switch = self.objects[i]
        switch.onCollide = function()
            passed = true;
            if switch.state == 'unpressed' then
                switch.state = 'pressed'
                check[i] = true
                -- open every door in the room if we press the switch
            end
            for i = 1,4 do
                if(check[i] ~= true ) then
                    passed = false
                end
            end
            if(passed == true) then
                for k, doorway in pairs(self.doorways) do
                    doorway.open = true
                end
                gSounds['door']:play()
            end
            local reset = false;
            for j = 1,3 do
                if(check[j] == false and check[j + 1] == true ) then
                    reset = true
                end
                if(reset == true) then
                    check = {false, false, false, false}
                    for k = 1,4 do
                        local togl = self.objects[k]
                        togl.state = 'unpressed'  
                    end
                    break;
                end
            end
        end
    end

end
function Room:GenerateGoblin()
    for i = 1, 1 do
         type = 'goblin'
         table.insert(self.entities, Entity {
            type = type, 

            animations = ENTITY_DEFS[type].animations,
            walkSpeed = ENTITY_DEFS[type].walkSpeed or 20,

            -- ensure X and Y are within bounds of the map
            x = math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                VIRTUAL_WIDTH - TILE_SIZE * 2 - 32),
            y  = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 32),
            width = 32,
            height = 32,
            health = 250, 
        })
        self.entities[i].OnDeath = function() 
                gStateMachine:change('game-win')
        end

        self.entities[i].stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(self.entities[i]) end,
            ['idle'] = function() return EntityIdleState(self.entities[i]) end,
            ['attack'] = function() return EntityAttackState(self.entities[i], self.player) end
        }
        self.entities[i]:changeState('attack')
    end
end
--[[
    Randomly creates an assortment of enemies for the player to fight.
]]
function Room:generateEntities()
    local types = {'spider', 'skeleton', 'slime', 'bat', 'ghost'}
    for i = 1, 10 do
         type = types[math.random(math.min(#types, self.player.level))]
         table.insert(self.entities, Entity {
            type = type, 
            animations = ENTITY_DEFS[type].animations,
            walkSpeed = ENTITY_DEFS[type].walkSpeed or 20,

            -- ensure X and Y are within bounds of the map
            x = math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
            y  = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 16),
            width = 16,
            height = 16,
            health = 10 * self.player.level/2, 
        })

        self.entities[i].stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(self.entities[i]) end,
            ['idle'] = function() return EntityIdleState(self.entities[i]) end,
        }
        self.entities[i]:changeState('walk')
    end
end

--[[
    Randomly creates an assortment of obstacles for the player to navigate around.
]]
function Room:generateObjects()
    table.insert(self.objects, GameObject(
        GAME_OBJECT_DEFS['switch'],
        math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                    VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
        math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 16)
    ))

    x = math.random(5)
    for i =1, x do
        table.insert(self.objects, GameObject(
            GAME_OBJECT_DEFS['pot'],
            math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                        VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
            math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                        VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 16)
        ))
    end
    if(self.player.level % 4  == 0) then
        sword_index = (2 + x)
        x = x + 1;
        table.insert(self.objects, GameObject(
            GAME_OBJECT_DEFS['sword'],
            math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                        VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
            math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                        VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 16)
        ))   
        local sword = self.objects[sword_index]
        -- define a function for the sword that will open all doors in the room
        sword.onCollide = function()
            self.player.overwrite = true;
            self.player.weapon = 'sword'
            gSounds['door']:play()
        end

 
    end
    if(self.player.level % 3  == 0) then
        spear_index = (2 + x)
        table.insert(self.objects, GameObject(
            GAME_OBJECT_DEFS['spear'],
            math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,
                        VIRTUAL_WIDTH - TILE_SIZE * 2 - 16),
            math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                        VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 16)
        ))
        local spear = self.objects[spear_index]
        spear.onCollide = function()
            gSounds['door']:play()
        end
        spear.onCollide = function()
            self.player.overwrite = false;
            self.player.weapon = 'spear'
            gSounds['door']:play()
        end

    end
    -- get a reference to the switch
    local switch = self.objects[1]

    -- define a function for the switch that will open all doors in the room
    switch.onCollide = function()
        if switch.state == 'unpressed' then
            switch.state = 'pressed'
            
            -- open every door in the room if we press the switch
            for k, doorway in pairs(self.doorways) do
                doorway.open = true
            end

            gSounds['door']:play()
        end
    end
end

--[[
    Generates the walls and floors of the room, randomizing the various varieties
    of said tiles for visual variety.
]]
function Room:generateWallsAndFloors()
    for y = 1, self.height do
        table.insert(self.tiles, {})

        for x = 1, self.width do
            local id = TILE_EMPTY

            if x == 1 and y == 1 then
                id = TILE_TOP_LEFT_CORNER
            elseif x == 1 and y == self.height then
                id = TILE_BOTTOM_LEFT_CORNER
            elseif x == self.width and y == 1 then
                id = TILE_TOP_RIGHT_CORNER
            elseif x == self.width and y == self.height then
                id = TILE_BOTTOM_RIGHT_CORNER
            
            -- random left-hand walls, right walls, top, bottom, and floors
            elseif x == 1 then
                id = TILE_LEFT_WALLS[math.random(#TILE_LEFT_WALLS)]
            elseif x == self.width then
                id = TILE_RIGHT_WALLS[math.random(#TILE_RIGHT_WALLS)]
            elseif y == 1 then
                id = TILE_TOP_WALLS[math.random(#TILE_TOP_WALLS)]
            elseif y == self.height then
                id = TILE_BOTTOM_WALLS[math.random(#TILE_BOTTOM_WALLS)]
            else
                id = TILE_FLOORS[math.random(#TILE_FLOORS)]
            end
            
            table.insert(self.tiles[y], {
                id = id
            })
        end
    end
end

function Room:update(dt)
    -- don't update anything if we are sliding to another room (we have offsets)
    if self.adjacentOffsetX ~= 0 or self.adjacentOffsetY ~= 0 then return end

    self.player:update(dt)

    for i = #self.entities, 1, -1 do
        local entity = self.entities[i]

        -- remove entity from the table if health is <= 0
        if entity.health <= 0 then
            entity.dead = true
        elseif not entity.dead then
            entity:processAI({room = self}, dt)
            entity:update(dt)
        end

        -- collision between the player and entities in the room
        if not entity.dead and self.player:collides(entity) and not self.player.invulnerable then
            gSounds['hit-player']:play()
            self.player:damage(1)
            self.player:goInvulnerable(1.5)

            if self.player.health == 0 then
                gStateMachine:change('game-over')
            end
        end
    end

    for k, object in pairs(self.objects) do
        object:update(dt)
        local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) 
            + MAP_RENDER_OFFSET_Y - TILE_SIZE

        if object.x <= MAP_RENDER_OFFSET_X + TILE_SIZE or 
            object.x + object.width >= VIRTUAL_WIDTH - TILE_SIZE * 2 or
            object.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE - object.height / 2 or 
            object.y + object.height >= bottomEdge then
            table.remove(self.objects, k)
        end
        if(object.total >= 4 * TILE_SIZE) then
            table.remove(self.objects, k)
        end
        for v, entity in pairs(self.entities) do 
            if entity:collides(object) and object.projectile and not entity.isPlayer then
                entity:damage(1)
                gSounds['hit-enemy']:play()
                table.remove(self.objects, k)
            end
        end
        -- trigger collision callback on object
        if self.player:collides(object) then
            object:onCollide()
            if object.solid then
                self.player.blocked = self.player.direction
            end
            if object.consumable then
                object.onConsume(self)
                table.remove(self.objects, k)
            end
        end
    end
end

function Room:render()
    for y = 1, self.height do
        for x = 1, self.width do
            local tile = self.tiles[y][x]
            love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
                (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX, 
                (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY)
        end
    end

    -- render doorways; stencils are placed where the arches are after so the player can
    -- move through them convincingly
    for k, doorway in pairs(self.doorways) do
        doorway:render(self.adjacentOffsetX, self.adjacentOffsetY)
    end

    for k, object in pairs(self.objects) do
        object:render(self.adjacentOffsetX, self.adjacentOffsetY)
    end

    for k, entity in pairs(self.entities) do
        if not entity.dead then entity:render(self.adjacentOffsetX, self.adjacentOffsetY) end
    end

    -- stencil out the door arches so it looks like the player is going through
    love.graphics.stencil(function()
        -- left
        love.graphics.rectangle('fill', -TILE_SIZE - 6, MAP_RENDER_OFFSET_Y + (MAP_HEIGHT / 2) * TILE_SIZE - TILE_SIZE,
            TILE_SIZE * 2 + 6, TILE_SIZE * 2)
        
        -- right
        love.graphics.rectangle('fill', MAP_RENDER_OFFSET_X + (MAP_WIDTH * TILE_SIZE) - 6,
            MAP_RENDER_OFFSET_Y + (MAP_HEIGHT / 2) * TILE_SIZE - TILE_SIZE, TILE_SIZE * 2 + 6, TILE_SIZE * 2)
        
        -- top
        love.graphics.rectangle('fill', MAP_RENDER_OFFSET_X + (MAP_WIDTH / 2) * TILE_SIZE - TILE_SIZE,
            -TILE_SIZE - 6, TILE_SIZE * 2, TILE_SIZE * 2 + 12)
        
        --bottom
        love.graphics.rectangle('fill', MAP_RENDER_OFFSET_X + (MAP_WIDTH / 2) * TILE_SIZE - TILE_SIZE,
            VIRTUAL_HEIGHT - TILE_SIZE - 6, TILE_SIZE * 2, TILE_SIZE * 2 + 12)
    end, 'replace', 1)

    love.graphics.setStencilTest('less', 1)
    
    if self.player then
        self.player:render()
    end

    love.graphics.setStencilTest()
end