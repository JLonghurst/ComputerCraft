----------------------------------------------------------------
-- pathfinding functions
----------------------------------------------------------------

-- assumes both start and goal are of type point
function a_star ( start, goal )

	local queue = PriorityQueue:new() -- queue of path nodes
	
	local closedset = Set:new() 
	local openset = Set:new() 
	openset:insert(start:toString())
	
	local came_from = {}
	local g_score = {}
	g_score [start:toString()] = 0 -- store the points string as the key
	local startCost = manhattanDistance (start, goal)
	local pathList = List:new() pathList:add(start)
	queue:put(pathList, startCost) -- store point, need it later
	
	while not queue:isEmpty() do
		local curPath = queue:getFront()
		local current = curPath:pop(false)

		openset:remove(current:toString())
		closedset:insert(current:toString())
		
		if nodesEqual(current, goal) then
			print("buttz")
			return curPath
		end
		
		for _, neighbor in ipairs(neighbor_nodes(current)) do 
			--print(closedset.size)
			local neighStr = neighbor:toString()

			if not closedset:contains(neighStr) then
				local tentative_g_score = g_score [current] + manhattanDistance (current, neighbor)
				
				if not openset:contains(neighStr) or tentative_g_score < g_score [neighbor] then 
					came_from 	[neighStr] = current
					g_score 	[neighbor] = tentative_g_score
					--print("buttz2")
					queue:put(neighbor,  g_score[neighbor] + manhattanDistance(neighbor, goal))
					-- add to open set if it isnt already in there
					--print("buttz3")	
					if not openset:contains(neighbor) then openset:insert(neighbor) end
				end
			end
		end
	end
	return nil -- no valid path
end
