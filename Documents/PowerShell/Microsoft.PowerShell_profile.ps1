# Import-Module -Name Terminal-Icons
# Import-Module PSFzf

[Console]::InputEncoding = [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

$env:MY_MODULE = "$(Split-Path $PROFILE)\Modules\MyModule\MyModule.psm1"

Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias edit $env:EDITOR

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Chord Alt+e -Function ViEditVisually

Invoke-Expression ((chezmoi completion powershell) -join "`n")

