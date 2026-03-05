function love.load()
	x = 100
	y = 200
	jumpHeight = 100
	jumpSpeed = 5
	delta = 0
end

function love.draw()
	love.graphics.rectangle("line", x, y, 30, 30)
end

function love.update(dt)
	y = y + 100 * dt
	delta = dt
end

function love.keypressed(key)
	if key == "space" then
		y = lerp(y, jumpHeight, jumpSpeed * delta)
	end
end

function lerp(start_point, end_point, lerp_coefficient)
	return start_point - end_point * lerp_coefficient
end
