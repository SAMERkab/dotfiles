[Console]::InputEncoding = [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding

$env:MY_MODULE = "$(Split-Path $PROFILE)\Modules\MyModule\MyModule.psm1"

Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias edit $env:EDITOR

Invoke-Expression ((chezmoi completion powershell) -join "`n")

