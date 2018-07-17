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
        @dx = x - oldx
        @dy = y - oldy
        print(@facingString())
        print(@posString())

        
        return

    facingString: =>
        return "("..@dx..", "..@dy..")"
    
    posString: =>
        return "("..@x..", "..@y..", "..@z..")"


    onEachMove: =>
        os\sleep(.5)
        --location = "position: ("..@x..", "..@y..", "..@z..")"
        print(location.." Facing: ".."("..@dx..", "..@dy..")")

    -- p must be of type point
    moveTo: (p) =>
        --print(p)
        dx = p.x - @x
        dy = p.y - @y
        @alignFacing(dx, dy)
        @forward()

    down: =>
        if turtle.down() then
            @z = @z - 1
            @onEachMove()
            return true
        else
            return false

    forward: =>
        if turtle.forward() then
            @x += @dx
            @y += @dy
            @onEachMove()
            return true
        else
            return false

    back: =>
        if turtle.back() then
            @x -= @dx
            @y -= @dy
            @onEachMove()
            return true
        else
            return false
    
    left: => 
        if turtle.turnLeft() then
            @dx, @dy = -@dy, @dx
            @onEachMove()
            return true
        else
		    return false

    right: => 
        if turtle.turnRight() then
            @dx, @dy = @dy, -@dx
            @onEachMove()
            return true
        else
		    return false
    
    alignFacing: (newDx, newDy) =>
        --print("orig: ".. @dx .. " " .. @dy)
        --print("new: " ..newDx .. " " .. newDy)
        old = Vector(@dx, @dy)
        new = Vector(newDx, newDy)
        assert(old\length() == 1)
        assert(new\length() == 1)
        if (old\rotate("90") == new) then
            @left()
        else if (old\rotate("270") == new) then
            @right()
        else if (old\rotate("180") == new) then
            @right()
            @right()
        else -- else they are equal so do nothing
            return 0
        
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