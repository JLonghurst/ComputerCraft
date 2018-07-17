local old={}
turtle.x=0
turtle.y=0
turtle.z=0
turtle.facing="north"

if turtle.onEachMove==nil then
	local function onEachMove()
		return true
	end
	turtle.onEachMove=onEachMove
end

local function directionToNumber(direction)
	if direction == "north" then
		return 0
	elseif direction == "east" then
		return 1
	elseif direction == "south" then
		return 2
	elseif direction == "west" then
		return 3
	end
end

local function turnTo(direction)
	if ( directionToNumber(turtle.facing ) - 1) % 4 == directionToNumber(direction) then
		while turtle.facing ~= direction do
			turtle.turnLeft()
		end
	else
		while turtle.facing ~= direction do
			turtle.turnRight()
		end
	end
	return true
end
turtle.turnTo = turnTo

local function goto(x,y,z)
	local success = true
	local oldDirection = turtle.facing

	while turtle.z < z do --go z+
		success = success and turtle.up() 
		if not success then return false end
	end
	while turtle.z > z do --go z-
		success = success and turtle.down()
		if not success then return false end
	end

	if turtle.x < x then --go x+
		turtle.turnTo("north")
		while turtle.x < x do
			success = success and turtle.forward()
			if not success then return false end
		end
	end
	if turtle.x > x then --go x-
		turtle.turnTo("north")
		while turtle.x > x do
			success = success and turtle.back()
			if not success then return false end
		end
	end

	if turtle.y < y then --go y+
		turtle.turnTo("east")
		while turtle.y < y do
			success = success and turtle.forward()
			if not success then return false end
		end
	end
	if turtle.y > y then --go y-
		turtle.turnTo("east")
		while turtle.y > y do
			success = success and turtle.back()
			if not success then return false end
		end
	end

	turtle.turnTo(oldDirection)
	return success
end
turtle.goto = goto

old.turtleUp=turtle.up
local function up()
	if old.turtleUp() then
		turtle.z = turtle.z+1
		turtle.onEachMove()
		return true
	else
		return false
	end
end
turtle.up=up

old.turtleDown=turtle.down
local function down()
	if old.turtleDown() then
		turtle.z=turtle.z-1
		turtle.onEachMove()
		return true
	else
		return false
	end
end
turtle.down=down

old.turtleForward=turtle.forward
local function forward()
	if old.turtleForward() then
		if turtle.facing == "north" then
			turtle.x=turtle.x+1
		elseif turtle.facing == "south" then
			turtle.x=turtle.x-1
		elseif turtle.facing == "east" then
			turtle.y=turtle.y+1
		elseif turtle.facing == "west" then
			turtle.y=turtle.y-1
		end
		turtle.onEachMove()
		return true
	else
		return false
	end
end
turtle.forward = forward

old.turtleBack=turtle.back
local function back()
	if old.turtleBack() then
		if turtle.facing == "north" then
			turtle.x=turtle.x-1
		elseif turtle.facing == "south" then
			turtle.x=turtle.x+1
		elseif turtle.facing == "east" then
			turtle.y=turtle.y-1
		elseif turtle.facing == "west" then
			turtle.y=turtle.y+1
		end
		turtle.onEachMove()
		return true
	else
		return false
	end
end
turtle.back = back

old.turtleTurnLeft=turtle.turnLeft
local function turnLeft()
	if old.turtleTurnLeft() then
		if turtle.facing == "north" then
			turtle.facing = "west"
		elseif turtle.facing == "west" then
			turtle.facing = "south"
		elseif turtle.facing == "south" then
			turtle.facing = "east"
		elseif turtle.facing == "east" then
			turtle.facing = "north"
		end
		turtle.onEachMove()
		return true
	else
		return false
	end
end
turtle.turnLeft = turnLeft

old.turtleTurnRight=turtle.turnRight
local function turnRight()
	if old.turtleTurnRight() then
		if turtle.facing == "north" then
			turtle.facing = "east"
		elseif turtle.facing == "east" then
			turtle.facing = "south"
		elseif turtle.facing == "south" then
			turtle.facing = "west"
		elseif turtle.facing == "west" then
			turtle.facing = "north"
		end
		turtle.onEachMove()
		return true
	else
		return false
	end
end
turtle.turnRight = turnRight