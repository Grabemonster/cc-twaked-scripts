local args = { ... }
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
    turtle.turnRight()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnLeft()
end

function LEFT()
    turtle.turnLeft()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnRight()
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
        turtle.select(1)
        UP()
        RIGHT()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "tm" then
    while true do
        FUEl()
        turtle.select(1)
        UP()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "tl" then
    while true do
        FUEl()
        turtle.select(1)
        UP()
        LEFT()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "mr" then
    while true do
        FUEl()
        turtle.select(1)
        RIGHT()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "mm" then
    while true do
        FUEl()
        turtle.select(1)
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "ml" then
    while true do
        FUEl()
        turtle.select(1)
        LEFT()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "br" then
    while true do
        FUEl()
        turtle.select(1)
        DOWN()
        RIGHT()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "bm" then
    while true do    
        FUEl()
        turtle.select(1)
        DOWN()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
elseif args[1] == "bl" then
    while true do
        FUEl()
        turtle.select(1)
        DOWN()
        LEFT()
        FORWARD()
        turtle.select(0)
        turtle.dig()
    end
else
    print("Ungültige Position angegeben!")
end
