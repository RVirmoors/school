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