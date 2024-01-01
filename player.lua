function p_move()
    anit=idle

    for i=0,3 do
        if btn(i) then
            px+=dirx[i+1] --dirx={-1,1,0,0}
            py+=diry[i+1] --diry={0,0,-1,1}
            pox=-dirx[i+1]*16
            poy=-diry[i+1]*16
            idle=last_idle[i+1]
            anit=walk_ani[i+1]
            pflip=(dirx[i+1] == -1) and true or false

            _upd=update_pturn
        end
    end
end


function get_frame(ani)
    return ani[flr(t/15)%#ani+1]
end


function p_ani()
    spr(get_frame(anit),px*16+pox,py*16+poy,2,2,pflip)
    d_hitbox(px*16+pox, py*16+poy, px*16+tsize+pox, py*16+tsize+poy)
end
