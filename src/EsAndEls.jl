module EsAndEls


# functions
export greet,
# objects
       a,
       moveArr


greet() = println("Hello there!")
greet(str) = println("Hello $(str)!")
# Write your package code here.


include("types.jl")
include("moving.jl")

end
