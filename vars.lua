-- variables
function _init()
    debug = ""
    debug_timer = 0

    players = {}
    particles = {}

    make_player()
    printh("PLAYERS ARRAY")
    for pl in all(players) do
        printh(pl.x)
    end

    gravity = 0.4
    friction = 0.85
end