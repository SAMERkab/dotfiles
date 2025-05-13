$env:EDITOR = "C:\Program Files\Notepad++\notepad++.exe"
$env:SHELL = "pwsh"

Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias edit $env:EDITOR

iex ((chezmoi completion powershell) -join "`n")