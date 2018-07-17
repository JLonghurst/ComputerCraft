print("")
buildFile = open("TurtleMaster.lua", "w")

# Should be specified in the order you would like them written in
files_to_read = [
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
    f = open(fileName, 'r');
    try:
        print("Adding: ")
        print(f)
        buildFile.write(f.read())
        print("Added successfully")
        print("")
    finally:
        f.close()

print("File Rendering Completed!")
print("TurtleMaster.lua contains master code")
print("")
buildFile.close()