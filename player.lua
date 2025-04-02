-- player

function make_player(params)
    -- constructor
    local p = {
        sp=1,
        x=19,
        y=59,
        w=16,
        h=16,
        flip=false,
        dx=0,
        dy=0,
        max_dx=2,
        max_dy=3,
        acc=0.5,
        boost=4,
        anim=0,
        running=false,
        jumping=false,
        falling=false,
        sliding=false,
        landed=false,
        update=player_update,
        animate=player_animate
    }
    for k,v in pairs(params) do
        p[k]=v
    end
    return add(players, p)
end 

function player_update(self)
    --physics
    self.dy+=gravity
    self.dx*=friction

    --controls
    if btn(⬅️) then
        self.dx-=self.acc
        self.running=true
        self.flip=true
    end
    if btn(➡️) then
        self.dx+=self.acc
        self.running=true
        self.flip=false
    end

    --slide
    if self.running
    and not btn(⬅️)
    and not btn(➡️)
    and not self.falling
    and not self.jumping then
        self.running = false
        self.sliding = true
    end

    --jump
    if btnp(❎) and self.landed then
        self.dy-=self.boost
        self.landed=false
        particle_t = 0
    end

    --check collision vertical
    if self.dy>0 then
        self.falling = true
        self.landed = false
        self.jumping = false
        if collide_map(self,"d",0) then
            particle_t += 1
            make_particle({x = self.x+8, y = self.y+16})
            self.landed = true
            self.falling = false
            self.dy = 0
            self.y -= ((self.y+self.h+1)%8)-1
        end
    elseif self.dy<0 then
        self.jumping = true
        if collide_map(self,"u",1) then
            self.dy = 0
        end
    end

    --check collision horiz
    if self.dx<0 then
        if collide_map(self,"l",1) then
            self.dx = 0
        end
    elseif self.dx>0 then
        if collide_map(self,"r",1) then
            self.dx = 0
        end
    end

    --stop sliding
    if self.sliding then
        if abs(self.dx) < .2
        or self.running then
            self.dx=0
            self.sliding=false
        end
    end

    self.x += self.dx
    self.y += self.dy
end

function player_animate(self)
    if self.jumping then
        self.sp = 13
    elseif self.falling then
        self.sp = 3
    elseif self.sliding then
        self.sp = 11
    elseif self.running then
        if time()-self.anim>.1 then
            self.anim = time()
            self.sp += 2
            if self.sp > 11 then
                self.sp = 5
            end
        end
    else -- idle
        if time()-self.anim>.3 then
            self.anim = time()
            self.sp += 2
            if self.sp > 3 then
                self.sp = 1
            end
        end 
    end
end