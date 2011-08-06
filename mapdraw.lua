function love.load()
	scrollSpeed = 4
	
	map_x = 0
	map_y = 0
	
    -- our tiles
	tileimg = love.graphics.newImage("images/terrain.png")
	tile = {}
	ref = 1024 -- the size of the tile image
	tref = 1024 / 16
	tile[0] = love.graphics.newQuad(64, 0, tref, tref, ref, ref)
    tile[1] = love.graphics.newQuad(128, 0, tref, tref, ref, ref)
    tile[2] = love.graphics.newQuad(128, 64, tref, tref, ref, ref)
	tile[3] = love.graphics.newQuad(0, 64, tref, tref, ref, ref)
   
    -- the map (random junk + copy and paste)
    map={
    { 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0},
    { 3, 1, 0, 0, 2, 2, 2, 0, 3, 0, 3, 0, 1, 1, 1, 0, 0, 3, 0, 0, 0},
    { 3, 1, 0, 0, 2, 0, 2, 0, 3, 0, 3, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0},
    { 3, 1, 1, 0, 2, 2, 2, 0, 0, 3, 0, 0, 1, 1, 0, 0, 0, 0, 0, 3, 0},
    { 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3},
    { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 2},
    { 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 2, 2, 2, 0, 3, 3, 3, 0, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0},
    { 0, 2, 0, 0, 0, 3, 0, 3, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 1},
    { 0, 2, 0, 0, 0, 3, 0, 3, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0},
    { 0, 2, 2, 2, 0, 3, 3, 3, 0, 1, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 0, 2, 2, 2, 0, 3, 0, 3, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 0, 2, 0, 2, 0, 3, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 1, 1, 0, 2, 2, 2, 0, 0, 3, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3},
    { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 1, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }
       
    -- map variables
    map_w = #map[1] -- Obtains the width of the first row of the map
    map_h = #map -- Obtains the height of the map
    map_x = 0
    map_y = 0
    map_display_buffer = 2 -- We have to buffer one tile before and behind our viewpoint.
                               -- Otherwise, the tiles will just pop into view, and we don't want that.
	tile_w = 64
    tile_h = 64
    map_display_w = love.graphics.getWidth() / tile_w
    map_display_h = love.graphics.getHeight() / tile_h
	
	--physics world
	world_w = map_w * tile_w
	world_h = map_h * tile_h
	world = love.physics.newWorld(0, 0, world_w, world_h)
	world:setGravity(0, 0)
	world:setMeter(64) --the height of a meter in this world will be 64px
	
	-- world objects
	objects = {}
	-- the ground for the level
	objects.ground = {}
	objects.ground.body = love.physics.newBody(world, world_w/2, world_h, 0, 0)
	objects.ground.shape = love.physics.newRectangleShape(objects.ground.body, 0, 0, world_w, 100, 0)
	
	 --initial graphics setup
	love.graphics.setBackgroundColor(104, 136, 248) --set the background color to a nice blue
	love.graphics.setMode(800, 600, false, true, 0) --set the window dimensions to 800 by 600 with no fullscreen, vsync on, and no antialiasing
	love.graphics.setColorMode("replace")
	love.graphics.setFont(18)
end
   
function draw_map()
    offset_x = map_x % tile_w
    offset_y = map_y % tile_h
    firstTile_x = math.floor(map_x / tile_w)
    firstTile_y = math.floor(map_y / tile_h)
   
    for y=1, (map_display_h + map_display_buffer) do
        for x=1, (map_display_w + map_display_buffer) do
            -- Note that this condition block allows us to go beyond the edge of the map.
            if y+firstTile_y >= 1 and y+firstTile_y <= map_h
                and x+firstTile_x >= 1 and x+firstTile_x <= map_w
            then
                love.graphics.drawq(tileimg,
                    tile[map[y+firstTile_y][x+firstTile_x]],
                    (x*tile_w) - offset_x - tile_w,
                    (y*tile_h) - offset_y - tile_h)
            end
        end
    end
end

function love.update( dt )
	world:update(dt) --this puts the world into motion

    -- get input, eventually the map will be pushed by the player as he approaches the edge of the screen
    if love.keyboard.isDown( "up" ) then
        map_y = map_y - scrollSpeed
    end
    if love.keyboard.isDown( "down" ) then
        map_y = map_y + scrollSpeed
    end
    if love.keyboard.isDown( "left" ) then
        map_x = map_x - scrollSpeed
    end
    if love.keyboard.isDown( "right" ) then
        map_x = map_x + scrollSpeed
    end
    if love.keyboard.isDown( "escape" ) then
        love.event.push( "q" )
    end

    -- check boundaries. remove this section if you don't wish to be constrained to the map.
    if map_x < 0 then
        map_x = 0
    end

    if map_y < 0 then
        map_y = 0
    end
 
    if map_x > map_w * tile_w - map_display_w * tile_w then
        map_x = map_w * tile_w - map_display_w * tile_w
    end
 
    if map_y > map_h * tile_h - map_display_h * tile_h then
        map_y = map_h * tile_h - map_display_h * tile_h
    end
	
end

function love.draw()    
	draw_map()
	
	love.graphics.translate(-map_x, -map_y)
		love.graphics.setColor(72, 160, 14) -- set the drawing color to green for the ground
	love.graphics.polygon("fill", {objects.ground.shape:getPoints()})  -- draw a "filled in" polygon using the ground's coordinates
  end
  