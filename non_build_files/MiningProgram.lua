local times = ""
local FuelNeeded   -- Minimum level of fuel allowed for turtle to start
local Chest = 0    -- Declaring a chest value to determine if chest should be place in the end
 
 
 
sleep (1)
print ("Turtle will mine 1 block in front, and one to its left. Please use Ctrl+t to terminate and move the turtle")
sleep (2)
print ("Mining turtle wants to dig a 2x2 tunnel. Agree? y/n")
local event, agreeToDig = os.pullEvent("char")
if agreeToDig == "y" then
   print ("Starting the program...")
   sleep (1)
   print ("How long do you wish to tunnel?")
   times = read()
 
 
   print ("Do you wish to place a chest and dump items when done mining? (note: Chest must be in slot 16) y/n")
   local event, checkChest = os.pullEvent("char")
   if checkChest == "y" then
      print ("Will place a chest at the end and dump items into it when done mining")
      Chest = Chest+2
   else
      print ("Do you wish to use pre-placed chest at the end? y/n")
      local event, checkChest1 = os.pullEvent("char")
      if checkChest1 == "y" then
         Chest = Chest+1
      else
         print ("Will keep items in turtle...")
         Chest = Chest+3    
      end
   end
   
   FuelNeeded = times*4+1
   print ("Fuel needed to dig is "..FuelNeeded)
 
   if turtle.getFuelLevel() < FuelNeeded then
      print ("Fuel level is: "..turtle.getFuelLevel())
      print ("Turtle is low on fuel. Do you wish to refuel? y/n")
      local event, param1 = os.pullEvent("char")
      if param1 == "y" then
         turtle.select(1)  
         turtle.refuel()
         
      else
         print ("!Too low fuel for program to initiate!")
         print ("Turtle rebooting!")
         sleep (2)
         os.reboot()
         
      end
   end
 
   for i = 1, times do
      print ("Current fuel level is: "..turtle.getFuelLevel())
      turtle.select(2)
      while not turtle.detectDown() do
         turtle.placeDown()
         
      end
      turtle.dig()
      while turtle.detect() do
         turtle.dig()
      end
      while not turtle.forward() do
         turtle.dig()
      end
      turtle.digUp()
      while turtle.detectUp() do
         turtle.digUp()
      end
      turtle.turnLeft()
      turtle.dig()
      while turtle.detect() do
         turtle.dig()
      end
      turtle.turnRight()
      while not turtle.up() do
         turtle.digUp()
      end
      turtle.turnLeft()
      turtle.dig()
      while turtle.detect() do
         turtle.dig()
      end
     
      turtle.down()
      while turtle.detect() do
         turtle.dig()
      end
      turtle.turnRight()
   end
   times = times+1
   turtle.turnLeft()
   turtle.turnLeft()
 
   for i = 1, times do
      while not turtle.forward() do
         sleep (1)
      end
   end
else
   shell.exit()
end
 
if Chest == 3 then
   print ("Done!")
end
 
if Chest == 1 then
   for i = 1, 16 do
      turtle.select(i)
      turtle.drop()  
   end
end
 
 
if Chest == 2 then
   turtle.select(16)
   turtle.place()
   sleep (1)
   
   for i = 1, 16 do
      turtle.select(i)
      turtle.drop()  
   end
end
 
turtle.turnLeft()
turtle.turnLeft()