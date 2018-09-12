-- Begin Enviornment Definitions
local CLOCK = os.clock

local keys = {c=46, a=30, s=31, d=32, f=33}
local turtle = {}
local gps = {}
local os = {}
local rednet = {}

rednet.open = function(sideString)
    print("opened rednet port on side: " .. sideString)
end

rednet.broadcast = function(message)
    print("rednet: " .. message)
end

os.sleep = function(time) 
    local t0 = CLOCK()
    while CLOCK() - t0 <= time do end
end

os.pullEvent = function(eventString)
    if (eventString == "key") then
        local b = ""
        while (b ~= "c") do
            print("no c yet")
            b = io.read(1)
        end
        print("pressed c")
    end
end

turtle.forward = function()
    print("moving turtle forward")
    return true
end

turtle.back = function()
    print("moving turtle backward")
    return true
end

turtle.refuel = function()
    print("refueling the turtle")
    return true
end

turtle.turnLeft = function()
    print("turning the turtle left")
    return true
end

gps.locate = function(timeout, debug)
    return 0, 0, 0
end

-- End Enviornment Definitions
