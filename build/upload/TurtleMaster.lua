-- classic map
function map(func, array)
  local new_array = {}
  for i,v in ipairs(array) do
    new_array[i] = func(v)
  end
  return new_array
end

-- filter(function, table)
-- e.g: filter(is_even, {1,2,3,4}) -> {2,4}
function filter(func, tbl)
    local newtbl= {}
    for i,v in pairs(tbl) do
        if func(v) then
        newtbl[i]=v
        end
    end
    return newtbl
end

-- returns the length of a table T
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
local List
do
  local _base_0 = {
    size = function(self)
      local temp = self.size
      return temp
    end,
    empty = function(self)
      return self.size == 0
    end,
    add = function(self, ele)
      self.items[self.size] = ele
      self.size = self.size + 1
    end,
    remove = function(self, ele)
      local index = indexOf(ele)
      if index ~= (-1) then
        return self:removeAt(index)
      end
    end,
    contains = function(self, ele)
      return indexOf(ele) ~= -1
    end,
    pop = function(self, bool)
      if bool then
        return self:removeAt(self.size - 1)
      else
        return get(self.size - 1)
      end
    end,
    set = function(self, index, value)
      self.items[index] = value
    end,
    get = function(self, index)
      local temp = self.items[index]
      return temp
    end,
    removeAt = function(self, index)
      local item = self.items[index]
      if (index == (self.size - 1)) then
        self.size = self.size - 1
        return item
      else
        for i = index + 1, self.size - 1 do
          self.items[i - 1] = self.items[i]
        end
      end
      self.size = self.size - 1
      return item
    end,
    indexOf = function(self, ele)
      for i = 0, (self.size - 1) do
        if self.items[i] == ele then
          return i
        end
      end
      return -1
    end,
    __tostring = function(self)
      local str = "["
      for i = 0, self.size - 1 do
        local item = self:get(i):str()
        str = str .. (i .. ":" .. item .. " ")
        if (i + 1) % 4 == 0 then
          str = str .. "\n"
        end
      end
      return str .. "]"
    end,
    str = function(self)
      return self:__tostring()
    end,
    __equals = function(self, other)
      return (self.x == other.x) and (self.y == other.y)
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, table)
      self.items = { }
      self.size = 0
      if table then
        for _, v in pairs(table) do
          self:add(v)
        end
      end
    end,
    __base = _base_0,
    __name = "List"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  List = _class_0
