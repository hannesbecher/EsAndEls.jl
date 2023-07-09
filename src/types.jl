
abstract type AbstractPiece end

getPos(x::AbstractPiece) = error("Not implemented for type $(typeof(x)).")
getHistory(x::AbstractPiece) = error("Not implemented for type $(typeof(x)).")
move!(x::AbstractPiece) = error("Not implemented for type $(typeof(x)).")


mutable struct Piece <: AbstractPiece
    pos::Int
    history::Vector{Int}
end

getPos(x::Piece) = x.pos
getHistory(x::Piece) = x.history
function move!(x::Piece, p::Int)
    x.pos=p
    push!(x.history, p)
end


Piece() = Piece(1, [1])

abstract type ShortCut end

struct Snake <: ShortCut
    start::Int
    ende::Int
end

struct Ladder <: ShortCut
    start::Int
    ende::Int
end

"""
    start(x::ShortCut)

Extract start field from a `ShortCut` object.
"""
start(x::ShortCut) = x.start

"""
ende(x::ShortCut)

Extract end field from a `ShortCut` object.
"""
ende(x::ShortCut) = x.ende

"""
    MoveArray(arr::Vector{Int}, size::Int)

A type to store how fields link up `MoveArray.arr` and the total number of fields `MoveArray.size` 
"""
struct MoveArray
    arr::Vector{Int}
    size::Int
end

getindex(x::MoveArray, i) = getindex(x.arr, i)

size(x::MoveArray) = x.size

function MoveArray(sz::Int, sc::Vector{ShortCut}) 
    a = collect(1:sz)
    for i in sc
        a[start(i)] = ende(i)
    end
    return MoveArray(a, sz)
end


MoveArray(sz::Int) = MoveArray(collect(1:sz), sz)


abstract type AbstractDie end

"""
    roll!(x::AbstractDie)

Roll die, return value and store in the die's `vals` slot.
"""
roll!(x::AbstractDie) = error("Not implemented for type $(typeof(x)).")

struct SingleDie <: AbstractDie
    n::Int
    vals::Vector{Int}
end

SingleDie(n::Int) = SingleDie(6, Int[])

function roll!(x::SingleDie)
    push!(x.vals, rand(1:x.n))
    return x.vals[end]
end



"""
   Game(moveArr::MoveArray,
   pieces::Vector{Piece},
   nPieces::Int,
   whoseTurn::Int,
   die::AbstractDie,
   gameOver::Bool)

Type to represent a game at a specific point in time.
"""
mutable struct Game
    moveArr::MoveArray
    pieces::Vector{Piece}
    nPieces::Int
    whoseTurn::Int
    die::AbstractDie
    gameOver::Bool
end

function Game() 
    Game(board1, 
         [Piece(), Piece()],
         2,
         1,
         SingleDie(6),
         false
        )
end
Game(a::MoveArray, b::Vector{Piece}, c::AbstractDie) = Game(a, b, length(b), 1, c, false)


function show(io::IO, ::MIME"text/plain", x::Game)
    print(io, x.pieces, "\n", x.whoseTurn, "'s turn\n", "die = ", x.die)

end
