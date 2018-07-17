local Point = {}

-- Creates a new empty list
function Point:new(xCord, yCord) 
    self.__index = self
    -- create a new instance of point
    return setmetatable({
        x = xCord,
        y = yCord
    }, self)
end

function Point:__tostring()
    return "("..self.x..", "..self.y..")"
end

function Point:str()
    return self:__tostring()
end

function Point:getX()
    return self.x
end

function Point:y()
    return self.y
end

function Point:equals(other)
    return (self.x == other.x) and (self.y == other.y)
end
