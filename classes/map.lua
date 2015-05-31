map = {}

function map.load()
	map.tile = {}
	for i=1,2 do -- i = 1,#tiles
		map.tile[i] = love.graphics.newImage( "tiles/tile"..i..".png" )
	end

	map.width = map_image:getWidth()
	map.height = map_image:getHeight()
	--map.display_w = 14
	--map.display_h = 10
	map.tileSize = 16

	map.set()
end

function map.collision(dt)
end


function map.entities(y,x)
	r,g,b,a = map_image:getPixel(x,y) --a could determine z layer?
	if r==255 and b ==255 and g==255 then return 0
	elseif b==0 then 
	end
end

function map.tiles(y,x)
	r,g,b,a = map_image:getPixel(x,y)
	if r==255 then return 0 --not tile
	else return r/10
	end
end

function map.set()
	for y=0, map.height-1 do
      for x=0, map.width-1 do
		if map.tiles(y,x) ~= 0 then
			map.entities(y,x)
		end
      end
   end
end

function map.drawTiles()
   for y=0, map.height-1 do
      for x=0, map.width-1 do
		if map.tiles(y,x) ~= 0 then
			love.graphics.draw( 
              map.tile[map.tiles(y,x)],
			  (x*map.tileSize),
			  (y*map.tileSize))
		end
      end
   end
end


	--r,g,b,a = map:getPixel(0,0)


function UPDATE_MAP(dt)
	map.collision(dt)
end
function DRAW_MAP()
	map.drawTiles()
end
