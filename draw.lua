-- update and draw
function update_debug(text)
    debug = text
    debug_timer = 10
end

function _update()
    player2_update()
    player2_animate()
    player_update()
    player_animate()
end

function _draw()
    debug_timer = mid(0, debug_timer-1, 100)
    if debug_timer == 0 then debug = "" end
    cls()
    map(0,0)
    spr(pl.sp, pl.x, pl.y, 2, 2, pl.flip)
    spr(pl2.sp, pl2.x, pl2.y, 2, 2, pl2.flip)
    print(debug)
end
