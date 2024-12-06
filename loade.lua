function loade( file_path )
    shell.run("delete", file_path)
    shell.run("wget", "https://raw.githubusercontent.com/Grabemonster/cc-twaked-scripts/refs/heads/master/" .. file_path, file_path)
end

loade("loade.lua")
loade("test.lua")