
abstract type Piece end


mutable struct GreenPiece <: Piece
    pos::Int
end

mutable struct RedPiece <: Piece
    pos::Int
end

mutable struct YellowPiece <: Piece
    pos::Int
end

mutable struct BluePiece <: Piece
    pos::Int
end

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


struct MoveArr
    arr::Vector{Int}
    size::Int
end

function MoveArr(sz::Int, sc::Vector{ShortCut})
    a = collect(1:sz)
    for i in sc
        a[start(i)] = ende(i)
    end
    return MoveArr(a, sz)
end


MoveArr(sz::Int) = MoveArr(collect(1:sz), sz)


# make a die type (possibly that saves its past states)
# and a roll! function