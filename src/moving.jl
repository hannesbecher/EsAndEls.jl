


# Shortcuts
shortcuts = [
     #snakes    
     Snake(17, 6),
     Snake(30, 13),
     Snake(40, 23),
     Snake(57, 25),
     Snake(61, 41),
     Snake(71, 53),
     Snake(75, 32),
     Snake(85, 65),
     Snake(93, 73),
     Snake(99, 79),

     # ladders
     Ladder(2, 22),
     Ladder(12, 48),
     Ladder(15, 27),
     Ladder(24, 88),
     Ladder(50, 52),
     Ladder(43, 80),
     Ladder(63, 86),
     Ladder(72, 92),
     Ladder(84, 98)
]

boardSize = 100

board1 = MoveArr(100, shortcuts)


# add function to look up ne position on board