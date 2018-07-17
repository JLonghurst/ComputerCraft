----------------------------------------------------------------
-- local variables
----------------------------------------------------------------

local INF = 1/0
local cachedPaths = nil


----------------------------------------------------------------
-- local functions
----------------------------------------------------------------

function manDist ( x1, y1, x2, y2 )
	return  math.abs(x1 - x2) + math.abs(y1 - y2)
end

function manhattanDistance ( nodeA, nodeB )
	return manDist ( nodeA.x, nodeA.y, nodeB.x, nodeB.y )
end

function is_valid_node( node, neighbor ) 
	local MAX_DIST = 1
	local closeEnough = dist ( node.x, node.y, neighbor.x, neighbor.y ) < MAX_DIST
	--local notBlocked = not blockedPositions:contains(node)
	-- helper function in the a-star module, returns distance between points
	return (closeEnough)
end

function neighbor_nodes (node)
	return {
		Point(node.x, node.y + 1),
		Point(node.x, node.y - 1),
		Point(node.x + 1, node.y),
		Point(node.x - 1, node.y)
	}
end

function unwind_path(cameFrom, current)
	local curNode = current
	flatPath = List() 
    flatPath:add(curNode)
	while cameFrom[curNode:str()] do
		curNode = cameFrom[curNode:str()]
		flatPath:add(curNode)
	end
	-- reverse the list:
	reverse = List()
	while not flatPath:empty() do 
        next = flatPath:pop(true)
        reverse:add(next) 
    end
	return reverse
end

-- function nodesEqual(n1, n2)
-- 	return n1.x == n2.x and n1.y == n2.y
-- end

----------------------------------------------------------------
-- pathfinding functions
----------------------------------------------------------------

-- assumes both start and goal are of type point
function a_star ( start, goal )
	local queue = PriorityQueue:new() -- queue of path nodes
	
	local closedset = Set() 
	local openset = Set() 
	openset:add(start:str()) -- store the point strings in the set
	
	local came_from = {}
	local g_score = {}
	g_score [start:str()] = 0 -- store the points string as the key
	local startCost = manhattanDistance (start, goal)
	queue:put(start, startCost) -- store point, need it later
	
	while not queue:isEmpty() do
		local current = queue:getFront()
		
		if current:__equals(goal) then
			--print("found")
			--print(current)
			return unwind_path(came_from, current)
		end
		
		openset:remove(current:str())
		closedset:add(current:str())

		for _, neighbor in ipairs(neighbor_nodes(current)) do 
			if not closedset:contains(neighbor:str()) then
				-- update open set
				if not openset:contains(neighbor:str()) then openset:add(neighbor:str()) end

				local tentative_g_score = g_score[current:str()] + 1 -- the neighbor is guaranteed to be one step away
				
				if tentative_g_score < (g_score[neighbor:str()] or math.huge) then --default of infinity 
					came_from 	[neighbor:str()] = current
					g_score 	[neighbor:str()] = tentative_g_score

					queue:put(neighbor,  g_score[neighbor:str()] + manhattanDistance(neighbor, goal))
				end
			end
		end
	end
	return nil -- no valid path
end

----------------------------------------------------------------
-- exposed functions
----------------------------------------------------------------

function clear_cached_paths ()

	cachedPaths = nil
end

function distance ( x1, y1, x2, y2 )
	
	return dist ( x1, y1, x2, y2 )
end

function getAStarPath ( start, goal )
	print("finding path using a star...")
	print(start)
	print(goal)
	if not cachedPaths then cachedPaths = {} end
	if not cachedPaths [ start ] then
		cachedPaths [ start ] = {}
	elseif cachedPaths [ start ] [ goal ] then
		return cachedPaths [ start ] [ goal ]
	end
	res = a_star ( start, goal )
	print("path found")
	--print("a star path: " .. start:str() .. " to " .. goal:str())
	return res
end

