


$loop = $true
While ($loop) {
    Write-Host "                                                                                                   
    ______     ______     __  __     ______     __  __     __  __        ______   ______     ______     __         ______    
    /\___  \   /\  __ \   /\_\_\_\   /\  __ \   /\ \/\ \   /\ \/\ \      /\__  _\ /\  __ \   /\  __ \   /\ \       /\  ___\   
    \/_/  /__  \ \ \/\ \  \/_/\_\/_  \ \ \/\ \  \ \ \_\ \  \ \ \_\ \     \/_/\ \/ \ \ \/\ \  \ \ \/\ \  \ \ \____  \ \___  \  
      /\_____\  \ \_____\   /\_\/\_\  \ \_____\  \ \_____\  \ \_____\       \ \_\  \ \_____\  \ \_____\  \ \_____\  \/\_____\ 
      \/_____/   \/_____/   \/_/\/_/   \/_____/   \/_____/   \/_____/        \/_/   \/_____/   \/_____/   \/_____/   \/_____/ 
    " -ForegroundColor Magenta
    Write-Host "
    
    0. LockSession
    1. PasswordTool
    2. LinuxTool

    Q. End
    "


    $select = Read-Host
    switch ($select) {
        '0' {
            rundll32.exe user32.dll,LockWorkStation
            }
        '1' {

            } 
        '2' {

            }
        'q' { 
            $loop = $false
            shutdown /s 
            }
    }
}


#script pour restart en boucle Le TOOL
$scriptCible = "C:\Chemin\Vers\Votre\ScriptCible.ps1"

function ExecuterScriptCible {
    Write-Host "Exécution du script cible..."
    Start-Process powershell.exe -ArgumentList "-File $scriptCible"
}

function SurveillerScriptCible {
    $scriptEnCours = Get-Process | Where-Object { $_.Name -eq "powershell" -and $_.MainWindowTitle -eq "C:\Chemin\Vers\Votre\ScriptCible.ps1" }

    if ($scriptEnCours -eq $null) {
        Start-Process powershell.exe -ArgumentList "-File $scriptCible"
    }
}

ExecuterScriptCible

while ($true) {
    SurveillerScriptCible
    Start-Sleep -Seconds 5
}

#Cette ligne permet de start un script en tache de fond
Start-Process powershell.exe -ArgumentList "-File $scriptCible"-NoNewWindow -WindowStyle Hidden
