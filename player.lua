function p_move()
    anit=idle

    local buttons_count=0 --don't allow diagonal movement
    for i=0,3 do
        if btnp(i) then
            buttons_count+=1
            
            if buttons_count>1 then return end

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
