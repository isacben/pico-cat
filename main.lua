function _init()
    t=0
    state="game"
    _upd=update_game
    _drw=draw_game
    start_game()
    tsize=16

    pflip=false
    psteps=0
    pdir=-1
    idle="idle_f"
    pstate=idle
    lidle={"idle_s", "idle_s","idle_u","idle_d"}
    anit={1,3,1}
    pp=1

    pbtn=0
    debug=true

    menuitems()
end


function menuitems()
    menuitem(1, debug and "debug on" or "debug off", function()
        debug = not debug
        menuitems()
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
    px=1
    py=1
end


function update_game()
    p_move()
end


function update_gameover()
end


function draw_game()
    cls(2)
    map()
    ani()
    print(debug,4,120,7)
end


function draw_gameover()
end
