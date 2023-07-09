# EsAndEls

[![Build Status](https://github.com/hannesbecher/EsAndEls.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/hannesbecher/EsAndEls.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/hannesbecher/EsAndEls.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/hannesbecher/EsAndEls.jl)

## Snakes and ladders
![S&L](img/photo.jpg)

## Try in a terminal window
```
using EsAndEls
a = Game()
wholeGame!(a)
a

using Plots
unicodeplots()
plot(getHistory(a, 1), label="P1")
plot!(getHistory(a, 2), label="P2")
ylabel!("Position")
xlabel!("Turn")
```
![term]("img/term.png")