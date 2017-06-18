function love.load ()
    love.mouse.setVisible(false)
    img_mouse = love.graphics.newImage("mouse.png")
    img_bomba = love.graphics.newImage("bomba.png")
    background = love.graphics.newImage("backg.png")
    background2 = love.graphics.newImage("backg2.png")
    img_alien = love.graphics.newImage("Alien.png")
    love.graphics.setFont(love.graphics.newFont(30))
    armas = {}
    alien = {}
    a = 0
    b = 0
    posicaotexto = {150,250}
    ponto = 0
    tutorial = 1
    perdeu = 'NAO'
    dific = 200
end

function newAlien()
	local xa = math.random(15,785)
	local ya = 1
	return {x = xa,y = ya, move = function(o,vx,vy)
				o.x = o.x + vx
				o.y = o.y + vy
			       end, tp = 1, co = coroutine.create(aliencoroutine), a = 0,b = 0}	
end


function love.mousepressed( x, y, button, istouch )
    tutorial = 0
    if button == 1 then
    	if perdeu == 'NAO' then
        	for index = #armas,1,-1 do 
	    		if (x < (armas[index].x + 17) and x > (armas[index].x - 10) and y < (armas[index].y + 55) and y > (armas[index].y - 13))  then
	   			table.remove(armas,index)
				ponto = ponto + 10
			end  
   		end
        	for index = #alien,1,-1 do 
	    		if (x < (alien[index].x + 37) and x > (alien[index].x - 10) and y < (alien[index].y + 45) and y > (alien[index].y - 13))  then
	   			table.remove(alien,index)
				ponto = ponto + 20
			end  
   		end
	end
	if perdeu == 'SIM' then
		    perdeu = 'NAO'
		    armas = {}
		    alien = {}
		    a = 0
		    b = 0
		    ponto = 0
		    dific = 150
	end
    end
end


function love.keypressed (key)
    if key == "tab" then
       local state = not love.mouse.isGrabbed()   
       love.mouse.setGrabbed(state)
    end
end

function aliencoroutine()
	while true do
		coroutine.yield(0,3)
		coroutine.yield(math.random(1,3)*-1,0)
		coroutine.yield(0,math.random(1,3)*-1)
		coroutine.yield(math.random(1,3),0)
	end
end

function love.update(dt)
  a = a + 1
  if (a == dific) then
	b = b + 1
	table.insert(armas,{x = math.random(13,787), y = 0})
    	a = 0
	if (b > 5) then
		table.insert(alien, newAlien())
		b = 0
	end
    	if (dific > 40) then
		dific = dific - 5
    	end
  end
  for index,v in ipairs(armas) do 
	  v.y = v.y + 1
	  if v.y>540 then
	      perdeu = 'SIM' 
	  end
  end
  for index,v in ipairs(alien) do 
	  if v.tp == 1 then
		_,v.a,v.b = coroutine.resume(v.co)
	  elseif v.tp == 101 then
		_,v.a,v.b = coroutine.resume(v.co)
	  elseif v.tp == 201 then
		_,v.a,v.b = coroutine.resume(v.co)
	  elseif v.tp == 301 then
		_,v.a,v.b = coroutine.resume(v.co)
	  elseif v.tp == 401 then
		v.tp = 0	
	  end
	  v:move(v.a,v.b)
	  v.tp = v.tp + 1
	  if v.x<0 then
	      v.x = 785 
	  end
	  if v.x>800 then
	      v.x = 15 
	  end
	  if v.y>540 then
	      perdeu = 'SIM' 
	  end
  end
end

function love.draw () 
  if perdeu == 'NAO' then
	  love.graphics.draw(background, 0,0)
   	  if tutorial == 1 then
		    love.graphics.print("Clique nas bombas para destrui-las",120,150)
   	  end
   	  local x, y = love.mouse.getPosition() 
   	  for index,v in ipairs(armas) do 
		    love.graphics.draw(img_bomba, v.x, v.y)  
   	  end
   	  for index,v in ipairs(alien) do 
		    love.graphics.draw(img_alien, v.x, v.y)  
   	  end
  	  love.graphics.draw(img_mouse,x,y) 
   	  love.graphics.print("Score:  "..ponto,0,0)
  elseif perdeu == 'SIM' then
	  love.graphics.draw(background2, 0,0)
  	  local x, y = love.mouse.getPosition() 
  	  love.graphics.draw(img_mouse,x,y) 
	  love.graphics.print("Voce perdeu!",300,150)
	  love.graphics.print("Aperte o mouse para tentar de novo",posicaotexto[1],posicaotexto[2])
  end
end