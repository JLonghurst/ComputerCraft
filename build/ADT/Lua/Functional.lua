-- classic map
function map(func, array)
  local new_array = {}
  for i,v in ipairs(array) do
    new_array[i] = func(v)
  end
  return new_array
end

-- filter(function, table)
-- e.g: filter(is_even, {1,2,3,4}) -> {2,4}
function filter(func, tbl)
    local newtbl= {}
    for i,v in pairs(tbl) do
        if func(v) then
        newtbl[i]=v
        end
    end
    return newtbl
end

-- returns the length of a table T
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
