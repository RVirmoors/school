-- player

function player_update()
    --physics
    pl.dy+=gravity
    pl.dx*=friction

    --controls
    if btn(⬅️) then
        pl.dx-=pl.acc
        pl.running=true
        pl.flip=true
    end
    if btn(➡️) then
        pl.dx+=pl.acc
        pl.running=true
        pl.flip=false
    end

    --slide
    if pl.running
    and not btn(⬅️)
    and not btn(➡️)
    and not pl.falling
    and not pl.jumping then
        pl.running = false
        pl.sliding = true
    end

    --jump
    if btnp(❎) and pl.landed then
        pl.dy-=pl.boost
        pl.landed=false
    end

    --check collision vertical
    if pl.dy>0 then
        pl.falling = true
        pl.landed = false
        pl.jumping = false
        if collide_map(pl,"d",0) then
            pl.landed = true
            pl.falling = false
            pl.dy = 0
            pl.y -= ((pl.y+pl.h+1)%8)-1
        end
    elseif pl.dy<0 then
        pl.jumping = true
        if collide_map(pl,"u",1) then
            pl.dy = 0
        end
    end

    --check collision horiz
    if pl.dx<0 then
        if collide_map(pl,"l",1) then
            pl.dx = 0
        end
    elseif pl.dx>0 then
        if collide_map(pl,"r",1) then
            pl.dx = 0
        end
    end

    --stop sliding
    if pl.sliding then
        if abs(pl.dx) < .2
        or pl.running then
            pl.dx=0
            pl.sliding=false
        end
    end

    pl.x += pl.dx
    pl.y += pl.dy
end

function player_animate()
    if pl.jumping then
        pl.sp = 13
    elseif pl.falling then
        pl.sp = 3
    elseif pl.sliding then
        pl.sp = 11
    elseif pl.running then
        if time()-pl.anim>.1 then
            pl.anim = time()
            pl.sp += 2
            if pl.sp > 11 then
                pl.sp = 5
            end
        end
    else -- idle
        if time()-pl.anim>.3 then
            pl.anim = time()
            pl.sp += 2
            if pl.sp > 3 then
                pl.sp = 1
            end
        end 
    end
end

function player2_update()
    --physics
    pl2.dy+=gravity
    pl2.dx*=friction

    --controls
    if btn(⬅️) then
        pl2.dx-=pl2.acc
        pl2.running=true
        pl2.flip=true
    end
    if btn(➡️) then
        pl2.dx+=pl2.acc
        pl2.running=true
        pl2.flip=false
    end

    --slide
    if pl2.running
    and not btn(⬅️)
    and not btn(➡️)
    and not pl2.falling
    and not pl2.jumping then
        pl2.running = false
        pl2.sliding = true
    end

    --jump
    if btnp(❎) and pl2.landed then
        pl2.dy-=pl2.boost
        pl2.landed=false
    end

    --check collision vertical
    if pl2.dy>0 then
        pl2.falling = true
        pl2.landed = false
        pl2.jumping = false
        if collide_map(pl2,"d",0) then
            pl2.landed = true
            pl2.falling = false
            pl2.dy = 0
            pl2.y -= ((pl2.y+pl2.h+1)%8)-1
        end
    elseif pl2.dy<0 then
        pl2.jumping = true
        if collide_map(pl2,"u",1) then
            pl2.dy = 0
        end
    end

    --check collision horiz
    if pl2.dx<0 then
        if collide_map(pl2,"l",1) then
            pl2.dx = 0
        end
    elseif pl2.dx>0 then
        if collide_map(pl2,"r",1) then
            pl2.dx = 0
        end
    end

    --stop sliding
    if pl2.sliding then
        if abs(pl2.dx) < .2
        or pl2.running then
            pl2.dx=0
            pl2.sliding=false
        end
    end

    pl2.x += pl2.dx
    pl2.y += pl2.dy
end

function player2_animate()
    if pl2.jumping then
        pl2.sp = 13
    elseif pl2.falling then
        pl2.sp = 3
    elseif pl2.sliding then
        pl2.sp = 11
    elseif pl2.running then
        if time()-pl2.anim>.1 then
            pl2.anim = time()
            pl2.sp += 2
            if pl2.sp > 11 then
                pl2.sp = 5
            end
        end
    else -- idle
        if time()-pl2.anim>.3 then
            pl2.anim = time()
            pl2.sp += 2
            if pl2.sp > 3 then
                pl2.sp = 1
            end
        end 
    end
end