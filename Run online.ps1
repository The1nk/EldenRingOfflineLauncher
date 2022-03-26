$game = "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\eldenring.exe"
$launcher = "C:\Program Files (x86)\Steam\steamapps\common\ELDEN RING\Game\start_protected_game.exe"
$steamLauncherPath = "steam://rungameid/1245620"

$gameHash = (Get-FileHash -Path $game).Hash
$launcherHash = (Get-FileHash -Path $launcher).Hash

if ($gameHash -eq $launcherHash) {
    # oops gotta un-patch
    # make backups
    Write-Output "Copying over!"
    Copy-Item -Path ".\eldenring.exe" -Destination $game
    Copy-Item -Path ".\start_protected_game.exe" -Destination $launcher
}

Start-Process -FilePath $steamLauncherPath