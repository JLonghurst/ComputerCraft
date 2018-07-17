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
