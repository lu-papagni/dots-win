# Configurazione Windows
## Installazione
- Per effettuare un'installazione personalizzata di Windows si può usare un file `autounattend.xml`. Questo permetterà di disabilitare
alcune funzioni inutili, creare account locali ed eseguire comandi custom durante il processo.
- Per creare uno di questi file da zero si può usare l'apposito [editor online](https://schneegans.de/windows/unattend-generator/) (non ufficiale).
- Al termine basta scaricare il file appena creato ed copiarlo in un'immagine di Windows originale o in una chiavetta USB
configurata come live-cd.

## Software essenziali
### Office
Seguire questa [guida](https://gravesoft.dev/office_c2r_custom) per installare una versione custom di Office (originale).

### Scoop
Package manager per Windows.
Installare [scoop](https://scoop.sh/) e, successivamente, eseguire nel terminale il comando
```ps1
scoop import <percorso_file>
```
dove `<percorso_file>` è il path ad un [backup di scoop](https://github.com/lu-papagni/dots-win/raw/main/scoop-backup.json).

### PowerShell
Copiare il [profilo powershell](https://github.com/lu-papagni/dots-win/raw/main/Microsoft.PowerShell_profile.ps1) in
`C:\UTENTE\Documents\WindowsPowerShell`.
> [!WARNING]
> Il modulo `PSFzf` richiede che `fzf` sia già installato!

### Terminal
Copiare il [profilo](https://github.com/lu-papagni/dots-win/blob/main/windows-terminal/settings.json) di Windows Terminal
in `%LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState`.
> [!NOTE]
> il file deve essere presente localmente sul sistema, `scoop` non può leggere un file remoto.

### MSI Afterburner
- Monitora i parametri del sistema, in particolare quelli della GPU.
- Mostra a schermo le informazioni specificate usando una combinazione di tasti.

Installare il software da [qui](https://www.guru3d.com/download/msi-afterburner-beta-download/).
Durante l'installazione verrà scaricato anche `RivaTunerStatisticsServer`;
questo è normale in quanto è una dipendenza di `Afterburner`.

## Utility
| Nome                                                                                | Descrizione                                              |
|-------------------------------------------------------------------------------------|----------------------------------------------------------|
| [Revo uninstaller](https://www.revouninstaller.com/revo-uninstaller-free-download/) | Disinstalla completamente i software su Windows          |
| [WizTree](https://www.diskanalyzer.com/download)                                    | Rappresenta in modo grafico lo spazio occupato sul disco |
| [AnyBurn](https://www.anyburn.com/download.php)                                     | Crea e modifica file ISO                                 |
| [Minitool Partition Wizard](https://www.minitool.com/partition-manager/)            | Manutenzione dischi                                      |
| [MKVToolNix](https://www.fosshub.com/MKVToolNix.html)                               | Editing di file MKV                                      |
| [qBittorrent](https://www.qbittorrent.org/download)                                 | Client open source per torrenting                        |

## Attivazione
Per attivare sia Windows che Office è possibile aprire `powershell` ed eseguire il comando seguente:
```ps1
irm https://get.activated.win | iex
```
Verrà aperta una nuova finestra nel prompt dei comandi: seguire le istruzioni a video.
Per ulteriori info visitare la [pagina dello script](https://github.com/massgravel/Microsoft-Activation-Scripts).

## Varie & Troubleshooting
### Cambiare la password di un utente locale
1. Aprire `netplwiz` con <kbd>SUPER</kbd> + <kbd>R</kbd> o dal menu start.
2. Premere <kbd>CTRL</kbd> + <kbd>ALT</kbd> + <kbd>CANC</kbd>
3. Il pulsante _Cambia password_ sarà cliccabile.
4. Seguire la procedura guidata.
