module EsAndEls

import Base: getindex, size, show

# functions
export greet,
       roll!,
       oneStep!,
       wholeGame!,
       getHistory,
# objects
       a,
       board1,
#types
       MoveArr,
       SingleDie,
       Game,
       Piece


greet() = println("Hello there!")
greet(str) = println("Hello $(str)!")
# Write your package code here.


include("types.jl")
include("moving.jl")
include("game.jl")
include("plotting.jl")

end
