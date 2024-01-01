function _init()
    t=0
    _upd=update_game
    _drw=draw_game
    start_game()
    tsize=16 --tile size

    dirx={-1,1,0,0} --movement on x axis
    diry={0,0,-1,1} --movement on y axis
    pflip=false
    last_idle={
        {34,36}, --idle left
        {34,36}, --idle right
        {9,11}, --idle up
        {1,3} --idle down
    }
    idle=last_idle[4] --type of idel animations
    walk_ani={
        {38,40}, --walk left
        {38,40}, --walk right 
        {13,32}, --walk up
        {5,7} --walk down
    }
    anit={} --player animation table
    
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
