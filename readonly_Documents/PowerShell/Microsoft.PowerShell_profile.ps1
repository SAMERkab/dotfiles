$env:EDITOR = "C:\Program Files\Notepad++\notepad++.exe"

Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias edit $env:EDITOR

iex ((chezmoi completion powershell) -join "`n")