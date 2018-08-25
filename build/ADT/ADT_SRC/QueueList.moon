class QueueList
    new: => 
        @array = {}
        @tail = 0
        @head = 0

    addFront: (x) => 
        assert(x ~= nil)
        @tail = @tail + 1
        @array[@tail] = x

    addBack: (x) => 
        assert(x ~= nil)
        @array[@head] = x
        @head = @head - 1
        return @array[@tail]

    lookFront: =>
        return @array[@head+1]

    removeFront: =>
        if @is_empty() then 
            return nil 
        r = @array[@tail]
        @array[@tail] = nil
        @tail = @tail - 1
        return r

    removeBack: =>
        if @is_empty() then 
            return nil 
        r = @array[@head+1]
        @head = @head + 1
        r = @array[@head]
        @array[@head] = nil
        return r

    rotate_right: (n) => 
        n or= 1
        if @is_empty() then 
            return nil 
        for i=1,n do @push_left(@pop_right()) 
        return

    rotate_left: (n) => 
        n or= 1
        if @is_empty() then 
            return nil 
        for i=1,n do 
            @push_right(@pop_left())
        return

    _remove_at_internal: (idx) =>
        for i=idx, @tail do 
            @array[i] = @array[i+1] 
        @tail = @tail - 1

    remove_right: (x) =>
        for i= @tail, @head+1
            if @array[i] == x then
                _remove_at_internal(@array, i)
                return true
        return false

    remove_left: (x) => 
        for i= @head+1, @tail
            if @array[i] == x then
                _remove_at_internal(@array, i)
                return true
        return false

    length: =>
        return @tail - @head

    is_empty: =>
        return @length() == 0