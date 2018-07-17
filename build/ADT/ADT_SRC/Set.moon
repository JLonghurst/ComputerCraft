class Set
    new: =>
        @boolMap = {}
        @size = 0
    
    size: =>
        temp = @size
        return temp

    empty: =>
        return @size == 0

    add: (ele) =>
        if not @boolMap[ele] then
           @boolMap[ele] = true
           @size += 1

    remove: (ele) =>
        if @boolMap[ele] then
            @size -= 1
            @boolMap[ele] = false

    contains: (ele) =>
        if @boolMap[ele] then 
            return true
        else 
            return false
    
    __tostring: =>
        str = "{"
        for k,_ in pairs(@boolMap) do
            str ..= k\tostring() 
        return str .. "}"

    str: =>
        @__tostring

LIST_WORKS = Set!