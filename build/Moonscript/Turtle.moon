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
        print(@dir)
        print(@posString())
        os.sleep(5)
        return

    needsFuel: =>
        return turtle.getFuelLevel() < @fuelMin

    beforeEachMove: =>
        print("IM ABOUT TO MOVE")
        if @needsFuel() then
            print("needs fuel")
            @setPositionGoal(10, 10)
    
    setPositionGoal: (x, y) =>
        print("position goal function")
        print(x .. ", " .. y)
    
    posString: =>
        return "("..@x..", "..@y..", "..@z..")"


    onEachMove: =>
        print(@dir\__tostring() .. " : " .. @posString())

    -- direction is a vector with length 1
    move: (direction) =>
        --assert(@dir\length() == 1, "invalid length: " .. direction\length())
        --assert(direction\length() == 1, "invalid length: " .. direction\length())
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
        --@beforeEachMove()
        if turtle.forward() then
            @x += @dir.x
            @y += @dir.y
            @onEachMove()
            return true
        else
            print "fuck a wall"
            return false

    back: =>
        --@beforeEachMove()
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

    chat: () =>
        chatStack = List()
        key = nil
        while (not (key == keys.q)) do
            term.clear() -- reset display
            term.setCursorPos(1,1) -- point to top of cpu
            --print(chatStack:size())
            print("you are now in chat!")
            print()
            --chatStack:print()
            curChat = @chatTree
            -- walk down chat stack to correct location
            i = 0
            for i=0,(chatStack.size - 1) do 
                --print(chatStack\get(i)) 
                curChat = curChat[chatStack\get(i)]

            -- print all of the text
            for _,line in pairs(curChat.text) do 
                print(line)
            -- print macro keys
            print()
            print("(b): back, (q): quit chatting")
            -- create valid key list with special back: "b" and quit: "q" keys
            valid = List() 
            valid\add(keys.b) 
            valid\add(keys.q)
            for k,_ in pairs(curChat) do
                valid\add(k) -- add possible transitions from this state to valid keys
            -- get the next key the user enters
            key = getNextValidKey(valid)
            if (key == keys.b) then -- go back case
                if (chatStack\empty()) then
                    key = keys.q -- leave chat if already in front
                else
                    chatStack\pop(true) -- go up one level in dialoge, remove the element
            elseif not (key == keys.q) then
                -- go inside next dialoge level
                chatStack\add(key) 
        -- user entered the exit key
        print("exiting chat")
        return

TURTLE_WORKS = 0