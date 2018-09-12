print("")
buildFile = open("TurtleMaster.lua", "w")
buildFileConsole = open("TurtleMasterConsole.lua", "w")

# Should be specified in the order you would like them written in
files_to_read = [
    "../LuaConsoleEnv.lua",
    "../ADT/Lua/Functional.lua",
    "../ADT/Lua/List.lua",
    "../ADT/Lua/Point.lua",
    "../ADT/Lua/Set.lua",
    "../ADT/Lua/Vector.lua",
    "../ADT/Lua/Turtle.lua",
    "../ADT/PriorityQueue.lua",
    "../ADT/AStar.lua",
    "../Main.lua"
];
for fileName in files_to_read:
    f = open(fileName, 'r')
    try:
        data = f.read()
        buildFileConsole.write(data)
        if (fileName == "../LuaConsoleEnv.lua"):
            continue
        print("Adding: ")
        print(f)
        buildFile.write(data)
        print("Added successfully")
        print("")
    finally:
        f.close()

print("File Rendering Completed!")
print("TurtleMaster.lua contains master code")
print("TurtleMasterConsole.lua contains runnable code")
print("")
buildFile.close()