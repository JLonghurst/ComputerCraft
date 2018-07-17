Set = { boolMap = {}, size = 0}

-- Creates a new empty list
function Set:new() 
    o = {} or o
    setmetatable(o, self)
    self.__index = self
    return o
end

function Set:insert(value)
    if not self.boolMap[value] then
        self.boolMap[value] = true
        self.size = self.size + 1
    end
end

function Set:isEmpty() 
    return self.size <= 0
end

-- function Set:size()
--     return self.size
-- end

function Set:remove(value)
    if self.boolMap[value] then
        self.boolMap[value] = false
        self.size = self.size - 1
    end
end

function Set:contains(value)
    return self.boolMap[value]
end

