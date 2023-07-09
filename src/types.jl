
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
