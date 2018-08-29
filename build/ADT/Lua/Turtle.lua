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
      self.dir = Vector(x - oldx, y - oldy)
      print(self.dir)
      print(self:posString())
      os.sleep(5)
    end,
    needsFuel = function(self)
      return turtle.getFuelLevel() < self.fuelMin
    end,
    beforeEachMove = function(self)
      print("IM ABOUT TO MOVE")
      if self:needsFuel() then
        print("needs fuel")
        return self:setPositionGoal(10, 10)
      end
    end,
    setPositionGoal = function(self, x, y)
      print("position goal function")
      return print(x .. ", " .. y)
    end,
    posString = function(self)
      return "(" .. self.x .. ", " .. self.y .. ", " .. self.z .. ")"
    end,
    onEachMove = function(self)
      return print(self.dir:__tostring() .. " : " .. self:posString())
    end,
    move = function(self, direction)
      assert(self.dir:length() == 1, "invalid length: " .. direction:length())
      assert(direction:length() == 1, "invalid length: " .. direction:length())
      if (self.dir:rotate("90") == direction) then
        self:left()
        assert(self.dir == direction)
      else
        if (self.dir:rotate("270") == direction) then
          self:right()
          assert(self.dir == direction)
        else
          if (self.dir:rotate("180") == direction) then
            self:right()
            self:right()
            assert(self.dir == direction)
          end
        end
      end
      self:forward()
      return 0
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
        self.x = self.x + self.dir.x
        self.y = self.y + self.dir.y
        self:onEachMove()
        return true
      else
        print("fuck a wall")
        return false
      end
    end,
    back = function(self)
      if turtle.back() then
        self.x = self.x - self.dir.x
        self.y = self.y - self.dir.y
        self:onEachMove()
        return true
      else
        return false
      end
    end,
    left = function(self)
      if turtle.turnLeft() then
        self.dir = self.dir:rotate("90")
        return true
      else
        return false
      end
    end,
    right = function(self)
      if turtle.turnRight() then
        self.dir = self.dir:rotate("270")
        return true
      else
        return false
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
    end,
    chat = function(self)
      local chatStack = List()
      local key = nil
      while (not (key == keys.q)) do
        term.clear()
        term.setCursorPos(1, 1)
        print("you are now in chat!")
        print()
        local curChat = self.chatTree
        local i = 0
        for i = 0, (chatStack.size - 1) do
          curChat = curChat[chatStack:get(i)]
        end
        for _, line in pairs(curChat.text) do
          print(line)
        end
        print()
        print("(b): back, (q): quit chatting")
        local valid = List()
        valid:add(keys.b)
        valid:add(keys.q)
        for k, _ in pairs(curChat) do
          valid:add(k)
        end
        key = getNextValidKey(valid)
        if (key == keys.b) then
          if (chatStack:empty()) then
            key = keys.q
          else
            chatStack:pop(true)
          end
        elseif not (key == keys.q) then
          chatStack:add(key)
        end
      end
      print("exiting chat")
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
