# Configurazione Windows
## Software
### Office
Seguire questa [guida](https://gravesoft.dev/office_c2r_custom) per installare una versione custom di Office (originale).

### PowerShell
Copiare il [profilo powershell](https://github.com/lu-papagni/dots-win/raw/main/Microsoft.PowerShell_profile.ps1) in
`C:\UTENTE\Documents\WindowsPowerShell`.

### Scoop
Installare [scoop](https://scoop.sh/) e, successivamente, eseguire nel terminale il comando
```ps1
scoop import <percorso_file>
```
dove `<percorso_file>` è il path ad un [backup di scoop](https://github.com/lu-papagni/dots-win/raw/main/scoop-backup.json).

> [!NOTE]
> il file deve essere presente localmente sul sistema, `scoop` non può leggere un file remoto.

### MSI Afterburner
Installare il software da [qui](https://www.guru3d.com/download/msi-afterburner-beta-download/).
Durante l'installazione verrà scaricato anche `RivaTunerStatisticsServer`;
questo è normale in quanto è una dipendenza di `Afterburner`.

## Attivazione
Per attivare sia Windows che Office è possibile aprire `powershell` ed eseguire il comando seguente:
```ps1
irm https://get.activated.win | iex
```
Seguire le istruzioni a video. Per ulteriori info visitare la [pagina](https://github.com/massgravel/Microsoft-Activation-Scripts) dell'autore.
