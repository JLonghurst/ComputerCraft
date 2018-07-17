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
