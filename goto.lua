Blocks_to_break = {}
Cord = {x = 0, y = 0, z = 0} -- Enthält die Koordinaten und Blickrichtung
Direction = 0 -- North = 0, West = 1, South = 2, East = 3

function DircetionNumericToName(Direction)
    if Direction == 0 then
        return "north"
    elseif Direction == 1 then
        return "west"
    elseif Direction == 2 then
        return "south"
    elseif Direction == 3 then
        return "east"
    end
end

function DircetionNameToNumeric(directionName)
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
function GetCords(directionName)
    local new_cord = {x = Cord.x, y = Cord.y, z = Cord.z}
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
function Turn_right()
    turtle.turnRight()
    if Direction == 0 then
        Direction = 3
    else
        Direction = Direction - 1
    end

end

function Turn_left()
    turtle.turnLeft()
    if Direction == 3 then
        Direction = 0
    else
        Direction = Direction + 1
    end
end

function MoveForward( n )
    n = n or 1
    for i = 1, n do
        turtle.forward()
        Cord = GetCords(DircetionNumericToName(Direction))
    end
end

function Move( n )
    n = n or 1
    for i = 1, n do
        turtle.up()
        Cord = GetCords(DircetionNumericToName(Direction))
    end
end

function MoveDown( n )
    n = n or 1
    for i = 1, n do
        turtle.down()
        Cord = GetCords(DircetionNumericToName(Direction))
    end
end

function RotateTo( directionName )
    local divDirection = DircetionNameToNumeric(directionName) - Direction
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

function GoTo( x, y, z)
    local divX = x - Cord.x
    local divY = y - Cord.y
    local divZ = z - Cord.z

    if divX > 0 then
        RotateTo("east")
        MoveForward(divX)
    elseif divX < 0 then
        RotateTo("west")
        MoveForward(-divX)
    end

    if divY > 0 then
        Move(divY)
    elseif divY < 0 then
        MoveDown(-divY)
    end

    if divZ > 0 then
        RotateTo("south")
        MoveForward(divZ)
    elseif divZ < 0 then
        RotateTo("north")
        MoveForward(-divZ)
    end
end

GoTo(0, 2, 0)