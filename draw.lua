-- update and draw
function update_debug(text)
    debug = text
    debug_timer = 10
end

function _update()
    player_update()
    player_animate()
end

function _draw()
    debug_timer = mid(0, debug_timer-1, 100)
    if debug_timer == 0 then debug = "" end
    cls()
    map(0,0)
    spr(pl.sp, pl.x, pl.y, 2, 2, pl.flip)
    print(debug)
end
