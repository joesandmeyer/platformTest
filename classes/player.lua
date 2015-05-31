player = {}

function player.load()
	player.x = 5
	player.y = 5
	player.size = 10
	player.mass = 10
	player.xvel = 0
	player.yvel = 0
	player.friction = 7
	player.speed = 2250
	player.power = 1000
	
	
	leftkey = 0
	rightkey = 0
	upkey = 0
	downkey = 0
	player.xdir = 0
	player.ydir = 0
	
	player.jumpsound = love.audio.newSource("bloop01.wav", "static")
end

function player.keys()
	if love.keyboard.isDown("left") then leftkey = -1
	else leftkey = 0
	end
	if love.keyboard.isDown("right") then rightkey = 1
	else rightkey = 0
	end
	dir = leftkey+rightkey
	if love.keyboard.isDown("up") then upkey = -1
	else upkey = 0
	end
	if love.keyboard.isDown("down") then downkey = 1
	else downkey = 0
	end
end

function player.draw()
	love.graphics.rectangle("line", player.x, player.y, player.size, player.size)
end

function player.physics(dt)
--y
	if player.yvel ~= 0 then -- we're either jumping or falling
		player.y = player.y + player.yvel *dt
		player.yvel = player.yvel * (1 - math.min(dt*player.friction, 1))
		
		--vertical collision
	
--x
	player.x = player.x + player.xvel *dt
	player.xvel = player.xvel * (1 - math.min(dt*player.friction, 1))
	
	--horizontal collision

end

function player.move(dt)
	
	if player.xdir == -1 and player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed *dt
	end
	if player.ydir == 1 and player.xvel < player.speed then
		player.xvel = player.xvel + player.speed *dt
	end

end


function player.halt() --horizontal freeze
	player.xvel = 0
end


function UPDATE_PLAYER(dt)
	player.keys()
	player.physics(dt)
	player.move(dt)
end
function DRAW_PLAYER()
	player.draw()
end