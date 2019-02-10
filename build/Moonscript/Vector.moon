-- the other object can only be made by number
-- it will only accept others of the form:
--[1, 0]
class Vector
    new: (x, y) =>
        @x = x
        @y = y
    
    __add: (other) =>
        return Vector(other.x + @x, other.y + @y)        
    
    --assumes v is of type other
    __sub: (other) =>
        return Vector(@x - other.x, @y - other.y)
    
    __mul: (scalar) =>
        return Vector(@x * scalar, @y * scalar)
    
    __div: (scalar) =>
        return Vector(@x / scalar, @y / scalar)
    
    __eq: (other) =>
        result = (@x == other.x) and (@y == other.y)
        return result

    __tostring: =>
        return "<"..@x..", "..@y..">"

    length: =>
        return math.sqrt(@x*@x + @y*@y)

    rotate: (str) => 
        -- rotations are weird, this shit is fucked
        if str == "270" then
            return Vector(-@y, @x)
        else if str == "180" then
            return Vector(-@x, -@y)
        else if str == "90" then
            return Vector(@y, -@x)
        else 
            print("invalid rotation string")
            return nil

    dot: (other) =>
        return @x*other.x + @y*other.y

    length_sqr:=>
        return @x * @x + @y* @y
    
    normalized:=>
        return Vector(@x / @length, @y / @length)

VECTOR_WORDS = Vector!