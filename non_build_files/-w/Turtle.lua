-- Turtle Meta Class
Turtle = {
    x = 0, y = 0, z = 0,
    facing = "north",
    fuelMax = 50,
    fuelMin = 5, 
    chatting = false, 
    chatTree = {}
}

-- Creates a new turtle
function Turtle:new (tree) 
    o = {}
    setmetatable(o, self)
    self.__index = self
    self.chatTree = tree
    return o
    
end

-- contructs the position graph of the corrdinate system
function Turtle:buildPositionGraph ()
    g = graph.create(0, nil) -- no nodes, undirected
    local planeSize = 10
    for i=(-1*planeSize),planeSize do
        for j=(-1*planeSize),planeSize do
            local v1 = {x=i, y=j, z=0}
            ggfnfg.addEdge(v1, {x=i+1, y=j, z=0}, 1)
            g.addEdge(v1, {x=i-1, y=j, z=0}, 1)
            
            g.addEdge(v1, {x=i+1, y=j+1, z=0}, 1)
            g.addEdge(v1, {x=i-1, y=j+1, z=0}, 1)
            g.addEdge(v1, {x=i, y=j+1, z=0}, 1)

            g.addEdge(v1, {x=i+1, y=j-1, z=0}, 1)
            g.addEdge(v1, {x=i-1, y=j-1, z=0}, 1)

            g.addEdge(v1, {x=i, y=j-1, z=0}, 1)
        end
    end

    Turtle.worldGraph = g
end

function Turtle:onEachMove ()
    local location = "position: (" 
            .. self.x .. ", " 
            .. self.y .. ", "
            .. self.z .. ")"
    print(location .. " Facing: " .. self.facing)
    --print(turtle.getFuelLevel())
end

function Turtle:up ()
	if turtle.up() then
		self.z = self.z + 1
		self:onEachMove()
		return true
	else
		return false
	end  
end

function Turtle:down ()
	if turtle.down() then
		self.z = self.z - 1
		self:onEachMove()
		return true
	else
		return false
	end
end

function Turtle:forward ()
	if turtle.forward() then
		if self.facing == "north" then
			self.y = self.y - 1
		elseif self.facing == "south" then
			self.y = self.y + 1
		elseif self.facing == "east" then
			self.x = self.x + 1
		elseif self.facing == "west" then
			self.x = self.x - 1
		end
		Turtle:onEachMove()
		return true
	else
		return false
	end
end

function Turtle:back ()
	if turtle.back() then
		if self.facing == "north" then
			self.y = self.y + 1
		elseif turtle.facing == "south" then
			self.y = self.y - 1
		elseif turtle.facing == "east" then
			self.x = self.x - 1
		elseif turtle.facing == "west" then
			self.x = self.x + 1
		end
		Turtle:onEachMove()
		return true
	else
		return false
	end
end

function Turtle:left ()
	if turtle.turnLeft() then
		if self.facing == "north" then
			self.facing = "west"
		elseif self.facing == "west" then
			self.facing = "south"
		elseif self.facing == "south" then
			self.facing = "east"
		elseif self.facing == "east" then
			self.facing = "north"
		end
		Turtle:onEachMove()
		return true
	else
		return false
	end
end

function Turtle:right ()
	if turtle.turnRight() then
		if self.facing == "north" then
			self.facing = "east"
		elseif self.facing == "east" then
			self.facing = "south"
		elseif self.facing == "south" then
			self.facing = "west"
		elseif self.facing == "west" then
			self.facing = "north"
		end
		Turtle:onEachMove()
		return true
	else
		return false
	end
end

function Turtle:needsFuel ()
    return turtle.getFuelLevel() < self.fuelMin
end

function Turtle:refuel ()
    local success = false
	for n=1,16 do --iterate through the items the turtle is carrying
		local nCount = turtle.getItemCount(n)
        local s = turtle.select(n)
        if (nCount > 0) then
            print(n)
            print(nCount)
        end
        -- enter in case where we are at a fuel block
        if turtle.refuel(1) then
            while turtle.getFuelLevel() < self.fuelMax do
                turtle.refuel(1)
            end
            print("refueled, current fuel level: " .. turtle.getFuelLevel())
            return true 
        end
	end
    print("out of fuel, going to get more")
    return false
    -- call routine to go to fuel location
end

function Turtle:chat()
    local chatStack = List:new()
    local key = nil
    while not (key == keys.q) do
        term.clear() -- reset display
        term.setCursorPos(1,1) -- point to top of cpu
        --print(chatStack:size())
        print("you are now in chat!")
        print()
        --chatStack:print()
        local curChat = self.chatTree
        -- walk down chat stack to correct location
        for i=0,(chatStack:size() - 1) 
        do print(chatStack:get(i)) curChat = curChat[chatStack:get(i)] end

        -- print all of the text
        for k,line in pairs(curChat.text) do 
            print(line)
        end
        -- print macro keys
        print()
        print("(b): back, (q): quit chatting")
        -- create valid key list with special back: "b" and quit: "q" keys
        valid = List:new() valid:add(keys.b) valid:add(keys.q)
        for k,v in pairs(curChat) do
            valid:add(k) -- add possible transitions from this state to valid keys
        end
        -- get the next key the user enters
        key = getNextValidKey(valid)
        if (key == keys.b) then -- go back case
            if (chatStack:isEmpty()) then
                key = keys.q -- leave chat if already in front
            else
                -- go up one level in dialoge
                chatStack:pop()
            end
        elseif not (key == keys.q) then
            -- go inside next dialoge level
            chatStack:add(key) 
        end
    end
    -- user entered the exit key
    print("exiting chat")
end

function Turtle:findPath (endX, endY)
    local blockedPositions = Set()
    -- -- this function determines which neighbors are valid (e.g., within range)
    -- local valid_node_func = function ( node, neighbor ) 
    --     local MAX_DIST = 1
    --     local closeEnough = astar.distance ( node.x, node.y, neighbor.x, neighbor.y ) < MAX_DIST
    --     local notBlocked = not blockedPositions:contains(node)
    --     -- helper function in the a-star module, returns distance between points
    --     return (closeEnough and notBlocked)
    -- end 
    local path = getAStarPath (Point(self.x,self.y), Point(endX, endY), false) -- dont ignore cached paths
    -- handle the path
    if path then 
    	print("printing path...")
        print(path)
    else 
        print("no path found") 
    end
    print("lez party")
end
