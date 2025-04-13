function make_enemy(params)
    -- constructor
    local e = {
        sp=33,
        x=49,
        y=59,
        w=8,
        h=8,
        flip_x=false,
        flip_y=false,
        dx=0,
        dy=0,
        max_dx=1.5,
        max_dy=1,
        update=enemy_update
    }
    for k,v in pairs(params) do
        e[k]=v
    end
    return add(enemies, e)
end

function enemy_update(self)
    interval = ceil(rnd(4))
    if (t()*10) % interval == 0 then
        self.dx = rnd(self.max_dx * 2) - self.max_dx
        self.dy = rnd(self.max_dy * 2) - self.max_dy
    end
    self.x += self.dx
    self.y += self.dy
    -- check collision vertical
    if self.dy > 0 then
        if collide_map(self, "d", 0) then
            self.dy = -0.1
        end
    end
    -- bounce
    if self.x < 0 or self.x > 120 then
        self.dx = -self.dx
    end
    if self.y < 0 or self.y > 120 then
        self.dy = -self.dy
    end
    -- flip
    if self.dx > 0 then
        self.flip_x = true
    else
        self.flip_x = false
    end
    if self.dy > 0 then
        self.flip_y = true
    else
        self.flip_y = false
    end
    -- clamp
    self.x = mid(0, self.x, 120)
    self.y = mid(0, self.y, 120)
end