-- collisions
function collide_map(obj, aim, flag)
    -- obj = table needs x,y,w,h
    -- aim = l,r,u,d
    local x=obj.x   local y=obj.y
    local w=obj.w   local h=obj.h

    local x1,x2,y1,y2=0,0,0,0

    if aim=="l" then
        x1=x-1      y1=y
        x2=x        y2=y+h-1
    elseif aim=="r" then
        x1=x+w      y1=y
        x2=x+w+1    y2=y+h-1
    elseif aim=="u" then
        x1=x+1      y1=y-1
        x2=x+w-1    y2=y
    elseif aim=="d" then
        x1=x        y1=y+h
        x2=x+w      y2=y+h
    end

    --pixels to tiles
    x1/=8   y1/=8
    x2/=8   y2/=8

    if fget(mget(x1,y1), flag)
    or fget(mget(x1,y2), flag)
    or fget(mget(x2,y1), flag)
    or fget(mget(x2,y2), flag) then
        -- particle_draw()
        return true
    else
        return false
    end
end

function collide_obj(obj1, obj2)
    -- obj1 = table needs x,y,w,h
    -- obj2 = table needs x,y,w,h
    local x1=obj1.x   local y1=obj1.y
    local w1=obj1.w   local h1=obj1.h

    local x2=obj2.x   local y2=obj2.y
    local w2=obj2.w   local h2=obj2.h

    if (x1+w1) < x2 or (x2+w2) < x1 then return false end
    if (y1+h1) < y2 or (y2+h2) < y1 then return false end

    return true
end