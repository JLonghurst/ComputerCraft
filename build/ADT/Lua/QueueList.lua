local QueueList
do
  local _base_0 = {
    addFront = function(self, x)
      assert(x ~= nil)
      self.tail = self.tail + 1
      self.array[self.tail] = x
    end,
    addBack = function(self, x)
      assert(x ~= nil)
      self.array[self.head] = x
      self.head = self.head - 1
      return self.array[self.tail]
    end,
    lookFront = function(self)
      return self.array[self.head + 1]
    end,
    removeFront = function(self)
      if self:is_empty() then
        return nil
      end
      local r = self.array[self.tail]
      self.array[self.tail] = nil
      self.tail = self.tail - 1
      return r
    end,
    removeBack = function(self)
      if self:is_empty() then
        return nil
      end
      local r = self.array[self.head + 1]
      self.head = self.head + 1
      r = self.array[self.head]
      self.array[self.head] = nil
      return r
    end,
    rotate_right = function(self, n)
      n = n or 1
      if self:is_empty() then
        return nil
      end
      for i = 1, n do
        self:push_left(self:pop_right())
      end
    end,
    rotate_left = function(self, n)
      n = n or 1
      if self:is_empty() then
        return nil
      end
      for i = 1, n do
        self:push_right(self:pop_left())
      end
    end,
    _remove_at_internal = function(self, idx)
      for i = idx, self.tail do
        self.array[i] = self.array[i + 1]
      end
      self.tail = self.tail - 1
    end,
    remove_right = function(self, x)
      for i = self.tail, self.head + 1 do
        if self.array[i] == x then
          _remove_at_internal(self.array, i)
          return true
        end
      end
      return false
    end,
    remove_left = function(self, x)
      for i = self.head + 1, self.tail do
        if self.array[i] == x then
          _remove_at_internal(self.array, i)
          return true
        end
      end
      return false
    end,
    length = function(self)
      return self.tail - self.head
    end,
    is_empty = function(self)
      return self:length() == 0
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self)
      self.array = { }
      self.tail = 0
      self.head = 0
    end,
    __base = _base_0,
    __name = "QueueList"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  QueueList = _class_0
  return _class_0
end
