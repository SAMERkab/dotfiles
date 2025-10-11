Install luarocks and lua5.1:
```pwsh
Invoke-WebRequest https://luarocks.github.io/luarocks/releases/luarocks-3.12.2-win32.zip -OutFile ~/Downloads/luarocks-3.12.2-win32.zip
Expand-Archive ~/Downloads/luarocks-3.12.2-win32.zip -DestinationPath ~/Downloads/luarocks-3.12.2-win32
cd ~/Downloads/luarocks-3.12.2-win32
./install.bat /L /P $env:HOME/Programs /CONFIG $env:XDG_CONFIG_HOME/luarocks /NOADMIN
```
Add modify paths according to:
```
luarocks paths
```

Output:
```
============================
== Installing LuaRocks... ==
============================


Installing LuaRocks in C:\Program Files (x86)\LuaRocks...
Installed the LuaRocks bundled Lua interpreter in C:\Program Files (x86)\LuaRocks
Created LuaRocks command: C:\Program Files (x86)\LuaRocks\luarocks.bat
Created LuaRocks command: C:\Program Files (x86)\LuaRocks\luarocks-admin.bat

Configuring LuaRocks...
Created LuaRocks hardcoded settings file: C:\Program Files (x86)\LuaRocks\lua\luarocks\core\hardcoded.lua
Created LuaRocks config file: ~\.config\luarocks\config-5.1.lua

Creating rocktrees...
Created system rocktree    : "C:\Program Files (x86)\LuaRocks\systree"
Created local user rocktree: "C:\Users\samer\AppData\Roaming\LuaRocks"

Loading registry information for ".rockspec" files

============================
== LuaRocks is installed! ==
============================


You may want to add the following elements to your paths;
Lua interpreter;
  PATH     :   C:\Program Files (x86)\LuaRocks
  PATHEXT  :   .LUA
LuaRocks;
  PATH     :   C:\Program Files (x86)\LuaRocks
  LUA_PATH :   C:\Program Files (x86)\LuaRocks\lua\?.lua;C:\Program Files (x86)\LuaRocks\lua\?\init.lua
Local user rocktree (Note: %APPDATA% is user dependent);
  PATH     :   %APPDATA%\LuaRocks\bin
  LUA_PATH :   %APPDATA%\LuaRocks\share\lua\5.1\?.lua;%APPDATA%\LuaRocks\share\lua\5.1\?\init.lua
  LUA_CPATH:   %APPDATA%\LuaRocks\lib\lua\5.1\?.dll
System rocktree
  PATH     :   C:\Program Files (x86)\LuaRocks\systree\bin
  LUA_PATH :   C:\Program Files (x86)\LuaRocks\systree\share\lua\5.1\?.lua;C:\Program Files (x86)\LuaRocks\systree\share\lua\5.1\?\init.lua
  LUA_CPATH:   C:\Program Files (x86)\LuaRocks\systree\lib\lua\5.1\?.dll

Note that the %APPDATA% element in the paths above is user specific and it MUST be replaced by its actual value.
For the current user that value is: C:\Users\samer\AppData\Roaming.
```
