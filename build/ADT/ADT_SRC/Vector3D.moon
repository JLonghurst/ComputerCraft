class Vector3D
    new: (x, y, z) =>
        @x = x
        @y = y
        @z = z
    
    __add: (o) =>
        return Vector3D(o.x + @x, o.y + @y, o.z + @z)        
    
    --assumes v is of type o
    __sub: (o) =>
        return Vector3D(@x - o.x, @y - o.y, @z - o.z)
    
    __mul: (scalar) =>
        return Vector3D(@x * scalar, @y * scalar, @z * scalar)
    
    __div: (scalar) =>
        return Vector3D(@x / scalar, @y / scalar, @z / scalar)
    
    __eq: (o) =>
        return (@x == o.x) and (@y == o.y) and (@z == o.z)

    __tostring: =>
        return "<"..@x..", "..@y..", "..@z..">"

    length: =>
        return math.sqrt(@x*@x + @y*@y + @z*@z)

    rotate: (str) => 
        -- rotations are weird, this shit is fucked
        if str == "270" then
            return Vector3D(-@y, @x, @z)
        else if str == "180" then
            return Vector3D(-@x, -@y, @z)
        else if str == "90" then
            return Vector3D(@y, -@x, @z)
        else 
            print("invalid rotation string")
            return nil

    dot: (o) =>
        return @x*o.x + @y*o.y + @z*o.z

    length_sqr:=>
        return @x * @x + @y* @y + @z*@z
    
    normalized:=>
        return Vector3D(@x / @length, @y / @length, @z / @length)

test = Vector3D!