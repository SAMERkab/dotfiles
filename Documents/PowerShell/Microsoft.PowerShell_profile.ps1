$env:EDITOR = "nvim"
$env:SHELL = "pwsh"
$env:MYSHELL = "pwsh"
$env:NOTES = "~\Desktop\notes\"
$env:VAULT = "~\Desktop\files\"
$env:MY_MODULE = "$(Split-Path $PROFILE)\Modules\MyModule\MyModule.psm1"

Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias edit $env:EDITOR
Set-Alias lua luart

Invoke-Expression ((chezmoi completion powershell) -join "`n")

