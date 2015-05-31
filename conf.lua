function love.conf(t)
	t.title = "Platformer"
	t.author = "joey@unconscious.com"
	--t.window.width = 800
	--t.window.height = 650
	
	--t.screen.fullscreen = false
	--t.screen.vsync = true
	--t.screen.fsaa = 0
	
	t.modules.joystick = false
	t.modules.audio = true
	t.modules.keyboard = true
	t.modules.event = true
	t.modules.image = true
	t.modules.graphics = true
	t.modules.timer = true
	t.modules.mouse = true
	t.modules.sound = true
	t.modules.thread = true
	t.modules.physics = false
	--t.console = (defined in shortcut)
end