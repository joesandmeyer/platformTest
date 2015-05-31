require "classes.maths"

require "classes.player"
require "classes.map"
HC = require 'hardoncollider'

function love.load()
	love.graphics.setBackgroundColor(200,200,200)
	love.graphics.setColor(255,255,255)
	love.graphics.setNewFont(12)
	
    sound = love.audio.newSource("bloop01.wav", "static")
	music = love.audio.newSource("free3.mp3")
	
	groundLevel = 400
	gravity = 500
	
	map_image = love.image.newImageData("maps/test.png")
	Collider = HC(100, on_collision, collision_stop)
	
	
	--loading classes
	player.load()
	map.load()
	
end

function love.update(dt)
	UPDATE_PLAYER(dt)
	UPDATE_MAP(dt)
	
	Collider:update(dt)
end

function love.draw()
	love.graphics.rectangle("fill", 0, groundLevel, 800, 400)

	DRAW_PLAYER()
	DRAW_MAP()
end

function love.quit()
  print("TERMINATING")
end