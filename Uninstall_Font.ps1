$ScriptPath = $MyInvocation.MyCommand.Path
$CurrentDir = Split-Path $ScriptPath
$FontRegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
foreach ($File in $(Get-ChildItem -Path $CurrentDir -Include *.ttf, *.otf, *.fon, *.fnt -Recurse)) {
    Remove-Item (Join-Path "C:\Windows\Fonts\" $File.Name) -Force | Out-Null
    Remove-ItemProperty -Path $FontRegPath -Name $File.Name | Out-Null
}