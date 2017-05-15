function love.load ()
    love.mouse.setVisible(false)
    img_mouse = love.graphics.newImage("mouse.png")
    img_bomba = love.graphics.newImage("bomba.png")
    background = love.graphics.newImage("backg.png")
    background2 = love.graphics.newImage("backg2.png")
    love.graphics.setFont(love.graphics.newFont(30))
    armas = {}
    a = 0
    ponto = 0
    tutorial = 1
    perdeu = 0
    dific = 150
end

function love.mousepressed( x, y, button, istouch )
    tutorial = 0
    if button == 1 then
	    if perdeu == 0 then
        	for index,v in ipairs(armas) do 
	    		if (x < (v.x + 17) and x > (v.x - 10) and y < (v.y + 55) and y > (v.y - 13))  then
	   			table.remove(armas,index)
				ponto = ponto + 10
			end  
   		end
   	    end
	    if perdeu == 1 then
		perdeu = 0
		armas = {}
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

function love.update(dt)
    a = a + 1
    if (a == dific) then
    	table.insert(armas,{x = math.random(13,787), y = 0})
	a = 0
	if (dific > 40) then
		dific = dific - 5
	end
    end
    for index,v in ipairs(armas) do 
	v.y = v.y + 1
	if v.y>540 then
	    perdeu = 1
	end
    end
end

function love.draw () 
   if perdeu == 0 then
	love.graphics.draw(background, 0,0)
   	if tutorial == 1 then
		love.graphics.print("Clique nas bombas para destrui-las",120,150)
   	end
   	local x, y = love.mouse.getPosition() 
   	for index,v in ipairs(armas) do 
		love.graphics.draw(img_bomba, v.x, v.y)  
   	end
  	love.graphics.draw(img_mouse,x,y) 
   	love.graphics.print("Score:  "..ponto,0,0)
    elseif perdeu == 1 then
	love.graphics.draw(background2, 0,0)
  	local x, y = love.mouse.getPosition() 
  	love.graphics.draw(img_mouse,x,y) 
	love.graphics.print("Voce perdeu!",300,150)
	love.graphics.print("Aperte o mouse para tentar de novo",150,250)
    end
end