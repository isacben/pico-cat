function _init()
    t=0
    _upd=update_game
    _drw=draw_game
    start_game()
    tsize=16 --tile size

    pflip=false
    idle="idle_f" --type of idel animations
    pstate=idle --player animation state
    lidle={"idle_s", "idle_s","idle_u","idle_d"}
    anit={1,3,1} --player animation table

    debug=false
    d_toogle()
end


function d_toogle()
    menuitem(1, debug and "debug on" or "debug off", function()
        debug = not debug
        d_toogle()
        return true 
    end)
end


function _update60()
    t+=1
    _upd()
end


function _draw()
    _drw()
end


function start_game()
    px=1 --player position
    py=1
    pox=0 --offset for walk animation
    poy=0 
end


function update_game()
    p_move()
end


function update_pturn()
    if pox>0 then
        pox-=1
    end
    if pox<0 then
        pox+=1
    end
    if poy>0 then
        poy-=1
    end
    if poy<0 then
        poy+=1
    end

    if pox==0 and poy==0 then
        _upd=update_game
    end
end

function update_gameover()
end


function draw_game()
    cls(2)
    map()
    p_ani()
    print(debug,4,120,7)
end


function draw_gameover()
end
