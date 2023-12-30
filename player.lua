function p_move()
    pstate=idle

    for i=0,3 do
        if btn(i) then
            px+=dirx[i+1] --dirx={-1,1,0,0}
            py+=diry[i+1] --diry={0,0,-1,1}
            pox=-dirx[i+1]*16
            poy=-diry[i+1]*16
            _upd=update_pturn
        end
    end
    
    if btn(0) then
        pflip=true
        pstate="walk_s"
        idle="idle_s"
    end
    if btn(1) then
        pflip=false
        pstate="walk_s"
        idle="idle_s"
    end
    if btn(2) then
        pstate="walk_u"
        idle="idle_u"
    end
    if btn(3) then
        pstate="walk_d"
        idle="idle_d"
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
