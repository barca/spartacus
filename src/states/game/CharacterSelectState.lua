  

CharacterSelectState = Class{__includes = BaseState}

function CharacterSelectState:init()

end

function CharacterSelectState:enter(params)

end

function CharacterSelectState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    isMale = true
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('m') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
    if love.keyboard.wasPressed('w') then
        isMale = false
        gStateMachine:change('play')
    end
end

function CharacterSelectState:render()
    love.graphics.draw(gTextures['background'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['background']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['background']:getHeight())

    -- love.graphics.setFont(gFonts['gothic-medium'])
    -- love.graphics.printf('Legend of', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')

    -- love.graphics.setFont(gFonts['gothic-large'])
    -- love.graphics.printf('50', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['zelda-small'])
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf('Press W for women \n press M for men', 2, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH, 'center')


    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(gFonts['zelda-small'])
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
end