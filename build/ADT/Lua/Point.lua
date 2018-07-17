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
