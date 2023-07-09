


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

moveArr = [2:101 3:102 4:103 5:104 6:105 7:106]
moveArr[moveArr .> 100] .= 100

# fill in shortcuts in 1st column
for i in shortcuts
    moveArr[start(i), 1] = ende(i)
end

for i in 2:6
    moveArr[1:99, i] = moveArr[2:100, i-1]
end