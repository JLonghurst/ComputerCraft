local butterChatTree = {
    text = {
        "MUST....PASS....BUTTER",
        "",
        "(a) Excuse me?",   
        "(s) You seem to really like butter", 
        "(d) What is your purpose",
        "(f) Why are you moving butter when it just gets put back by a machine?"
    },
    [keys.a] = {
        text = {
            "BUTTER IS LOVE. BUTTER IS LYFE",
            "",
            "(a) what do you think of Turtle Nation"
        },
        [keys.a] = {
            text = {
                "These other turtles are fine, as long as they",
                "STAY AWAY FROM MY BUTTER",
                "IF THEY DONT I WILL SMASH THEIR SCREENS INTO PEICES",
                "",
                "(a) Awfully agressive",
                "(s) Fuck yeah turtles are useless"
            },
            [keys.a] = {
                text = {
                    "DONT FUCK WITH MY BUTTER"
                }
            },
            [keys.s] = {
                text = {
                    "yeah im glad im a butter collector and not",
                    "one of those bitch ass turtles"
                }
            }
        }
    },
    [keys.s] = {
        text = {
            "That is because BUTTER IS AMAZING",
            "SO FLUFFY, SO YELLOW, SO FULL OF SALT FAT!",
            "What isnt there to like about butter?",
            "",
            "(a) Butter is not super heathy to eat?"
        },
        [keys.a] = {
            text = {
                "what is this steve talking about?",
                "butter isnt for EATING, its for PASSING",
                "the feeling of passing butter is",
                "the greatest feeling imaginable.",
                "It is my very purpose and reason for existence",
                "",
                "(a) gotta admit that is pretty sad"
            },
            [keys.a] = {
                "oh mr steve, how many hours have you",
                "wasted playing in this world?",
                "thats what I thought"
            }
        }
    },
    [keys.d] = {
        text = {
            "I PASS BUTTER"
        }
    },
    [keys.f] = {
        text = {
            "It doesnt get put back, the holy butter gods produce",
            "Sweet butter juice from the eather and it is",
            "Materialized in front of me"
        }
    }
}

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

function checkForC()
    local event, key = os.pullEvent("key")
    if (key == keys.c) then
        myTurtle:chat()
    end
end

--UXLJ4BJf
turtle.refuel()

print("fartz")
os.pullEvent("key")
os.sleep(1000)
rednet.open("right")
while true do 
    -- next path is of type L
    nextPath = myTurtle:findPath(10, 10)
    dxs = List()
    for i=0,nextPath.size-2 do
        p1 = nextPath:get(i + 1)
        p2 = nextPath:get(i)
        dxs:add(Vector(p1.x - p2.x, p1.y - p2.y))
    end
    
    print("path length: " .. dxs.size)
    print(dxs)
    for i=0,dxs.size-1 do
        --rednet.broadcast("fuck me bro")
	    myTurtle:move(dxs:get(i))
    end
    print("easy peasy")

    nextPath = myTurtle:findPath(26, 26)
    dxs = List()
    for i=0,nextPath.size-2 do
        p1 = nextPath:get(i + 1)
        p2 = nextPath:get(i)
        dxs:add(Vector(p1.x - p2.x, p1.y - p2.y))
    end

    print("path length: " .. dxs.size)
    print(dxs)
    for i=0,dxs.size-1 do
        --rednet.broadcast("fuck you bro")
	    myTurtle:move(dxs:get(i))
    end
    print("easy peasy")
    -- server testing 
    print("sent some bull shit")
    os.sleep(100)
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