function p_move()
    if btnp(0) then
        px-=1
    end
    if btnp(1) then
        px+=1
    end
    if btnp(2) then
        py-=1
    end
    if btnp(3) then
        py+=1
    end
end


function pmove()
    if psteps==0 then
        --0 1 2 3
        --⬅️ ➡️ ⬆️ ⬇️
        for b=0, 3 do
            if btn(b) then
                pdir=b
                psteps=16
                idle=lidle[b+1]
            else
                pstate=idle
            end
        end
    end
    walk()
end


function walk()
    if psteps>0 and t%1==0 then
        if pdir==⬅️ then
            pflip=true
            px-=1
            pstate="walk_s"
        elseif pdir==➡️ then
            pflip=false
            px+=1
            pstate="walk_s"
        elseif pdir==⬆️ then
            py-=1
            pstate="walk_u"
        elseif pdir==⬇️ then
            py+=1
            pstate="walk_d"
        end

        psteps-=1
    end	
end


function ani()
    if pstate=="idle_d" then
        anit={1,3,1}
    elseif pstate=="idle_u" then
        anit={9,11,9}
    elseif pstate=="idle_s" then
        anit={34,36,34}
    elseif pstate=="walk_d" then
        anit={5,7,5}
    elseif pstate=="walk_u" then
        anit={13,32,13}
    elseif pstate=="walk_s" then
        anit={38,40,38}
    end

    spr(anit[pp],px*16,py*16,2,2,pflip)
    if t%20==0 then
        pp+=1
    end
        
    if pp>=#anit then
        pp=1
    end

    d_hitbox(px*16, py*16, px*16+tsize, py*16+tsize)
end
