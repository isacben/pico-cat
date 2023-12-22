function _init()
	t=0
	state="game"
	tsize=16
	
	px=16
	py=16*4
	pflip=false
	psteps=0
	pdir=-1
	idle="idle_f"
	pstate=idle
	lidle={"idle_s", "idle_s","idle_u","idle_d"}
	anit={1,3,1}
	pp=1
	
	pbtn=0
	debug=""
end


function _update60()
	update()
end


function _draw()
	draw()
end


function update()
	if state=="game" then
		t+=1
		pmove()
	end
end


function draw()
	if state=="game" then
		cls(0)
		map()
		ani()
		print(debug,10,10,0)
	end
end