end
local LIST_WORKS = List()
local Point
do
  local _base_0 = {
    __tostring = function(self)
      return "(" .. self.x .. ", " .. self.y .. ")"
    end,
    str = function(self)
      return self:__tostring()
    end,
    __equals = function(self, other)
      return (self.x == other.x) and (self.y == other.y)
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x, self.y = x, y
    end,
    __base = _base_0,
    __name = "Point"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Point = _class_0
end
local POINT_WORKS = Point()
local Set
do
  local _base_0 = {
    size = function(self)
      local temp = self.size
      return temp
    end,
    empty = function(self)
      return self.size == 0
    end,
    add = function(self, ele)
      if not self.boolMap[ele] then
        self.boolMap[ele] = true
        self.size = self.size + 1
      end
    end,
    remove = function(self, ele)
      if self.boolMap[ele] then
        self.size = self.size - 1
        self.boolMap[ele] = false
      end
    end,
    contains = function(self, ele)
      if self.boolMap[ele] then
        return true
      else
        return false
      end
    end,
    __tostring = function(self)
      local str = "{"
      for k, _ in pairs(self.boolMap) do
        str = str .. k:tostring()
      end
      return str .. "}"
    end,
    str = function(self)
      return self.__tostring
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self)
      self.boolMap = { }
      self.size = 0
    end,
    __base = _base_0,
    __name = "Set"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Set = _class_0
end
local LIST_WORKS = Set()
local Vector
do
  local _base_0 = {
    __add = function(self, other)
      return Vector(other.x + self.x, other.y + self.y)
    end,
    __sub = function(self, other)
      return Vector(self.x - other.x, self.y - other.y)
    end,
    __mul = function(self, scalar)
      return Vector(self.x * scalar, self.y * scalar)
    end,
    __div = function(self, scalar)
      return Vector(self.x / scalar, self.y / scalar)
    end,
    __eq = function(self, other)
      return (self.x == other.x) and (self.y == other.y)
    end,
    length = function(self)
      return math.sqrt(self.x * self.x + self.y * self.y)
    end,
    rotate = function(self, str)
      if str == "90" then
        return Vector(-self.y, self.x)
      else
        if str == "180" then
          return Vector(-self.x, -self.y)
        else
          if str == "270" then
            return Vector(self.y, -self.x)
          else
            return print("invalid rotation string")
          end
        end
      end
    end,
    dot = function(self, other)
      return self.x * other.x + self.y * other.y
    end,
    length_sqr = function(self)
      return self.x * self.x + self.y * self.y
    end,
    normalized = function(self)
      return Vector(self.x / self.length, self.y / self.length)
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x = x
      self.y = y
    end,
    __base = _base_0,
    __name = "Vector"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Vector = _class_0
end
local VECTOR_WORDS = Vector()
local Turtle
do
  local _base_0 = {
    setPosAndFacing = function(self)
      local oldx, oldz, oldy = gps.locate(5, false)
      turtle.refuel()
      while (not turtle.forward()) do
        turtle.turnLeft()
      end
      local x, z, y = gps.locate(5, false)
      print("old: " .. oldx .. " " .. oldy .. " " .. oldz)
      print("new: " .. x .. " " .. y .. " " .. z)
      self.x = x
      self.y = y
      self.z = z
      self.dx = x - oldx
      self.dy = y - oldy
      print(self:facingString())
      print(self:posString())
    end,
    facingString = function(self)
      return "(" .. self.dx .. ", " .. self.dy .. ")"
    end,
    posString = function(self)
      return "(" .. self.x .. ", " .. self.y .. ", " .. self.z .. ")"
    end,
    onEachMove = function(self)
      os:sleep(.5)
      return print(location .. " Facing: " .. "(" .. self.dx .. ", " .. self.dy .. ")")
    end,
    moveTo = function(self, p)
      local dx = p.x - self.x
      local dy = p.y - self.y
      self:alignFacing(dx, dy)
      return self:forward()
    end,
    down = function(self)
      if turtle.down() then
        self.z = self.z - 1
        self:onEachMove()
        return true
      else
        return false
      end
    end,
    forward = function(self)
      if turtle.forward() then
        self.x = self.x + self.dx
        self.y = self.y + self.dy
        self:onEachMove()
        return true
      else
        return false
      end
    end,
    back = function(self)
      if turtle.back() then
        self.x = self.x - self.dx
        self.y = self.y - self.dy
        self:onEachMove()
        return true
      else
        return false
      end
    end,
    left = function(self)
      if turtle.turnLeft() then
        self.dx, self.dy = -self.dy, self.dx
        self:onEachMove()
        return true
      else
        return false
      end
    end,
    right = function(self)
      if turtle.turnRight() then
        self.dx, self.dy = self.dy, -self.dx
        self:onEachMove()
        return true
      else
        return false
      end
    end,
    alignFacing = function(self, newDx, newDy)
      local old = Vector(self.dx, self.dy)
      local new = Vector(newDx, newDy)
      assert(old:length() == 1)
      assert(new:length() == 1)
      if (old:rotate("90") == new) then
        return self:left()
      else
        if (old:rotate("270") == new) then
          return self:right()
        else
          if (old:rotate("180") == new) then
            self:right()
            return self:right()
          else
            return 0
          end
        end
      end
    end,
    findPath = function(self, x, y)
      local start = Point(self.x, self.y)
      local goal = Point(x, y)
      local path = getAStarPath(start, goal)
      if not path then
        return print("no path found")
      else
        return path
      end
    end,
    magnitude = function(self, x, y)
      return math.sqrt(math.pow(x, 2) + math.pow(y, 2))
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, tree)
      self:setPosAndFacing()
      self.fuelMin = 5
      self.fuelMax = 50
      self.chatting = false
      self.chatTree = tree
    end,
    __base = _base_0,
    __name = "Turtle"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Turtle = _class_0
end
local TURTLE_WORKS = 0
local floor = math.floor
local PriorityQueue = {}
PriorityQueue.__index = PriorityQueue

-- Creates a new empty list
function PriorityQueue:new() 
    o = {} or o
    setmetatable(o, self)
    self.__index = self
    self.heap = {}
    self.current_size = 0
    return o
end

function PriorityQueue:isEmpty()
    return self.current_size == 0
end

function PriorityQueue:size()
    return self.current_size
end

function PriorityQueue:swim()
    -- Swim up on the tree and fix the order heap property.
    local heap = self.heap
    local floor = floor
    local i = self.current_size

    while floor(i / 2) > 0 do
        local half = floor(i / 2)
        if heap[i][2] < heap[half][2] then
            heap[i], heap[half] = heap[half], heap[i]
        end
        i = half
    end
end

function PriorityQueue:put(v, p)
    --[[ Put an item on the queue.
    Args:
        v: the item to be stored
        p(number): the priority of the item
    ]]--
    --

    self.heap[self.current_size + 1] = {v, p}
    self.current_size = self.current_size + 1
    self:swim()
end

function PriorityQueue:sink()
    -- Sink down on the tree and fix the order heap property.
    local size = self.current_size
    local heap = self.heap
    local i = 1

    while (i * 2) <= size do
        local mc = self:min_child(i)
        if heap[i][2] > heap[mc][2] then
            heap[i], heap[mc] = heap[mc], heap[i]
        end
        i = mc
    end
end

function PriorityQueue:min_child(i)
    if (i * 2) + 1 > self.current_size then
        return i * 2
    else
        if self.heap[i * 2][2] < self.heap[i * 2 + 1][2] then
            return i * 2
        else
            return i * 2 + 1
        end
    end
end

function PriorityQueue:getFront()
    -- Remove and return the top priority item
    local heap = self.heap
    local retval = heap[1][1]
    heap[1] = heap[self.current_size]
    heap[self.current_size] = nil
    self.current_size = self.current_size - 1
    self:sink()
    return retval
end
----------------------------------------------------------------
-- local variables
----------------------------------------------------------------

local INF = 1/0
local cachedPaths = nil


----------------------------------------------------------------
-- local functions
----------------------------------------------------------------

function manDist ( x1, y1, x2, y2 )
	return  math.abs(x1 - x2) + math.abs(y1 - y2)
end

function manhattanDistance ( nodeA, nodeB )
	return manDist ( nodeA.x, nodeA.y, nodeB.x, nodeB.y )
end

function is_valid_node( node, neighbor ) 
	local MAX_DIST = 1
	local closeEnough = dist ( node.x, node.y, neighbor.x, neighbor.y ) < MAX_DIST
	--local notBlocked = not blockedPositions:contains(node)
	-- helper function in the a-star module, returns distance between points
	return (closeEnough)
end

function neighbor_nodes (node)
	return {
		Point(node.x, node.y + 1),
		Point(node.x, node.y - 1),
		Point(node.x + 1, node.y),
		Point(node.x - 1, node.y)
	}
end

function unwind_path(cameFrom, current)
	local curNode = current
	flatPath = List() 
    flatPath:add(curNode)
	while cameFrom[curNode:str()] do
		curNode = cameFrom[curNode:str()]
		flatPath:add(curNode)
	end
	-- reverse the list:
	reverse = List()
	while not flatPath:empty() do 
        next = flatPath:pop(true)
        reverse:add(next) 
    end
	return reverse
end

-- function nodesEqual(n1, n2)
-- 	return n1.x == n2.x and n1.y == n2.y
-- end

----------------------------------------------------------------
-- pathfinding functions
----------------------------------------------------------------

-- assumes both start and goal are of type point
function a_star ( start, goal )
	local queue = PriorityQueue:new() -- queue of path nodes
	
	local closedset = Set() 
	local openset = Set() 
	openset:add(start:str()) -- store the point strings in the set
	
	local came_from = {}
	local g_score = {}
	g_score [start:str()] = 0 -- store the points string as the key
	local startCost = manhattanDistance (start, goal)
	queue:put(start, startCost) -- store point, need it later
	
	while not queue:isEmpty() do
		local current = queue:getFront()
		
		if current:__equals(goal) then
			--print("found")
			--print(current)
			return unwind_path(came_from, current)
		end
		
		openset:remove(current:str())
		closedset:add(current:str())

		for _, neighbor in ipairs(neighbor_nodes(current)) do 
			if not closedset:contains(neighbor:str()) then
				-- update open set
				if not openset:contains(neighbor:str()) then openset:add(neighbor:str()) end

				local tentative_g_score = g_score[current:str()] + 1 -- the neighbor is guaranteed to be one step away
				
				if tentative_g_score < (g_score[neighbor:str()] or math.huge) then --default of infinity 
					came_from 	[neighbor:str()] = current
					g_score 	[neighbor:str()] = tentative_g_score

					queue:put(neighbor,  g_score[neighbor:str()] + manhattanDistance(neighbor, goal))
				end
			end
		end
	end
	return nil -- no valid path
end

----------------------------------------------------------------
-- exposed functions
----------------------------------------------------------------

function clear_cached_paths ()

	cachedPaths = nil
end

function distance ( x1, y1, x2, y2 )
	
	return dist ( x1, y1, x2, y2 )
end

function getAStarPath ( start, goal )
	print("finding path using a star...")
	print(start)
	print(goal)
	if not cachedPaths then cachedPaths = {} end
	if not cachedPaths [ start ] then
		cachedPaths [ start ] = {}
	elseif cachedPaths [ start ] [ goal ] then
		return cachedPaths [ start ] [ goal ]
	end
	res = a_star ( start, goal )
	print("path found")
	--print("a star path: " .. start:str() .. " to " .. goal:str())
	return res
end


-- assumes that validKeys is a list of keys.x, where x 
-- is a valid pressable key
-- returns the first valid pressable key that the user types
function getNextValidKey(validKeys)
    event, key = os.pullEvent("key")
    while not (validKeys:contains(key)) do
        print("bad key: " .. key)
        event, key = os.pullEvent("key")
    end
    return key
end

-- waits until the 'C' key is inputed and then terminates
function waitOnC()
    local event, key = os.pullEvent("key")
    while (not (key == keys.c)) do
        event, key = os.pullEvent("key")
    end
    print("got event: " .. key)
    return 0
end

local myTurtle = Turtle({
    text = {
    "...Quantum physiciality checked....",
    "...Steve detected...",
    "",
    "(a) Quantum physiciality?",   
    "(s) The reactor is looking nice", 
    "(d) What are you doing?",    
    "(f) What is this place?"   
    },
    [keys.a] = {
        text = {"QUANTUM"}
    },
    [keys.s] = {
        text = {"noneS"}
    },
    [keys.d] = {
        text = {"noneF"}
    },
    [keys.f] = {
        text = {
        "This is Turtle Nation. The Steve that",
        "they call hackobster said he made it.",
        "im not too sure, I just really like ",
        "reactors for some reason",
        "",
        "(a) You only like reactors because steve programmed",
        "you to like reactors"
        },
        [keys.a] = {
            text={"WHOA DEEP BRUH"}
        }
    }
})


function doActions()
    myTurtle:forward()
    myTurtle:left()
    myTurtle:forward()
    myTurtle:left()
    myTurtle:forward()
    myTurtle:left()
    myTurtle:forward()
    myTurtle:left()
    --print("finished walk")
    return "complete"
end

turtle.refuel()
while true do 
    --os.sleep(10)
    -- print("start: " .. myTurtle:facingString())
    -- myTurtle:alignFacing(1, 0)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, 1)
    -- os.sleep(1)
    -- myTurtle:alignFacing(-1, 0)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, 1)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, -1)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, 1)
    -- os.sleep(10)
    nextPath = myTurtle:findPath(165, 255)
    for i=1,nextPath.size-1 do
        local nextPoint = nextPath:get(i)
        print("1")
        print(nextPoint)
	    myTurtle:moveTo(nextPoint)
        print("2")
        print(nextPoint)
    end
    sleep(100)
    -- os.sleep(100)
    -- if myTurtle:needsFuel() then
    --     print("running low champ: " .. turtle.getFuelLevel()) 
    --     if not myTurtle:refuel() then
    --         print("out of fuel bruh")
    --         print("should implement way to get to fuel")
    --     end
    -- else 
    --     print("calling stuff in paralell")
    --     local result = parallel.waitForAny(waitOnC, doActions)
    --     -- go into chat if if the user pressed c
    --     if result == 1 
    --     then myTurtle:chat()
    --     else print("no keys today man") end
    -- end
end
