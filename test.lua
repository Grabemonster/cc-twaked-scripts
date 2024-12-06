blocks_to_break = {}
cord = {x = 0, y = 0, z = 0, facing = "north"} -- Enthält auch die Blickrichtung

-- Überprüft, ob ein Block ein Erz ist
function is_ore(block_data)
    if not block_data or not block_data.name or not block_data.tags then
        return false
    end
    if block_data.tags["c:ores"] then
        print("Erz gefunden:", block_data.name, "an der Koordinate", cord.x,",", cord.y,",", cord.z)
        return true
    end
    return false
end

function get_cords(cord, direction)
    if direction== "north" then
        return {x = cord.x+1, y = cord.y, z = cord.z}
    elseif direction == "west" then
        return {x = cord.x, y = cord.y, z = cord.z+1}
    elseif direction == "south" then
        return {x = cord.x-1, y = cord.y, z = cord.z}
    elseif direction == "east" then
        return {x = cord.x, y = cord.y, z = cord.z-1}
    else if direction == "up" then
        return {x = cord.x, y = cord.y+1, z = cord.z}
    elseif direction == "down" then
        return {x = cord.x, y = cord.y-1, z = cord.z}
    end
end

-- Dreht die Schildkröte und aktualisiert die Blickrichtung
function turn_right()
    turtle.turnRight()
    if cord.facing == "north" then
        cord.facing = "east"
    elseif cord.facing == "east" then
        cord.facing = "south"
    elseif cord.facing == "south" then
        cord.facing = "west"
    elseif cord.facing == "west" then
        cord.facing = "north"
    end
end

function turn_left()
    turtle.turnLeft()
    if cord.facing == "north" then
        cord.facing = "west"
    elseif cord.facing == "west" then
        cord.facing = "south"
    elseif cord.facing == "south" then
        cord.facing = "east"
    elseif cord.facing == "east" then
        cord.facing = "north"
    end
end

-- Scannt die Umgebung nach Erzen
function scann()
    local function check_block(inspect_func, cords)
        local success, block_data = inspect_func()
        if success and is_ore(block_data) then
            table.insert(blocks_to_break, {x = x, y = y, z = z, block_data = block_data})
        end
    end

    -- Vorne
    check_block(turtle.inspect, get_cords(cord, cord.facing))
    -- Unten
    check_block(turtle.inspectDown, get_cords(cord, "down"))
    -- Oben
    check_block(turtle.inspectUp, get_cords(cord, "up"))

    -- Rechts
    turn_right()
    check_block(turtle.inspect, get_cords(cord, cord.facing))

    -- Links
    turn_left()
    turn_left()
    check_block(turtle.inspect, get_cords(cord, cord.facing))

    -- Zurück zur ursprünglichen Ausrichtung
    turn_right()
end

-- Hauptschleife
while true do
    if turtle.getFuelLevel() < 20 then
        turtle.refuel(1)
        print("Kein Treibstoff!")
    end

    scann()

    -- Bewegung (Beispiel: Gehe einen Schritt nach vorne und aktualisiere die Koordinaten)
    if turtle.forward() then
        cord = get_cords(cord, cord.facing)
    else
        print("Blockiert! Kann nicht vorwärts gehen.")
        break -- Optional: Beende die Schleife, wenn die Schildkröte blockiert ist.
    end
end
