# Configurazione Windows
## PowerShell
Copiare il [profilo powershell](https://github.com/lu-papagni/dots-win/raw/main/Microsoft.PowerShell_profile.ps1) in
`C:\UTENTE\Documents\WindowsPowerShell`.

## Scoop
Installare [scoop](https://scoop.sh/) e, successivamente, eseguire nel terminale il comando
```ps1
scoop import <percorso_file>
```
dove `<percorso_file>` è il path ad un [backup di scoop](https://github.com/lu-papagni/dots-win/raw/main/scoop-backup.json).

> [!NOTE]
> il file deve essere presente localmente sul sistema, `scoop` non può leggere un file remoto.

## MSI Afterburner
Installare il software da [qui](https://www.guru3d.com/download/msi-afterburner-beta-download/).
Durante l'installazione verrà scaricato anche `RivaTunerStatisticsServer`;
questo è normale in quanto è una dipendenza di `Afterburner`.
