local Vector3D
do
  local _class_0
  local _base_0 = {
    __add = function(self, o)
      assert(type(o) == Vector3D)
      return Vector3D(o.x + self.x, o.y + self.y, o.z + self.z)
    end,
    __sub = function(self, o)
      assert(type(o) == Vector3D)
      return Vector3D(self.x - o.x, self.y - o.y, self.z - o.z)
    end,
    __mul = function(self, scalar)
      return Vector3D(self.x * scalar, self.y * scalar, self.z * scalar)
    end,
    __div = function(self, scalar)
      return Vector3D(self.x / scalar, self.y / scalar, self.z / scalar)
    end,
    __eq = function(self, o)
      if (type(o) ~= Vector3D) then
        return false
      else
        return (self.x == o.x) and (self.y == o.y) and (self.z == o.z)
      end
    end,
    __tostring = function(self)
      return "<" .. self.x .. ", " .. self.y .. ", " .. self.z .. ">"
    end,
    length = function(self)
      return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
    end,
    rotate = function(self, str)
      if str == "270" then
        return Vector3D(-self.y, self.x, self.z)
      else
        if str == "180" then
          return Vector3D(-self.x, -self.y, self.z)
        else
          if str == "90" then
            return Vector3D(self.y, -self.x, self.z)
          else
            print("invalid rotation string")
            return nil
          end
        end
      end
    end,
    dot = function(self, o)
      return self.x * o.x + self.y * o.y + self.z * o.z
    end,
    length_sqr = function(self)
      return self.x * self.x + self.y * self.y + self.z * self.z
    end,
    normalized = function(self)
      return Vector3D(self.x / self.length, self.y / self.length, self.z / self.length)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y, z)
      self.x = x
      self.y = y
      self.z = z
    end,
    __base = _base_0,
    __name = "Vector3D"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Vector3D = _class_0
end
local test = Vector3D()
