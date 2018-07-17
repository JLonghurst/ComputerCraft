--parameter testing and initialization

local targs = {...}
if #targs ~= 2 then
	print("floor <length> <width>")
	error()
end

local length = tonumber(targs[1])
local width = tonumber(targs[2])


setmetatable(a, {__index = b})


turtle.refuel();

local function layfloor() 
	turtle.select(2)
	local j = 1
	while true do
		turtle.digDown()
		turtle.placeDown()
		if j==length then
			break
		else
			turtle.forward()
			j=j+1
		end
	end
end

local function repositionRight() 
	turtle.turnRight()
	turtle.forward()
	turtle.turnRight()
end

local function repositionLeft()
	turtle.turnLeft()
	turtle.forward()
	turtle.turnLeft()
end
	

for i=1, width do 
	layfloor()
	if (i%2) == 0 then
		repositionLeft()
	else 
		repositionRight()
	end
end