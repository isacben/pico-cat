function p_move()
    pstate=idle
    if btn(0) then
        pflip=true
        px-=1
        pox=16
        pstate="walk_s"
        idle="idle_s"
        _upd=update_pturn
    end
    if btn(1) then
        pflip=false
        pox=-16
        px+=1
        pstate="walk_s"
        idle="idle_s"
        _upd=update_pturn
    end
    if btn(2) then
        poy=16
        py-=1
        pstate="walk_u"
        idle="idle_u"
        _upd=update_pturn
    end
    if btn(3) then
        poy=-16
        py+=1
        pstate="walk_d"
        idle="idle_d"
        _upd=update_pturn
    end
end


function get_frame(ani)
    return ani[flr(t/15)%#ani+1]
end


function p_ani()
    if pstate=="idle_d" then
        anit={1,3}
    elseif pstate=="idle_u" then
        anit={9,11}
    elseif pstate=="idle_s" then
        anit={34,36}
    elseif pstate=="walk_d" then
        anit={5,7}
    elseif pstate=="walk_u" then
        anit={13,32}
    elseif pstate=="walk_s" then
        anit={38,40}
    end

    spr(get_frame(anit),px*16+pox,py*16+poy,2,2,pflip)

    d_hitbox(px*16+pox, py*16+poy, px*16+tsize+pox, py*16+tsize+poy)
end
