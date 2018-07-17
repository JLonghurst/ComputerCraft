--class Transition
--    new: () =>
--        @readState -- string
--        @readSymbol -- single char string
--        @writeState -- String
--        @writeSymbol -- single char string
--        @moveDirection -- true for right, false for left
        
        -- state is string, symbol is a single string
        -- returns a boolean
--        isConflicting: (state, symbol) =>
 --           return state  ==  @readState and symbol  ==  @readSymbol
class Transition
    new: (zeroFunc, oneFunc, moveForward, transition) =>
        @zero = zeroFunc
        @one = oneFunct
        @forward = moveForward
        @nextState = transition 

class TuringMachine 

    -- type Transition
    curState = getState(@stateIndex)
    if turtle.detectDown("STONE") -- 0 case
        turtle.mineDown()
        turtle.place("STONE")
    else -- 1 case
        turtle.mineDown()
        turtle.place("IRON")
    -- move along the tape
    if curState.forward
        turtle.forward()
    else 
        turtle.backward()
    @stateIndex = curState.nextState
    if @stateIndex = 0 -- halting state
        return


    new: () =>
        @StateSpace = Set\new() -- the set of all non-empty states
		-- alphabet symbols
		-- input symbols (set of symbols)
		-- initial state index?
        @TransitionSpace = Set\new()
        @StartState = ""
        @AcceptState = ""
        @RejectState = ""
        @Tape = ""
        @CurrentState = ""
	    @CurrentSymbol = 0

    -- input is a string, silent mode is a boolean, it is weather you want a print trace of its actions
    -- Returns boolean
    run: (input, silentmode) =>
		@CurrentState = @StartState
		@Tape = input
		
		if not (@CurrentState == @AcceptState) and not (@CurrentState == @RejectState)
			foundTransition = false
			Transition CurrentTransition = nil
			
			if not silentmode
				if @CurrentSymbol > 0
					print(@Tape\sub(0, @CurrentSymbol) + " " + @CurrentState + " " + @Tape\sub(@CurrentSymbol, @CurrentSymbol))
				else
					print(" " + @CurrentState + " " + @Tape\sub(@CurrentSymbol, @CurrentSymbol))

			Iterator<Transition> TransitionsIterator = TransitionSpace.iterator()
            -- go through the values of a set
			while ( TransitionsIterator.hasNext() && foundTransition  ==  false)
		    
				Transition nextTransition = TransitionsIterator.next()
				if (nextTransition.@readState == @CurrentState) && nextTransition.@readSymbol  ==  @Tape\sub(@CurrentSymbol, @CurrentSymbol))
				
					foundTransition = true
					CurrentTransition = nextTransition
				}						
		    }	
			
			if (foundTransition  ==  false)
				print("There is no valid transition for this phase! (state=" .. @CurrentState .. ", symbol=" + @Tape\sub(@CurrentSymbol, @CurrentSymbol) + ")")
				return false
			else
				@CurrentState = CurrentTransition.@writeState
				char[] tempTape = @Tape.toCharArray() 				
				tempTape[@CurrentSymbol] = CurrentTransition.@writeSymbol
				@Tape =  new String(tempTape)
				if (CurrentTransition.@moveDirection == true)
					@CurrentSymbol += 1
				else
					@CurrentSymbol -= 1
				
				if (@CurrentSymbol < 0)
					@CurrentSymbol = 0
				
				while (@Tape.length() <= @CurrentSymbol)
					@Tape ..= "_"
		if (@CurrentState == @AcceptState))
			return true
		else
			return false
	
    -- returns true if it was added, and false otherwise
    -- newState is a string
	addState: (newState) =>
		StateSpace.add(newState)
		return StateSpace.contains(newState)
	
    -- returns a boolean
    -- new start state is a string
	setStartState: (newStartState) =>
		if (StateSpace.contains(new@StartState))
			@StartState = new@StartState
			return true
		else
			return false
	
	-- returns boolean
	setAcceptState: (newAcceptState) =>
		if (StateSpace.contains(newAcceptState) && !@RejectState == newAcceptState))
			@AcceptState = newAcceptState
			return true
		else
			return false
	
	-- returns boolean
	setRejectState: (newRejectState) =>
		if (StateSpace.contains(newRejectState) && !@AcceptState == newRejectState))
			@RejectState = newRejectState
			return true
		else
			return false

	-- returns boolean
	addTransition: (rState, char rSymbol, wState, char wSymbol, boolean mDirection) =>
		if(!StateSpace.contains(rState) || !StateSpace.contains(wState))
			return false
		boolean conflict = false
		Iterator<Transition> TransitionsIterator = TransitionSpace.iterator()
		while ( TransitionsIterator.hasNext() && conflict  ==  false)
			Transition nextTransition = TransitionsIterator.next()
			if (nextTransition.isConflicting(rState, rSymbol))
				conflict = true
		if (conflict  ==  true)
			return false
		else
			Transition newTransition = new Transition()
			newTransition.@readState = rState
			newTransition.@readSymbol = rSymbol
			newTransition.@writeState = wState
			newTransition.@writeSymbol = wSymbol
			newTransition.@moveDirection = mDirection
			TransitionSpace.add(newTransition)
			return true