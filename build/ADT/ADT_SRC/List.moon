--module "Point", package.seeall

class List
    new: (table) =>
        @items = {}
        @size = 0
        if table then
            for _,v in pairs(table)
                @add(v)

    empty: =>
        return @size == 0

    add: (ele) =>
        @items[@size] = ele
        @size += 1

    remove: (ele) =>
        index = indexOf(ele)
        if index ~= (-1) then
            return @removeAt(index)

    contains: (ele) =>
        indexOf(ele) ~= -1
    
    pop: (bool) =>
        if bool then
            return @removeAt(@size-1)
        else
            return get(@size-1)

    set: (index, value) =>
        @items[index] = value

    get: (index) =>
        temp = @items[index]
        return temp

    removeAt: (index) =>
        item = @items[index]
        if (index == (@size-1)) then
            @size -= 1
            return item
        else for i = index+1,@size-1 do @items[i-1] = @items[i]
        @size -= 1
        return item

    indexOf: (ele) =>
        for i=0,(@size-1) do
            if  @items[i] == ele then
                return i
        return -1

    __tostring: =>
        str = "["
        for i=0, @size - 1 do
            item = @get(i)\__tostring()
            str ..= i .. ":" .. item .. " "
            if (i+1) % 4 == 0 then
                str ..= "\n"
        return str .. "]"
    
    str: =>
        return @__tostring()

    __equals: (other) =>
        return (@x == other.x) and (@y == other.y)

LIST_WORKS = List!