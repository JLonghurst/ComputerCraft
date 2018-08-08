


local methods = peripheral.getMethods("top")
print("methods:")
for k, v in pairs(methods) do
    print(v)
end

local monitor = peripheral.wrap("left")
-- if monitor is not null
if monitor then
    -- test it's connection
    monitor.write("Hello World!")
    os.sleep(5)
end
-- connect to the rednet port
rednet.open("top")
if rednet then
    while true do
        -- wait for a message
        local data = rednet.receive(1)
        if data then
            -- handle message
            monitor.clear()
            monitor.setCursorPos(1,1)
            monitor.write(data.message)
            print("wrote data to monitor")
        else 
            print("no data, scanning...")
        end
    end
end

