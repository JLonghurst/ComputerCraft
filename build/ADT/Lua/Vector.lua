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
      local result = (self.x == other.x) and (self.y == other.y)
      return result
    end,
    __tostring = function(self)
      return "<" .. self.x .. ", " .. self.y .. ">"
    end,
    length = function(self)
      return math.sqrt(self.x * self.x + self.y * self.y)
    end,
    rotate = function(self, str)
      if str == "270" then
        return Vector(-self.y, self.x)
      else
        if str == "180" then
          return Vector(-self.x, -self.y)
        else
          if str == "90" then
            return Vector(self.y, -self.x)(w)
          else
            print("invalid rotation string")
            return nil
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
