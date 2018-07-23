function write()
    turtle.digDown()
    turtle.placeDown()
end

function write1() 
    turtle.select(2)
    write()
end

function write0() 
    turtle.select(1)
    write()
end

-- Assumes direction is ether "L" or "R", does nothing for anything else
function move(direction)
    if (direction == "L") then 
        turtle.back()
    else 
        if (direction == "R") then
            turtle.forward() 
        end
    end
end

-- 4 state busy beaver
local fourStateBeaver = {
    -- state
    [1]={
        -- read symbol
        [0]={
            writeCommand=write1,
            moveCommand="R",
            gotoState=2
        },
        [1]={
            writeCommand=write1,
            moveCommand="L",
            gotoState=2
        }
    },
    [2]={
        [0]={   
            writeCommand=write1,
            moveCommand="L",
            gotoState=1
        },
        [1]={   
            writeCommand=write0,
            moveCommand="L",
            gotoState=3
        }        
    },
    [3]={
        [0]={   
            writeCommand=write1,
            moveCommand="R",
            gotoState=0 -- halt
        },
        [1]={   
            writeCommand=write1,
            moveCommand="L",
            gotoState=4
        }        
    },
    [4]={
        [0]={   
            writeCommand=write1,
            moveCommand="R",
            gotoState=4
        },
        [1]={   
            writeCommand=write0,
            moveCommand="R",
            gotoState=1
        }        
    }
}

local currentState = 1
local stepCount = 0
-- while we are not in the halt state
while currentState ~= 0 do
    turtle.select(1)
    -- assumes turtle has selected the iron slot
    local nextActions = nil
    if turtle.compareDown() then
        nextActions = fourStateBeaver[currentState][0]
    else
        nextActions = fourStateBeaver[currentState][1]
    end
    -- assumes nextActions ~= nil
    nextActions.writeCommand()
    move(nextActions.moveCommand)
    currentState = nextActions.gotoState
    stepCount = stepCount + 1
    --print("now in state=" .. currentState)
end
print("Halted after " .. stepCount .. " steps")