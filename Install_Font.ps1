$ScriptPath = $MyInvocation.MyCommand.Path
$CurrentDir = Split-Path $ScriptPath
$FontRegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
foreach ($Font in $(Get-ChildItem -Path $CurrentDir -Include *.ttf, *.otf, *.fon, *.fnt -Recurse)) {
    Copy-Item $Font "C:\Windows\Fonts\" -Force
    New-ItemProperty -Path $FontRegPath -Name $Font.Name -Value $Font.Name -PropertyType String | Out-Null
}