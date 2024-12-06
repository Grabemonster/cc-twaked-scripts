blocks_to_brake = {}

function is_ore( block_data )
    if block_data.tag == "c:ores" then
        return true
    end
    return false
end

function scann()
    local block_front, data_front = turtle.inspect()
    if is_ore( data_front ) then
        table.insert( blocks_to_brake, data_front )
    end
    local block_up, data_up = turtle.inspectUp()
    if is_ore( data_up ) then
        table.insert( blocks_to_brake, data_up )
    end
    local block_down, data_down = turtle.inspectDown()
    if is_ore( data_down ) then
        table.insert( blocks_to_brake, data_down )
    end
    turtle.turnRight()
    local block_right, data_right = turtle.inspect()
    if is_ore( data_right ) then
        table.insert( blocks_to_brake, data_right )
    end
    turtle.turnLeft()
    turtle.turnLeft()
    local block_left, data_left = turtle.inspect()
    if is_ore( data_left ) then
        table.insert( blocks_to_brake, data_left )
    end
    turtle.turnRight()
    
end


while true do
    if turtle.getFuelLevel() < 20 then
        turtle.refuel(1)
        print("No fuel")
    end
    scann()
end

