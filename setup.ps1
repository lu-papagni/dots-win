function Import-MySettings {
  $programs = @{
    powershell = @(
      @{
        fileName = "Microsoft.PowerShell_profile.ps1"
        configPath = "$env:userprofile\Documents\WindowsPowerShell"
      },
      @{
        fileName = "Microsoft.PowerShell_profile.ps1"
        configPath = "$env:userprofile\Documents\PowerShell"
      }
    )
    afterburner = @(
      @{
        fileName = "*.cfg"
        configPath = "${env:ProgramFiles(x86)}\MSI Afterburner"
      }
    )
    winget = @(
      @{
        fileName = "settings.json"
        configPath = "$env:localappdata\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState"
      }
    )
    "windows-terminal" = @(
      @{
        fileName = "settings.json"
        configPath = "$env:localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
      }
    )
  }

  foreach ($program in $programs.keys) {
    if (Test-Path -Path "$program" -PathType Container) {
      $targetList = $programs["$program"]

      foreach ($target in $targetList) {
        $fileName = $target.fileName
        $configPath = $target.configPath

        try {
          New-Item -ItemType Directory -Path "$configPath" -ErrorAction Stop
        } catch [System.IO.IOException] {
          Write-Host -ForegroundColor Green "Il percorso '$configPath' esiste, non verrà sovrascritto"
        }

        Copy-Item "$program\$fileName" "$configPath" -Force
      }

    } else {
      Write-Host -ForegroundColor Red "Impossibile trovare le impostazioni di '$program'"
    }
  }
}

# aggiorna tutti i pacchetti già presenti
winget upgrade --all --accept-package-agreements

# installa i pacchetti mancanti
if (Test-Path -Path "winget\winget.json" -PathType Leaf) {
  winget import -i "winget\winget.json" --accept-package-agreements
} else {
  Write-Host -ForegroundColor Red "Impossibile trovare il backup di winget"
}

# copia i file di configurazione
Import-MySettings

# cancella la repository
$repo = "$(Get-Location)"
cd ..
Remove-Item -Recurse -Force "$repo"
