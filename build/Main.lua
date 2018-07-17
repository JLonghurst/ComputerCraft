
-- assumes that validKeys is a list of keys.x, where x 
-- is a valid pressable key
-- returns the first valid pressable key that the user types
function getNextValidKey(validKeys)
    event, key = os.pullEvent("key")
    while not (validKeys:contains(key)) do
        print("bad key: " .. key)
        event, key = os.pullEvent("key")
    end
    return key
end

-- waits until the 'C' key is inputed and then terminates
function waitOnC()
    local event, key = os.pullEvent("key")
    while (not (key == keys.c)) do
        event, key = os.pullEvent("key")
    end
    print("got event: " .. key)
    return 0
end

local myTurtle = Turtle({
    text = {
    "...Quantum physiciality checked....",
    "...Steve detected...",
    "",
    "(a) Quantum physiciality?",   
    "(s) The reactor is looking nice", 
    "(d) What are you doing?",    
    "(f) What is this place?"   
    },
    [keys.a] = {
        text = {"QUANTUM"}
    },
    [keys.s] = {
        text = {"noneS"}
    },
    [keys.d] = {
        text = {"noneF"}
    },
    [keys.f] = {
        text = {
        "This is Turtle Nation. The Steve that",
        "they call hackobster said he made it.",
        "im not too sure, I just really like ",
        "reactors for some reason",
        "",
        "(a) You only like reactors because steve programmed",
        "you to like reactors"
        },
        [keys.a] = {
            text={"WHOA DEEP BRUH"}
        }
    }
})


function doActions()
    myTurtle:forward()
    myTurtle:left()
    myTurtle:forward()
    myTurtle:left()
    myTurtle:forward()
    myTurtle:left()
    myTurtle:forward()
    myTurtle:left()
    --print("finished walk")
    return "complete"
end

turtle.refuel()
while true do 
    --os.sleep(10)
    -- print("start: " .. myTurtle:facingString())
    -- myTurtle:alignFacing(1, 0)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, 1)
    -- os.sleep(1)
    -- myTurtle:alignFacing(-1, 0)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, 1)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, -1)
    -- os.sleep(1)
    -- myTurtle:alignFacing(0, 1)
    -- os.sleep(10)
    nextPath = myTurtle:findPath(165, 255)
    for i=1,nextPath.size-1 do
        local nextPoint = nextPath:get(i)
        print("1")
        print(nextPoint)
	    myTurtle:moveTo(nextPoint)
        print("2")
        print(nextPoint)
    end
    sleep(100)
    -- os.sleep(100)
    -- if myTurtle:needsFuel() then
    --     print("running low champ: " .. turtle.getFuelLevel()) 
    --     if not myTurtle:refuel() then
    --         print("out of fuel bruh")
    --         print("should implement way to get to fuel")
    --     end
    -- else 
    --     print("calling stuff in paralell")
    --     local result = parallel.waitForAny(waitOnC, doActions)
    --     -- go into chat if if the user pressed c
    --     if result == 1 
    --     then myTurtle:chat()
    --     else print("no keys today man") end
    -- end
end
