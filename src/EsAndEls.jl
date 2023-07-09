module EsAndEls


# functions
export greet,
# objects
       a,
       board1,
#types
       MoveArr


greet() = println("Hello there!")
greet(str) = println("Hello $(str)!")
# Write your package code here.


include("types.jl")
include("moving.jl")

end
