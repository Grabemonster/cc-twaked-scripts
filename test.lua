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

-- Aktualisiert die Koordinaten basierend auf der Blickrichtung
function adjust_coords(direction)
    if cord.facing == "north" then
        cord.z = cord.z - direction
    elseif cord.facing == "south" then
        cord.z = cord.z + direction
    elseif cord.facing == "east" then
        cord.x = cord.x + direction
    elseif cord.facing == "west" then
        cord.x = cord.x - direction
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
    local function check_block(inspect_func, x, y, z)
        local success, block_data = inspect_func()
        if success and is_ore(block_data) then
            table.insert(blocks_to_break, {x = x, y = y, z = z, block_data = block_data})
        end
    end

    -- Vorne
    check_block(turtle.inspect, cord.x, cord.y, cord.z + 1)
    -- Unten
    check_block(turtle.inspectDown, cord.x, cord.y - 1, cord.z)
    -- Oben
    check_block(turtle.inspectUp, cord.x, cord.y + 1, cord.z)

    -- Rechts
    turn_right()
    check_block(turtle.inspect, cord.x + 1, cord.y, cord.z)

    -- Links
    turn_left()
    turn_left()
    check_block(turtle.inspect, cord.x - 1, cord.y, cord.z)

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
        adjust_coords(1)
    else
        print("Blockiert! Kann nicht vorwärts gehen.")
        break -- Optional: Beende die Schleife, wenn die Schildkröte blockiert ist.
    end
end
