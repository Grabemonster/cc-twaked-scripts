blocks_to_break = {}
cord = {x = 0, y = 0, z = 0} -- Enthält die Koordinaten und Blickrichtung
direction = 0 -- North = 0, West = 1, South = 2, East = 3

function dircetionNuumericToName(direction)
    if direction == 0 then
        return "north"
    elseif direction == 1 then
        return "west"
    elseif direction == 2 then
        return "south"
    elseif direction == 3 then
        return "east"
    end
end

function dircetionNameToNumeric(directionName)
    if directionName == "north" then
        return 0
    elseif directionName == "west" then
        return 1
    elseif directionName == "south" then
        return 2
    elseif directionName == "east" then
        return 3
    end
end

-- Aktualisiert die Koordinaten basierend auf Blickrichtung
function get_cords(directionName)
    local new_cord = {x = cord.x, y = cord.y, z = cord.z}
    if directionName == "north" then
        new_cord.z = new_cord.z - 1
    elseif directionName == "south" then
        new_cord.z = new_cord.z + 1
    elseif directionName == "east" then
        new_cord.x = new_cord.x + 1
    elseif directionName == "west" then
        new_cord.x = new_cord.x - 1
    elseif directionName == "up" then
        new_cord.y = new_cord.y + 1
    elseif directionName == "down" then
        new_cord.y = new_cord.y - 1
    end
    return new_cord
end

-- Dreht die Schildkröte und aktualisiert die Blickrichtung
function turn_right()
    turtle.turnRight()
    if direction == 0 then
        direction = 3
    else
        direction = direction - 1
    end

end

function turn_left()
    turtle.turnLeft()
    if direction == 3 then
        direction = 0
    else
        direction = direction + 1
    end
end

function moveforward( n )
    n = n or 1
    for i = 1, n do
        turtle.forward()
        cord = get_cords(dircetionNuumericToName(direction))
    end
end

function moveup( n )
    n = n or 1
    for i = 1, n do
        turtle.up()
        cord = get_cords(dircetionNuumericToName(direction))
    end
end

function movedown( n )
    n = n or 1
    for i = 1, n do
        turtle.down()
        cord = get_cords(dircetionNuumericToName(direction))
    end
end

function rotateTo( directionName )
    divDirection = dircetionNameToNumeric(directionName) - direction
    if divDirection > 0 then
        for i = 1, divDirection do
            turn_right()
        end
    elseif divDirection < 0 then
        for i = 1, -divDirection do
            turn_left()
        end
    end
end

function goTo( x, y, z)
    divX = x - cord.x
    divY = y - cord.y
    divZ = z - cord.z

    if divX > 0 then
        rotateTo("east")
        moveforward(divX)
    elseif divX < 0 then
        rotateTo("west")
        moveforward(-divX)
    end

    if divY > 0 then
        moveUp(divY)
    elseif divY < 0 then
        moveDown(-divY)
    end

    if divZ > 0 then
        rotateTo("south")
        moveforward(divZ)
    elseif divZ < 0 then
        rotateTo("north")
        moveforward(-divZ)
    end
end