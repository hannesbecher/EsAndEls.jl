
roll!(x::Game) = roll!(x.die)
move!(x::Game) = move!(x.pieces[x.whoseTurn])
getPos(x::Game) = getPos(x.pieces[x.whoseTurn])
size(x::Game) = size(x.moveArr)

function getHistory(x::Game, pp::Int)
    if pp < 1 error("pp must correspond to an existing piece ithe game.") end
    if pp > x.nPieces error("pp must correspond to an existing piece ithe game.") end
    getHistory(x.pieces[pp])
end

function oneStep!(x::Game)
    
    # roll die
    d = roll!(x)
    
    p=getPos(x)
    pNew=p+d
    
    # check game over
    if pNew >= size(x) # if so, move piece out of board and set gameOver=true
        #println("Game over!")
        x.gameOver=true
        move!(x.pieces[x.whoseTurn], pNew)
        return false
    end

    move!(x.pieces[x.whoseTurn], x.moveArr[pNew])
    x.whoseTurn = mod1(x.whoseTurn + 1, x.nPieces)
    return true

end

function wholeGame!(x::Game)
    while true
        if oneStep!(x) == false break end
    end

end