function loade(file_path)
    -- URL mit Cache-Buster erstellen
    local url = "https://raw.githubusercontent.com/Grabemonster/cc-twaked-scripts/refs/heads/master/" .. file_path
    url = url .. "?t=" .. os.epoch("utc") -- Cache umgehen durch Anhängen eines Zeitstempels

    -- HTTP GET-Anfrage
    local response, errorMessage = http.get(url)

    if not response then
        -- Fehlerbehandlung
        print("Fehler beim Herunterladen der Datei: " .. file_path)
        print("Grund: " .. errorMessage)
        return
    end

    -- Alte Datei löschen
    if fs.exists(file_path) then
        fs.delete(file_path)
    end

    -- Heruntergeladene Datei speichern
    local file = fs.open(file_path, "w")
    file.write(response.readAll())
    file.close()
    response.close()

    print("Datei erfolgreich heruntergeladen: " .. file_path)
end

-- Dateien herunterladen
loade("test.lua")
loade("loade.lua")
loade("goto.lua")
