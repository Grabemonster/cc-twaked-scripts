function loade(file_path)
    shell.run("delete", file_path) -- Löscht die Datei lokal
    local url = "https://raw.githubusercontent.com/Grabemonster/cc-twaked-scripts/refs/heads/master/" .. file_path
    url = url .. "?t=" .. os.epoch("utc") -- Hängt den aktuellen Zeitstempel als Parameter an
    shell.run("wget", url, file_path) -- Lädt die Datei neu herunter
end

-- Dateien herunterladen
loade("test.lua")
loade("loade.lua")