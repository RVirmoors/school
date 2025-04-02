particle_t = 0
part_colors = {5, 6, 13}

function make_particle(params)
    local p = {
        t = 0,
        x = 64,
        y = 64,
        dx = rnd(2) - 1,
        color = part_colors[ceil(rnd(3))]
    }
    for k,v in pairs(params) do
        p[k]=v
    end
    return add(particles, p)
end

function particle_draw(p)
    printh("DRAW PARTICLE "..p.color)
    if particle_t < 12 and particle_t > 0 do
        circfill(p.x, p.y, p.t/2, p.color)
    end
end

function particle_update(p)
    p.t += 1
    p.x += p.dx
    if p.t == 8 then
        del(particles, p)
    end
end