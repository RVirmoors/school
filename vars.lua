-- variables
function _init()
    debug = ""
    debug_timer = 0

    players = {}
    particles = {}
    enemies = {}

    make_player()
    printh("PLAYERS ARRAY")
    for pl in all(players) do
        printh(pl.x)
    end

    for i=0, 3 do
        make_enemy({x = rnd(120), y = rnd(120)})
    end

    gravity = 0.4
    friction = 0.85
end