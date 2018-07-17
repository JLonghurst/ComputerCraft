local List
do
  local _base_0 = {
    add = function(self, ele)
      self.items[self.size] = ele
      self.size = self.size + 2
    end,
    __tostring = function(self)
      local string = "("
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
    __init = function(self)
      self.items = { }
      self.size = 0
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
local POINT_WORKS = Point()
