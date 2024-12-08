local args = { ... }
local BLOCK_Slot = 2
local FUEL_Slot = 1

if #args == 0 then
    print("gib die position an: tr, tm, tl, mr, mm, ml, br, bm, bl, ")
    print("b: botom, m: middle, t: top, l: left, r: right")
    return
end

-- Funktionen für Bewegungen und Platzierung
function UP()
    if not turtle.detectUp() then
        turtle.placeUp()
    end
end

function RIGHT()
    turtle.turnLeft()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnRight()
end

function LEFT()
    turtle.turnRight()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnLeft()
end

function DOWN()
    if not turtle.detectDown() then
        turtle.placeDown()
    end
end

function FORWARD()
    if not turtle.detect() then
        turtle.place()
    end
end

function FUEl()
    if turtle.getFuelLevel() < 20 then
        turtle.refuel(1)
        print("Kein Treibstoff!")
    end
end

-- Logik basierend auf der Argumenteingabe
if args[1] == "tr" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        UP()
        RIGHT()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "tm" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        UP()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "tl" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        UP()
        LEFT()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "mr" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        RIGHT()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "mm" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "ml" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        LEFT()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "br" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        DOWN()
        RIGHT()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "bm" then
    while true do    
        FUEl()
        turtle.select(BLOCK_Slot)
        DOWN()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
elseif args[1] == "bl" then
    while true do
        FUEl()
        turtle.select(BLOCK_Slot)
        DOWN()
        LEFT()
        FORWARD()
        turtle.select(FUEL_Slot)
        turtle.dig()
        turtle.forward()
    end
else
    print("Ungültige Position angegeben!")
end
