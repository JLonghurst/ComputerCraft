--module "Point", package.seeall

class Point
    new: (@x, @y) => -- create x and y point fields
        return -- automatically initializes values

    __tostring: =>
        return "("..@x..", "..@y..")"
    
    str: =>
        return @__tostring()

    __equals: (other) =>
        return (@x == other.x) and (@y == other.y)

POINT_WORKS = Point!