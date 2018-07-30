class Turtle
    new: (tree) => 
        @setPosAndFacing()
        @fuelMin = 5 -- min fuel before turtle tries to refuel
        @fuelMax = 50
        @chatting = false
        @chatTree = tree   

    setPosAndFacing: =>
        -- swap z and y to make more sense
        oldx, oldz, oldy = gps.locate(5, false)
        turtle.refuel()
        while (not turtle.forward()) do
            turtle.turnLeft()
        -- swap z and y to make more sense
        x,z,y = gps.locate(5, false)
        print("old: " .. oldx.." ".. oldy.." ".. oldz)
        print("new: " .. x.." ".. y.." ".. z)
        @x = x
        @y = y
        @z = z 
        @dir = Vector(x - oldx, y - oldy)
        --@facing = dir\toFacing()
        --print("facing: " .. @facing)
        print(@dir)
        print(@posString())
        os.sleep(5)
        return

    --facingString: =>
        --return "("..@dir.x..", "..@dir.y..")"
    
    posString: =>
        return "("..@x..", "..@y..", "..@z..")"


    onEachMove: =>
        print(@dir\__tostring() .. " : " .. @posString())
        --print(@dir)
        --location = "position: ("..@x..", "..@y..", "..@z..")"
        --print(location.." Facing: ".."("..@dir.x..", "..@dir.y..")")

    -- direction is a vector with length 1
    move: (direction) =>
        assert(@dir\length() == 1, "invalid length: " .. direction\length())
        assert(direction\length() == 1, "invalid length: " .. direction\length())
        if (@dir\rotate("90") == direction) then
            @left()
            assert(@dir == direction)
        else if (@dir\rotate("270") == direction) then
            @right()
            assert(@dir == direction)
        else if (@dir\rotate("180") == direction) then
            @right()
            @right()
            assert(@dir == direction)
        @forward()   
        return 0
        
    down: =>
        if turtle.down() then
            @z = @z - 1
            @onEachMove()
            return true
        else
            return false

    forward: =>
        if turtle.forward() then
            @x += @dir.x
            @y += @dir.y
            @onEachMove()
            return true
        else
            return false

    back: =>
        if turtle.back() then
            @x -= @dir.x
            @y -= @dir.y
            @onEachMove()
            return true
        else
            return false
    
    left: => 
        if turtle.turnLeft() then
            @dir = @dir\rotate("90")
            return true
        else
		    return false

    right: => 
        if turtle.turnRight() then
            @dir = @dir\rotate("270")
            return true
        else
		    return false
        
    -- Finds and returns a path to the x and y location
    findPath: (x, y) =>
        start = Point(@x,@y)
        goal = Point(x, y)
        path = getAStarPath(start, goal)
        -- handle the path
        if not path then 
            print("no path found") 
        else 
            return path

    magnitude: (x, y) =>
        return math.sqrt(math.pow(x, 2) + math.pow(y, 2))

TURTLE_WORKS = 0