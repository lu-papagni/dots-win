# Configurazione Windows
## Installazione
- Per effettuare un'installazione personalizzata di Windows si può usare un file `autounattend.xml`. Questo permetterà di disabilitare
alcune funzioni inutili, creare account locali ed eseguire comandi custom durante il processo.
- Per creare uno di questi file da zero si può usare l'apposito [editor online](https://schneegans.de/windows/unattend-generator/) (non ufficiale).
- Al termine basta scaricare il file appena creato ed copiarlo in un'immagine di Windows originale o in una chiavetta USB
configurata come live-cd.

## Driver
### Chipset (AMD)
Per installare i driver di un processore AMD basta scaricare il
[setup automatico](https://drivers.amd.com/drivers/installer/24.10/whql/amd-software-adrenalin-edition-24.8.1-minimalsetup-240829_web.exe) ed eseguirlo.
Il modello della CPU installata sarà riconosciuto in automatico e verranno installati i driver corretti.
> [!IMPORTANT]
> Al termine dell'installazione andare in `Pannello di controllo > Opzioni risparmio energia` e selezionare il piano energetico _Ryzen Balanced_.
> Questo piano è ottimizzato per la CPU in uso.

### Scheda video (NVIDIA)
Andare sul [sito ufficiale](https://www.nvidia.com/it-it/drivers/) e scaricare la versione appropriata.
> [!TIP]
> Che categoria scegliere?
> - _GeForce_ per le GPU da gaming.
> - _TITAN_ oppure _RTX/QUADRO_ per quelle da woskstation.

### Tastiera Epomaker
Scaricare e installare il [driver](https://orders.epomaker.com/software/EPOMAKER_setup_2.1.71.zip).

## Software essenziali
### Office
Seguire questa [guida](https://gravesoft.dev/office_c2r_custom) per installare una versione custom di Office (originale).
Successivamente sarà possibile attivarlo usando la guida al paragrafo [#attivazione](#attivazione).

## WinGet
Package manager <ins>integrato</ins> in Windows 11.

Le [impostazioni](https://github.com/lu-papagni/dots-win/raw/main/winget/settings.json) vanno copiate in 
`%localappdata%\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json`

Per installare i programmi elencati in un file [winget.json](https://github.com/lu-papagni/dots-win/raw/main/winget/winget.json) eseguire
```ps1
winget import -i winget.json
```
Per aggiornare tutti i pacchetti presenti sul sistema eseguire
```ps1
winget upgrade --all
```
> [!TIP]
> Per accettare automaticamente l'EULA di tutti i programmi basta aggiungere al comando precedente il
> parametro `--accept-package-agreements`.

### Scoop
Package manager per Windows.
> [!IMPORTANT]
> Se si usa WinGet è sconsigliato configurare `scoop` dato che si avrebbe ridondanza.

Installare [scoop](https://scoop.sh/) e, successivamente, eseguire nel terminale il comando
```ps1
scoop import <percorso_file>
```
dove `<percorso_file>` è il path ad un [backup di scoop](https://github.com/lu-papagni/dots-win/raw/main/scoop-backup.json).
> [!NOTE]
> il file deve essere presente localmente sul sistema, `scoop` non può leggere un file remoto.

### PowerShell
Copiare il [profilo powershell](https://github.com/lu-papagni/dots-win/raw/main/Microsoft.PowerShell_profile.ps1) in
`%userprofile%\Documents\WindowsPowerShell`.
> [!WARNING]
> Il modulo `PSFzf` richiede che `fzf` sia già installato!

### Windows Terminal
Copiare il [profilo](https://github.com/lu-papagni/dots-win/blob/main/windows-terminal/settings.json) di Windows Terminal
in `%LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState`.

### MSI Afterburner
- Monitora i parametri del sistema, in particolare quelli della GPU.
- Mostra a schermo le informazioni specificate usando una combinazione di tasti.

Installare il software dal [sito ufficiale](https://www.guru3d.com/download/msi-afterburner-beta-download/).
Durante l'installazione verrà scaricato anche `RivaTunerStatisticsServer`: questo è normale in quanto è una dipendenza di `Afterburner`.

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

### Winget
1. **Stallo durante operazioni su un pacchetto**
   - È un [bug](https://github.com/microsoft/winget-pkgs/issues/133283) che si verifica specialmente quando il pacchetto installa la versione
     portable dell'eseguibile.
   - Non esiste un fix completo ma sono stati trovati dei [workaround](https://github.com/microsoft/winget-cli/issues/3279).

2. **Errore 'Data required by the source is missing'**
   - Si può verificare sulle installazioni pulite di Windows 11.
   - Il fix sembra essere [questo](https://github.com/microsoft/winget-cli/issues/3068#issuecomment-1934922201).

### PowerShell
1. **Gli script di terze parti non vengono eseguiti**
   - Per prima cosa verificare che la politica di esecuzione degli script sia impostata su `RemoteSigned`.
   - Anche in questa modalità bisogna 'sbloccare' manualmente gli script con il comando `Unblock-File <nome_file>`.
   - Qui c'è la [documentazione rilevante](https://learn.microsoft.com/it-it/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4).
