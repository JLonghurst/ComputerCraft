-- Main Turtle Prototype
Turtle = 
{   
    --------------------
    --field declarations
    --------------------
    x=0, y=0, z=0, --position of the turtle
    goalX, goalY, goalZ, -- the positions i want
    GOTO=true,



    fuel, --the amount of fuel remaining
    updatefuel =
        function(self)
            fuel = turtle.getFuelLevel()
        end

    refuel = 
        function(self)
            local refuelUnsuccessful = false
            for i = 1, 16 do -- loop through the slots
                turtle.select(i) -- change to the slot
                if turtle.refuel(0) then -- if it's valid fuel
                    local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
                    turtle.refuel(halfStack) -- consume half the stack as fuel
                    refuelUnsuccessful("Strait Chiling, We got it boss")
                    gotFuel = true
                end
            end
            if refuelUnsuccessful
                print("Nigga we fucked")
            end
            self.updatefuel()

    dx,dy --position the turtle is facing

    goToFavLocation =
        function (self)
            if (x != goalX || y != goalY || z != goalZ) {
                
            }     
}

local function Turtle:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    return o
end

if turtle.detect()
boolean result	turtle.detectUp()	Detects if there is a block above	?
boolean result	turtle.detectDown()	

--[[
 Turtle (API)
The Turtle API is used to work with your Turtles.

Key
Color	Turtles that can perform this
White	All
Green	Crafty
Yellow	Mining, Felling, Digging, Farming
Red	Any tool
API
Return	Method name	Description	Min version
boolean success	turtle.craft(number quantity)	Craft items using ingredients anywhere in the turtle's inventory and place results in the active slot. If a quantity is specified, it will craft only up to that many items, otherwise, it will craft as many of the items as possible.	1.4
boolean success	turtle.forward()	Try to move the turtle forward	?
boolean success	turtle.back()	Try to move the turtle backward	?
boolean success	turtle.up()	Try to move the turtle up	?
boolean success	turtle.down()	Try to move the turtle down	?
boolean success	turtle.turnLeft()	Turn the turtle left	?
boolean success	turtle.turnRight()	Turn the turtle right	?
boolean success	turtle.select(number slotNum)	Make the turtle select slot slotNum (1 is top left, 16 (9 in 1.33 and earlier) is bottom right)	?
number slot	turtle.getSelectedSlot()	Indicates the currently selected inventory slot	1.6
number count	turtle.getItemCount([number slotNum])	Counts how many items are in the currently selected slot or, if specified, slotNum slot	?
number count	turtle.getItemSpace([number slotNum])	Counts how many remaining items you need to fill the stack in the currently selected slot or, if specified, slotNum slot	?
table data	turtle.getItemDetail([number slotNum])	Returns the ID string, count and damage values of currently selected slot or, if specified, slotNum slot	1.64
boolean success	turtle.equipLeft()	Attempts to equip an item in the current slot to the turtle's left side, switching the previously equipped item back into the inventory	1.6
boolean success	turtle.equipRight()	Attempts to equip an item in the current slot to the turtle's right side, switching the previously equipped item back into the inventory	1.6
boolean success	turtle.attack()	Attacks in front of the turtle.	1.4
boolean success	turtle.attackUp()	Attacks above the turtle.	1.4
boolean success	turtle.attackDown()	Attacks under the turtle.	1.4
boolean success	turtle.dig()	Breaks the block in front. With hoe: tills the dirt in front of it.	?
boolean success	turtle.digUp()	Breaks the block above.	?
boolean success	turtle.digDown()	Breaks the block below. With hoe: tills the dirt beneath the space below it.	?
boolean success	turtle.place([string signText])	Places a block of the selected slot in front. Engrave signText on signs if provided. Collects water or lava if the currently selected slot is an empty bucket.	1.4
boolean success	turtle.placeUp()	Places a block of the selected slot above. Collects water or lava if the currently selected slot is an empty bucket.	?
boolean success	turtle.placeDown()	Places a block of the selected slot below. Collects water or lava if the currently selected slot is an empty bucket.	?
boolean result	turtle.detect()	Detects if there is a block in front. Does not detect mobs.	?
boolean result	turtle.detectUp()	Detects if there is a block above	?
boolean result	turtle.detectDown()	Detects if there is a block below	?
boolean success, table data/string error message	turtle.inspect()	Returns the ID string and metadata of the block in front of the Turtle	1.64
boolean success, table data/string error message	turtle.inspectUp()	Returns the ID string and metadata of the block above the Turtle	1.64
boolean success, table data/string error message	turtle.inspectDown()	Returns the ID string and metadata of the block below the Turtle	1.64
boolean result	turtle.compare()	Detects if the block in front is the same as the one in the currently selected slot	1.31
boolean result	turtle.compareUp()	Detects if the block above is the same as the one in the currently selected slot	?
boolean result	turtle.compareDown()	Detects if the block below is the same as the one in the currently selected slot	?
boolean result	turtle.compareTo(number slot)	Compare the current selected slot and the given slot to see if the items are the same. Returns true if they are the same, false if not.	1.4
boolean success	turtle.drop([number count])	Drops all items in the selected slot, or specified, drops count items.
[>= 1.4 only:] If there is a inventory on the side (i.e in front of the turtle) it will try to place into the inventory, returning false if the inventory is full.	?
boolean success	turtle.dropUp([number count])	Drops all items in the selected slot, or specified, drops count items.
[>= 1.4 only:] If there is a inventory on the side (i.e above the turtle) it will try to place into the inventory, returning false if the inventory is full.	1.4
boolean success	turtle.dropDown([number count])	Drops all items in the selected slot, or specified, drops count items.
[>= 1.4 only:] If there is a inventory on the side (i.e below the turtle) it will try to place into the inventory, returning false if the inventory is full. If above a furnace, will place item in the top slot.	1.4
boolean success	turtle.suck([number amount])	Picks up an item stack of any number, from the ground or an inventory in front of the turtle, then places it in the selected slot. If the turtle can't pick up the item, the function returns false. amount parameter requires ComputerCraft 1.6 or later.	1.4
boolean success	turtle.suckUp([number amount])	Picks up an item stack of any number, from the ground or an inventory above the turtle, then places it in the selected slot. If the turtle can't pick up the item, the function returns false. amount parameter requires ComputerCraft 1.6 or later.	1.4
boolean success	turtle.suckDown([number amount])	Picks up an item stack of any number, from the ground or an inventory below the turtle, then places it in the selected slot. If the turtle can't pick up the item, the function returns false. amount parameter requires ComputerCraft 1.6 or later.	1.4
boolean success	turtle.refuel([number quantity])	If the current selected slot contains a fuel item, it will consume it to give the turtle the ability to move.
Added in 1.4 and is only needed in needfuel mode. If the current slot doesn't contain a fuel item, it returns false. Fuel values for different items can be found at Turtle.refuel#Fuel_Values. If a quantity is specified, it will refuel only up to that many items, otherwise, it will consume all the items in the slot.	1.4
number fuel	turtle.getFuelLevel()	Returns the current fuel level of the turtle, this is the number of blocks the turtle can move.
If turtleNeedFuel = 0 then it returns "unlimited".	1.4
number fuel	turtle.getFuelLimit()	Returns the maximum amount of fuel a turtle can store - by default, 20,000 for regular turtles, 100,000 for advanced.
If turtleNeedFuel = 0 then it returns "unlimited".	1.6
boolean success	turtle.transferTo(number slot [, number quantity])	Transfers quantity items from the selected slot to slot. If quantity isn't specified, will attempt to transfer everything in the selected slot to slot.	1.45

    
--]]
