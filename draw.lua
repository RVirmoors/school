-- update and draw
function update_debug(text)
    debug = text
    debug_timer = 10
end

function _update()
    for pl in all(players) do
        pl.update(pl)
        pl.animate(pl)
    end
end

function _draw()
    debug_timer = mid(0, debug_timer-1, 100)
    if debug_timer == 0 then debug = "" end
    cls()
    map(0,0)
    for pl in all(players) do
        spr(pl.sp, pl.x, pl.y, 2, 2, pl.flip)
        for p in all(particles) do
            particle_draw(p)
            particle_update(p)
        end
    end

    
    print(debug)
end
