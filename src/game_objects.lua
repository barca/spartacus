  

GAME_OBJECT_DEFS = {
    ['heart'] = {
        type = 'heart',
        texture = 'heart',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        consumable = true
    },
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        consumable = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['pot'] = {
        type = 'pot',
        texture = 'pot',
        frame = 2,
        width = 16,
        height = 16,
        solid = true,
        consumable = false
    },
    ['sword'] = {
        type = 'sword',
        texture = 'sword',
        frame = 1,
        width = 16,
        height = 32,
        solid = false,
        consumable = true,
    },
    ['spear'] = {
        type = 'spear',
        texture = 'spear',
        frame = 1,
        width = 16,
        height = 32,
        solid = false,
        consumable = true,
    },
    ['spearman'] = {
        type = 'spearman',
        texture = 'spearman',
        frame = 1,
        width = 32,
        height = 32,
        solid = false,
        consumable = true,
    }
}