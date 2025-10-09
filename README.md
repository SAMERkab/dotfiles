Install luarocks and lua5.1:
```pwsh
Invoke-WebRequest https://luarocks.github.io/luarocks/releases/luarocks-3.12.2-win32.zip -OutFile ~/Downloads/luarocks-3.12.2-win32.zip
Expand-Archive ~/Downloads/luarocks-3.12.2-win32.zip -DestinationPath ~/Downloads/luarocks-3.12.2-win32
cd ~/Downloads/luarocks-3.12.2-win32
./install.bat /L /CONFIG $env:XDG_CONFIG_HOME/luarocks
```
