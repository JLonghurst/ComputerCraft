local methods = peripheral.getMethods("top")
print("methods:")
for k, v in pairs(methods) do
    print(v)
end

local wireless_client = peripheral.wrap("top")


local monitor = peripheral.wrap("left")
if monitor then
    -- test it's connection
    monitor.clear()
    monitor.write("Hello World!")
    monitor.scroll(2)
end


-- global state
local Y = 1
local X = 1
local TIME = 0
-- connect to the rednet port

-- AayuSCwL
while true do
    -- open the log file for appending
    --local logFile = fs.open("first_log", "a")
    -- wait for a message
    monitor.setCursorPos(X, Y)
    local scanTimeout = 1
    monitor.write( TIME..": no data, scanning...")
    rednet.open("top")
    local event, senderID, message = os.pullEvent("rednet_message")
    print(event)
    print(senderID)
    print(message)
    TIME = TIME + scanTimeout
    if message then
        -- handle message
        monitor.write(TIME.. ": RECEIVED => "..message)
        print("wrote data to monitor")
    else
        -- log no message found
        monitor.write( TIME..": no data, scanning...")
        print(TIME.."no data, scanning...")
    end
    --Y = Y + 1
    Y = math.fmod(Y+1,27)
    --logFile.close()
end