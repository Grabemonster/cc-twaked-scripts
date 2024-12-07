while true do
    -- Überprüft den Treibstoff
    if turtle.getFuelLevel() < 20 then
        turtle.refuel(1)
        print("Kein Treibstoff!")
    end

    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
    if not turtle.detect() then
        turtle.select(2)
        turtle.placeDown()
        turtle.select(1)
    end
    turtle.turnRight()
    turtle.turnRight()
    if not turtle.detect() then
        turtle.select(2)
        turtle.placeDown()
        turtle.select(1)
    end
    turtle.turnLeft()
    if not turtle.detectDown() then
        turtle.select(2)
        turtle.placeDown()
        turtle.select(1)
    end
end