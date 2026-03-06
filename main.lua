function love.load()
	-- Load tick
	tick = require("tick")

	-- Player object
	player = {}
	player.x = 400
	player.y = 500
	player.moveSpeed = 200
	player.width = 60
	player.height = 20
	player.drawShape = true

	-- Fruit object
	fruit = {}
	fruit.fruit_type = { "apple", "banana", "orange" }
	fruit.fruitFallSpeed = 200
	fruit.x = 400
	fruit.y = 300
	fruit.width = 20
	fruit.height = 20
	fruit.drawShape = true

	fruitCollection = {}
	fruitCollection.insert("apple")
end

function love.draw()
	-- Draw player object
	player.graphics = love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

	-- Draw fruit object IF it isn't colliding with anything
	if fruit.drawShape then
		fruit.graphics = love.graphics.circle("line", fruit.x, fruit.y, fruit.width)
	end
end

function love.update(dt)
	-- Updating tick
	tick.update(dt)

	-- Player movement
	if love.keyboard.isDown("right") then
		player.x = player.x + player.moveSpeed * dt
	elseif love.keyboard.isDown("left") then
		player.x = player.x - player.moveSpeed * dt
	end

	-- Fruit falling
	fruit.y = fruit.y + fruit.fruitFallSpeed * dt

	-- Collision checking for fruit
	for i, v in ipairs(fruitCollection) do
		checkCollision(player.x, player.y, player.width, player.height, player.drawShape, fruitCollection[i].x, fruitCollection[i].y, fruitCollection[i].width, fruitCollection[i].height, fruitCollection[i].drawShape)
end

function checkCollision(obj1_x, obj1_y, obj1_w, obj1_h, obj1_d, obj2_x, obj2_y, obj2_w, obj2_h, obj2_d)
	if
		obj1_x < obj2_x + obj2_w
		and obj2_x < obj1_x + obj1_w
		and obj1_y < obj2_y + obj2_h
		and obj2_y < obj1_y + obj1_h
	then
		obj2_d.drawShape = false
		return true
	end
end
