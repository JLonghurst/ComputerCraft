

local List = {}
List.__index = List

-- Creates a new empty list
function List:new() 
    List = {}
    setmetatable(List, self)
    self.__index = self
    List.a = { nil }
    List.aLen = 100
    List.N = 0
    return List
end
-- broken, dont use
function List.createWith(a, aLen, N)
    local s = {}
    setmetatable(s, List)
    s.a = { nil }
    
    s.a = a
    s.aLen = aLen
    s.N = N
    return s
end

function List:copy()
    local temp = {}
    for key,val in pairs(self.a) do
        temp[key] = val
    end
    return List.createWith(temp, self.aLen, self.N)
end

function List:add(value)
    self.a[self.N] = value
    self.N = self.N + 1
    if self.N == self.aLen then
        self:resize(self.aLen * 2)
    end
end

function List:set(index, value)
    self.a[index] = value
end

function List:get(index)
    local temp = self.a[index]
    return temp
end

function List:removeAt(index)
    local item = self.a[index]
    if index == self.N-1 then
        self.N = self.N - 1
        return item
    end
    for i = index+1,self.N-1 do
        self.a[i-1]=self.a[i]
    end
    self.N = self.N - 1
    if self.N == math.floor(self.aLen / 4) then
        self:resize(math.floor(self.aLen / 2))
    end
    return item
end

function List:indexOf(value)
    if self.N == 0 then
        return -1
    end
    for i=0,self.N-1 do
        if self.a[i] == value then
            return i
        end
    end
    return -1
end

function List:contains(value)
    return self:indexOf(value) ~= -1
end

function List:remove(value)
    local index = self:indexOf(value)
    return self:removeAt(index)
end

function List:resize(newSize)
    local temp = {}
    for i = 0,(newSize-1) do
        temp[i] = self.a[i]
    end
    self.a = temp
    self.aLen = newSize
end

function List:size()
    return self.N
end

-- true if you want to remove, false if you want to just access
function List:pop(bool)
    return self:removeAt(self.N-1)
end

function List:isEmpty()
    return self.N == 0
end

function List:enumerate()
    local temp = {}
    for i = 0,(self.N-1) do
        temp[i] = self.a[i]
    end
    return temp
end

-- Prints the contents of the list as comma separated variables [x_0, x_1, ... x_n]
function List:print()
    if self:isEmpty() then
        print("[]")
        return
    end
    local string = "[" .. self.a[0]
    for i = 1, (self.N - 1) do
        string = string .. ", " .. self.a[i]
    end
    string = string .. "]"
    print(string)
end
