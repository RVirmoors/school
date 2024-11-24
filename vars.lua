-- variables
function _init()
    debug = ""
    debug_timer = 0

    pl = {
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
        landed=false
    }

    gravity = 0.4
    friction = 0.85
end