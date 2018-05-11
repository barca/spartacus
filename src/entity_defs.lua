  

ENTITY_DEFS = {
    ['woman'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {(13 * 9 + 1),(13 * 9 + 2),(13 * 9 + 3),(13 * 9 + 4),(13 * 9 + 5),(13 * 9 + 6),(13 * 9 + 7),(13 * 9 + 8)},
                interval = 0.1,
                texture = 'spearwoman'
            },
            ['walk-right'] = {
                frames = {(13 * 11 + 1),(13 * 11 + 2),(13 * 11 + 3),(13 * 11 + 4),(13 * 11 + 5),(13 * 11 + 6),(13 * 11 + 7),(13 * 11 + 8)},
                interval = 0.1,
                texture = 'spearwoman'
            },
            ['walk-down'] = {
                frames = {(13 * 10 + 1),(13 * 10 + 2),(13 * 10 + 3),(13 * 10 + 4),(13 * 10 + 5),(13 * 10 + 6),(13 * 10 + 7),(13 * 10 + 8)},
                interval = 0.1,
                texture = 'spearwoman'
            },
            ['walk-up'] = {
                frames = {(13 * 8 + 1),(13 * 8 + 2),(13 * 8 + 3),(13 * 8 + 4),(13 * 8 + 5),(13 * 8 + 6),(13 * 8 + 7),(13 * 8 + 8)},
                interval = 0.1,
                texture = 'spearwoman'
            },
            ['idle-left'] = {
                frames = {(13 * 9 + 1)},
                texture = 'spearwoman'
            },
            ['idle-right'] = {
                frames = {(13 * 11 + 1)},
                texture = 'spearwoman'
            },
            ['idle-down'] = {
                frames = {(13 * 10 + 1)},
                texture = 'spearwoman'
            },
            ['idle-up'] = {
                frames = {(13 * 8 + 1)},
                texture = 'spearwoman'
            },
            ['spear-left'] = {
                frames = {(13 * 5 + 1),(13 * 5 + 2),(13 * 5 + 3),(13 * 5 + 4),(13 * 5 + 5),(13 * 5 + 6),(13 * 5 + 7),(13 * 5 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearwoman'
            },
            ['spear-right'] = {
                frames = {(13 * 7 + 1),(13 * 7 + 2),(13 * 7 + 3),(13 * 7 + 4),(13 * 7 + 5),(13 * 7 + 6),(13 * 7 + 7),(13 * 7 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearwoman'
            },
            ['spear-down'] = {
                frames = {(13 * 6 + 1),(13 * 6 + 2),(13 * 6 + 3),(13 * 6 + 4),(13 * 6 + 5),(13 * 6 + 6),(13 * 6 + 6),(13 * 6 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearwoman'
            },
            ['spear-up'] = {
                frames = {(13 * 4 + 1),(13 * 4 + 2),(13 * 4 + 3),(13 * 4 + 4),(13 * 4 + 5),(13 * 4 + 6),(13 * 4 + 4),(13 * 4 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearwoman'
            },
            ['sword-left'] = {
                frames = {(13 * 13 + 1),(13 * 13 + 2),(13 * 13 + 3),(13 * 13 + 4),(13 * 13 + 5),(13 * 13 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordswoman'
            },
            ['sword-right'] = {
                frames = {(13 * 15 + 1),(13 * 15 + 2),(13 * 15 + 3),(13 * 15 + 4),(13 * 15 + 5),(13 * 15 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordswoman'
            },
            ['sword-down'] = {
                frames = {(13 * 14 + 1),(13 * 14 + 2),(13 * 14 + 3),(13 * 14 + 4),(13 * 14 + 5),(13 * 14 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordswoman'
            },
            ['sword-up'] = {
                frames = {(13 * 12 + 1),(13 * 12 + 2),(13 * 12 + 3),(13 * 12 + 4),(13 * 12 + 5),(13 * 12 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordswoman'
            },
            ['lift-left'] = {
                frames = {10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-right'] = {
                frames = {4, 5, 6},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-down'] = {
                frames = {1, 2, 3},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-up'] = {
                frames = {7, 8, 9},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-walk-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.155,
                texture = 'character-pot-walk'
            },
            ['pot-walk-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.15,
                texture = 'character-pot-walk'
            },
            ['pot-walk-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'character-pot-walk'
            },
            ['pot-walk-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.15,
                texture = 'character-pot-walk'
            },
            ['pot-idle-left'] = {
                frames = {13},
                texture = 'character-pot-walk'
            },
            ['pot-idle-right'] = {
                frames = {5},
                texture = 'character-pot-walk'
            },
            ['pot-idle-down'] = {
                frames = {1},
                texture = 'character-pot-walk'
            },
            ['pot-idle-up'] = {
                frames = {9},
                texture = 'character-pot-walk'
            },
            ['throw-left'] = {
                frames = {12, 11, 10},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['throw-right'] = {
                frames = {6, 5, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['throw-down'] = {
                frames = {3, 2, 1},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['throw-up'] = {
                frames = {9, 8, 7},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
        }
    },
    ['player'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {(13 * 9 + 1),(13 * 9 + 2),(13 * 9 + 3),(13 * 9 + 4),(13 * 9 + 5),(13 * 9 + 6),(13 * 9 + 7),(13 * 9 + 8)},
                interval = 0.1,
                texture = 'spearman'
            },
            ['walk-right'] = {
                frames = {(13 * 11 + 1),(13 * 11 + 2),(13 * 11 + 3),(13 * 11 + 4),(13 * 11 + 5),(13 * 11 + 6),(13 * 11 + 7),(13 * 11 + 8)},
                interval = 0.1,
                texture = 'spearman'
            },
            ['walk-down'] = {
                frames = {(13 * 10 + 1),(13 * 10 + 2),(13 * 10 + 3),(13 * 10 + 4),(13 * 10 + 5),(13 * 10 + 6),(13 * 10 + 7),(13 * 10 + 8)},
                interval = 0.1,
                texture = 'spearman'
            },
            ['walk-up'] = {
                frames = {(13 * 8 + 1),(13 * 8 + 2),(13 * 8 + 3),(13 * 8 + 4),(13 * 8 + 5),(13 * 8 + 6),(13 * 8 + 7),(13 * 8 + 8)},
                interval = 0.1,
                texture = 'spearman'
            },
            ['idle-left'] = {
                frames = {(13 * 9 + 1)},
                texture = 'spearman'
            },
            ['idle-right'] = {
                frames = {(13 * 11 + 1)},
                texture = 'spearman'
            },
            ['idle-down'] = {
                frames = {(13 * 10 + 1)},
                texture = 'spearman'
            },
            ['idle-up'] = {
                frames = {(13 * 8 + 1)},
                texture = 'spearman'
            },
            ['spear-left'] = {
                frames = {(13 * 5 + 1),(13 * 5 + 2),(13 * 5 + 3),(13 * 5 + 4),(13 * 5 + 5),(13 * 5 + 6),(13 * 5 + 7),(13 * 5 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearman'
            },
            ['spear-right'] = {
                frames = {(13 * 7 + 1),(13 * 7 + 2),(13 * 7 + 3),(13 * 7 + 4),(13 * 7 + 5),(13 * 7 + 6),(13 * 7 + 7),(13 * 7 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearman'
            },
            ['spear-down'] = {
                frames = {(13 * 6 + 1),(13 * 6 + 2),(13 * 6 + 3),(13 * 6 + 4),(13 * 6 + 5),(13 * 6 + 6),(13 * 6 + 6),(13 * 6 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearman'
            },
            ['spear-up'] = {
                frames = {(13 * 4 + 1),(13 * 4 + 2),(13 * 4 + 3),(13 * 4 + 4),(13 * 4 + 5),(13 * 4 + 6),(13 * 4 + 4),(13 * 4 + 8)},
                interval = 0.05,
                looping=false,
                texture = 'spearman'
            },
            ['sword-left'] = {
                frames = {(13 * 13 + 1),(13 * 13 + 2),(13 * 13 + 3),(13 * 13 + 4),(13 * 13 + 5),(13 * 13 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordman'
            },
            ['sword-right'] = {
                frames = {(13 * 15 + 1),(13 * 15 + 2),(13 * 15 + 3),(13 * 15 + 4),(13 * 15 + 5),(13 * 15 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordman'
            },
            ['sword-down'] = {
                frames = {(13 * 14 + 1),(13 * 14 + 2),(13 * 14 + 3),(13 * 14 + 4),(13 * 14 + 5),(13 * 14 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordman'
            },
            ['sword-up'] = {
                frames = {(13 * 12 + 1),(13 * 12 + 2),(13 * 12 + 3),(13 * 12 + 4),(13 * 12 + 5),(13 * 12 + 6)},
                interval = 0.05,
                looping=false,
                texture = 'swordman'
            },
            ['lift-left'] = {
                frames = {10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-right'] = {
                frames = {4, 5, 6},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-down'] = {
                frames = {1, 2, 3},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-up'] = {
                frames = {7, 8, 9},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-walk-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.155,
                texture = 'character-pot-walk'
            },
            ['pot-walk-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.15,
                texture = 'character-pot-walk'
            },
            ['pot-walk-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'character-pot-walk'
            },
            ['pot-walk-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.15,
                texture = 'character-pot-walk'
            },
            ['pot-idle-left'] = {
                frames = {13},
                texture = 'character-pot-walk'
            },
            ['pot-idle-right'] = {
                frames = {5},
                texture = 'character-pot-walk'
            },
            ['pot-idle-down'] = {
                frames = {1},
                texture = 'character-pot-walk'
            },
            ['pot-idle-up'] = {
                frames = {9},
                texture = 'character-pot-walk'
            },
            ['throw-left'] = {
                frames = {12, 11, 10},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['throw-right'] = {
                frames = {6, 5, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['throw-down'] = {
                frames = {3, 2, 1},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['throw-up'] = {
                frames = {9, 8, 7},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-lift'
            },
        }
    },
    ['skeleton'] = {
        texture = 'entities',
        animations = {
            ['walk-left'] = {
                frames = {22, 23, 24, 23},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {34, 35, 36, 35},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {10, 11, 12, 11},
                interval = 0.2
            },
            ['walk-up'] = {
                frames = {46, 47, 48, 47},
                interval = 0.2
            },
            ['idle-left'] = {
                frames = {23}
            },
            ['idle-right'] = {
                frames = {35}
            },
            ['idle-down'] = {
                frames = {11}
            },
            ['idle-up'] = {
                frames = {47}
            }
        }
    },
    ['slime'] = {
        texture = 'entities',
        animations = {
            ['walk-left'] = {
                frames = {61, 62, 63, 62},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {73, 74, 75, 74},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {49, 50, 51, 50},
                interval = 0.2
            },
            ['walk-up'] = {
                frames = {86, 86, 87, 86},
                interval = 0.2
            },
            ['idle-left'] = {
                frames = {62}
            },
            ['idle-right'] = {
                frames = {74}
            },
            ['idle-down'] = {
                frames = {50}
            },
            ['idle-up'] = {
                frames = {86}
            }
        }
    },
    ['bat'] = {
        texture = 'entities',
        animations = {
            ['walk-left'] = {
                frames = {64, 65, 66, 65},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {76, 77, 78, 77},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {52, 53, 54, 53},
                interval = 0.2
            },
            ['walk-up'] = {
                frames = {88, 89, 90, 89},
                interval = 0.2
            },
            ['idle-left'] = {
                frames = {64, 65, 66, 65},
                interval = 0.2
            },
            ['idle-right'] = {
                frames = {76, 77, 78, 77},
                interval = 0.2
            },
            ['idle-down'] = {
                frames = {52, 53, 54, 53},
                interval = 0.2
            },
            ['idle-up'] = {
                frames = {88, 89, 90, 89},
                interval = 0.2
            }
        }
    },
    ['ghost'] = {
        texture = 'entities',
        animations = {
            ['walk-left'] = {
                frames = {67, 68, 69, 68},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {79, 80, 81, 80},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {55, 56, 57, 56},
                interval = 0.2
            },
            ['walk-up'] = {
                frames = {91, 92, 93, 92},
                interval = 0.2
            },
            ['idle-left'] = {
                frames = {68}
            },
            ['idle-right'] = {
                frames = {80}
            },
            ['idle-down'] = {
                frames = {56}
            },
            ['idle-up'] = {
                frames = {92}
            }
        }
    },

    ['spider'] = {
        texture = 'entities',
        animations = {
            ['walk-left'] = {
                frames = {70, 71, 72, 71},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {82, 83, 84, 83},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {58, 59, 60, 59},
                interval = 0.2
            },
            ['walk-up'] = {
                frames = {94, 95, 96, 95},
                interval = 0.2
            },
            ['idle-left'] = {
                frames = {71}
            },
            ['idle-right'] = {
                frames = {83}
            },
            ['idle-down'] = {
                frames = {59}
            },
            ['idle-up'] = {
                frames = {95}
            }
        }
    },
     ['goblin'] = {
        texture = 'goblin',
        animations = {
            ['walk-left'] = {
                frames = {(24 * 9 + 1),(24 * 9 + 2),(24 * 9 + 3),(24 * 9 + 4),(24 * 9 + 5),(24 * 9 + 6),(24 * 9 + 7),(24 * 9 + 8)},
                interval = 0.1,
                texture = 'goblin'

            },
            ['walk-right'] = {
                frames = {(24 * 11 + 1),(24 * 11 + 2),(24 * 11 + 3),(24 * 11 + 4),(24 * 11 + 5),(24 * 11 + 6),(24 * 11 + 7),(24 * 11 + 8)},
                interval = 0.1,
                texture = 'goblin'
            },
            ['walk-down'] = {
                frames = {(24 * 10 + 1),(24 * 10 + 2),(24 * 10 + 3),(24 * 10 + 4),(24 * 10 + 5),(24 * 10 + 6),(24 * 10 + 7),(24 * 10 + 8)},
                interval = 0.1,
                texture = 'goblin'
            },
            ['walk-up'] = {
                frames = {(24 * 8 + 1),(24 * 8 + 2),(24 * 8 + 3),(24 * 8 + 4),(24 * 8 + 5),(24 * 8 + 6),(24 * 8 + 7),(24 * 8 + 8)},
                interval = 0.1,
                texture = 'goblin'
            },
            ['idle-left'] = {
                frames = {(24 * 9 + 1)},
                texture = 'goblin'
            },
            ['idle-right'] = {
                frames = {(24 * 11 + 1)},
                texture = 'goblin'
            },
            ['idle-down'] = {
                frames = {(24 * 10 + 1)},
                texture = 'goblin'
            },
            ['idle-up'] = {
                frames = {(24 * 8 + 1)},
                texture = 'goblin'
            },
            ['attack-left'] = {
                frames = {(8 * 8 + 1),(8 * 8 + 2),(8 * 8 + 3),(8 * 8 + 4),(8 * 8 + 5),(8 * 8 + 6)},
                interval = 0.05,
                looping=false,
                texture = '"attack'
            },
            ['attack-right'] = {
                frames = {(8 * 10 + 1),(8 * 10 + 2),(8 * 10 + 3),(8 * 10 + 4),(8 * 10 + 5),(8 * 10 + 6)},
                interval = 0.05,
                looping=false,
                texture = '"attack'
            },
            ['attack-down'] = {
                frames = {(8 * 9 + 1),(8 * 9 + 2),(8 * 9 + 3),(8 * 9 + 4),(8 * 9 + 5),(8 * 9 + 6)},
                interval = 0.05,
                looping=false,
                texture = '"attack'
            },
            ['attack-up'] = {
                frames = {(8 * 7 + 1),(8 * 7 + 2),(8 * 7 + 3),(8 * 7 + 4),(8 * 7 + 5),(8 * 7 + 6)},
                interval = 0.05,
                looping=false,
                texture = '"attack'
            },
        }
    }
}