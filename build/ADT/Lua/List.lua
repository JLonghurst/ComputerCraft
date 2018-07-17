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
