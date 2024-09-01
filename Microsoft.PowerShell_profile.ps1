# Integrazione fzf
If (-Not (Get-Module -ListAvailable -Name PSFzf)) {
  Install-Module -Name PSFzf -Force -Verbose -Scope CurrentUser
}
Import-Module PSFzf

# Autocompletamento
If (-Not (Get-Module -ListAvailable -Name PSReadLine)) {
  Install-Module -Name PSReadLine -Force -Verbose -Scope CurrentUser
}
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -Colors @{ InlinePrediction = '#875f5f' }
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord

# Installa o ripara Vencord
function Install-Vencord {
  $downloads = "$env:userprofile\Downloads"
  Invoke-RestMethod -Uri "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe" -OutFile "$downloads\vencord.exe"
  powershell.exe -NoProfile -Command "$downloads/vencord.exe"
  rm "$downloads\vencord.exe"
}

# Controlla se `scoop` è stato installato
If (Test-Path -path "$env:userprofile\scoop\shims\scoop.cmd" -PathType Leaf) {
  function Print-LsdTree { lsd --tree }

  # Alias 
  Set-Alias -Name curl -Value curl.exe -Option AllScope
  Set-Alias -Name ls -Value lsd -Option AllScope
  Set-Alias -Name tree -Value Print-LsdTree -Option AllScope
  Set-Alias -Name touch -Value New-Item -Option AllScope
  Set-Alias -Name vim -Value nvim -Option AllScope

  # Comandi da eseguire all'avvio
  fastfetch -c "C:\\Users\\papag\\.config\\fastfetch\\small.jsonc"

} else {
  Write-Host "`nPackage manager Scoop non installato: https://scoop.sh" -f Red
}

function prompt {
  # Controlla se l'ultimo comando è andato a buon fine
  $cmd_success = $(if ($? -eq $false) {"$([char]27)[31m"} else {"$([char]27)[32m"})

  # Carattere di escape
  $ESC = [char]27

  # Icone
  $circ_half_sx = [char]0xe0b6 # Semicerchio verso sinistra
  $circ_half_dx = [char]0xe0b4 # Semicerchio verso destra
  $folder = [char]0xf07c # Icona della cartella
  $clock = [char]0xf017 # Icona orologio
  $arrow = "❯" #[char]0xea9c # Freccia del prompt
  $sep = [char]0xf460 # Divisore delle info

  # Informazioni a schermo
  $cur_path = $(Get-Location).path -replace $env:userprofile.Replace("\", "\\"), "~"

  if (([Security.Principal.WindowsPrincipal] `
       [Security.Principal.WindowsIdentity]::GetCurrent() `
      ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
  {
    $user = "Amministratore"
    $status = [char]0xeb53 # Scudo amministratore
  } else {
    $user = "$env:username$ESC[0m@$ESC[36m$env:computername"
    $status = [char]0xe62a # Logo Windows
  }

  # Riga del prompt
  "`n$ESC[36m$status $user" +
  "$ESC[0m $ESC[38;2;130;130;130m$sep  $ESC[0m$folder  $cur_path " + 
  "$ESC[38;2;130;130;130m$sep  $ESC[33m$clock $(Get-Date -Format "HH:mm:ss")$ESC[0m`n"`
  + $(if ($NestedPromptLevel -ge 1) { '>>' }) + "$cmd_success$arrow$ESC[0m "
}
