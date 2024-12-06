blocks_to_brake = {}

function is_ore( block_data )
    bool, n = block_data.tags["c:ores"]
    if bool then
        print(block_data.name)
        return true
    end
    return false
end

function scann()
    local block, block_data = turtle.inspect()
    is_ore( block_data ) 
end

while true do
    if turtle.getFuelLevel() < 20 then
        turtle.refuel(1)
        print("No fuel")
    end
    scann()
end

