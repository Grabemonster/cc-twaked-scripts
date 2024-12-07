while true do
    -- Überprüft den Treibstoff
    if turtle.getFuelLevel() < 20 then
        turtle.refuel(1)
        print("Kein Treibstoff!")
    end

    turtle.dig()
    turtle.forward()
    turtle.digUp()
    if not turtle.detectDown() then
        turtle.select(2)
        turtle.placeDown()
        turtle.select(1)
    end
end