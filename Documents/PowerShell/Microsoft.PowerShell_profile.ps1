# Import-Module -Name Terminal-Icons
# Import-Module PSFzf

[Console]::InputEncoding = [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

$env:MY_MODULE = "$(Split-Path $PROFILE)\Modules\MyModule\MyModule.psm1"

Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias edit $env:EDITOR

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Chord Alt+e -Function ViEditVisually

# Invoke-Expression ((chezmoi completion powershell) -join "`n") # This is covered by Carapace

$env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
carapace _carapace | Out-String | Invoke-Expression
