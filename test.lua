blocks_to_break = {}
cord = {x = 0, y = 0, z = 0} -- Enthält die Koordinaten und Blickrichtung
direction = 0 -- North = 0, West = 1, South = 2, East = 3

-- Überprüft, ob ein Block ein Erz ist
function is_ore(block_data)
    if not block_data or not block_data.name or not block_data.tags then
        return false
    end
    if block_data.tags["c:ores"] then
        return true
    end
    return false
end

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

-- Scannt die Umgebung nach Erzen
function scann()
    -- Hilfsfunktion zum Überprüfen eines Blocks
    local function check_block(inspect_func, cords)
        local success, block_data = inspect_func()
        if success and is_ore(block_data) then
            table.insert(blocks_to_break, {cords = cords, block_data = block_data})
            print("Erze gefunden! Koordinaten: " .. cords.x .. ", " .. cords.y .. ", " .. cords.z)
        end
    end

    -- Scannt vorne
    check_block(turtle.inspect, get_cords(dircetionNuumericToName(direction)))

    -- Scannt unten
    check_block(turtle.inspectDown, get_cords("down"))

    -- Scannt oben
    check_block(turtle.inspectUp, get_cords("up"))

    -- Scannt rechts
    turn_right()
    check_block(turtle.inspect, get_cords(dircetionNuumericToName(direction)))

    -- Scannt links
    turn_left()
    turn_left()
    check_block(turtle.inspect, get_cords(dircetionNuumericToName(direction)))

    -- Zurück zur ursprünglichen Richtung
    turn_right()
end

-- Hauptschleife
while true do
    -- Überprüft den Treibstoff
    if turtle.getFuelLevel() < 20 then
        turtle.refuel(1)
        print("Kein Treibstoff!")
    end

    -- Scannt nach Erzen
    scann()

    -- Bewegt sich vorwärts und aktualisiert die Koordinaten
    if turtle.forward() then
        cord = get_cords(dircetionNuumericToName(direction))
    else
        print("Blockiert! Kann nicht vorwärts gehen.")
        break -- Beendet die Schleife, wenn die Schildkröte blockiert ist
    end
end
