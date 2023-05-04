##############################################################################################
# Powershell Script to download and install Nerd Fonts
# Fonts are availabe here: https://www.nerdfonts.com/font-downloads
# Assembled by Eugene Valley @ Microsoft Corporation© 2023
#
# This sample script is not supported under any Microsoft standard support program or service.
# This sample script is provided AS IS without warranty of any kind.
# Microsoft further disclaims all implied warranties including, without limitation, any implied
# warranties of merchantability or of fitness for a particular purpose. The entire risk arising
# out of the use or performance of the sample script and documentation remains with you. In no
# event shall Microsoft, its authors, or anyone else involved in the creation, production, or
# delivery of the scripts be liable for any damages whatsoever (including, without limitation,
# damages for loss of business profits, business interruption, loss of business information,
# or other pecuniary loss) arising out of the use of or inability to use the sample script or
# documentation, even if Microsoft has been advised of the possibility of such damages.
##############################################################################################
<#
    .SYNOPSIS
        Download and install patched Nerd Fonts for use with terminal add-ins such as Powerline 
        or Oh My Posh/Oh My ZSH

    .DESCRIPTION
        This script has four phases:
            1. Downloads compressed patched Nerd Fonts from Github to a temp folder
            2. Decompresses the zip files containing the fonts
            3. Copies the fonts to C:\Windows\Fonts and registeres them for the system
            4. Cleanup/housekeeping

    .NOTES
        Version 1.0
        May 4, 2022
#>

# Requires Powershell v3.0

# Check for and create temp folder in user profile
    write-host "Preparing Installation"
    Set-Location $env:USERPROFILE
    $FontTemp = "$($env:USERPROFILE)\fontstemp\"
        if (-not (Test-Path -LiteralPath $FontTemp)) {
                    try {
                New-Item -Path $FontTemp -ItemType Directory -ErrorAction Stop | Out-Null #-Force
            }
            catch {
                Write-Error -Message "Unable to create directory '$FontTemp'. Error was: $_" -ErrorAction Stop
            }
            "Successfully created directory '$FontTemp'."
        }
        else {
            "Directory already existed"
        }
    New-Item -Path $env:USERPROFILE\fontstemp\ -ItemType Directory -Force
    Set-Location -Path $env:USERPROFILE\fontstemp\

# Download Compresed Fonts
    write-host "Downloading Compressed Fonts"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/3270.zip -Outfile "$($env:USERPROFILE)\fontstemp\dl3270.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Agave.zip -Outfile "$($env:USERPROFILE)\fontstemp\Agave.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/AnonymousPro.zip -Outfile "$($env:USERPROFILE)\fontstemp\AnonymousPro.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Arimo.zip -Outfile "$($env:USERPROFILE)\fontstemp\Arimo.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/AurulentSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\AurulentSansMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/BigBlueTerminal.zip -Outfile "$($env:USERPROFILE)\fontstemp\BigBlueTerminal.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/BitstreamVeraSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\BitstreamVeraSansMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/CascadiaCode.zip -Outfile "$($env:USERPROFILE)\fontstemp\CascadiaCode.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/IBMPlexMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\IBMPlexMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/CodeNewRoman.zip -Outfile "$($env:USERPROFILE)\fontstemp\CodeNewRoman.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/ComicShannsMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\ComicShannsMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Cousine.zip -Outfile "$($env:USERPROFILE)\fontstemp\Cousine.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/DaddyTimeMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\DaddyTimeMono.zip" 
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/DejaVuSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\DejaVuSansMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/DroidSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\DroidSansMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FantasqueSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\FantasqueSansMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip -Outfile "$($env:USERPROFILE)\fontstemp\FiraCode.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\FiraMono.zip" 
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Go-Mono.zip -Outfile "$($env:USERPROFILE)\fontstemp\Go-Mono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Gohu.zip -Outfile "$($env:USERPROFILE)\fontstemp\Gohu.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Hack.zip -Outfile "$($env:USERPROFILE)\fontstemp\Hack.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Hasklig.zip -Outfile "$($env:USERPROFILE)\fontstemp\Hasklig.zip" 
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/HeavyData.zip -Outfile "$($env:USERPROFILE)\fontstemp\HeavyData.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Hermit.zip -Outfile "$($env:USERPROFILE)\fontstemp\Hermit.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Inconsolata.zip -Outfile "$($env:USERPROFILE)\fontstemp\Inconsolata.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/iA-Writer.zip -Outfile "$($env:USERPROFILE)\fontstemp\iA-Writer.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/InconsolataGo.zip -Outfile "$($env:USERPROFILE)\fontstemp\InconsolataGo.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/InconsolataLGC.zip -Outfile "$($env:USERPROFILE)\fontstemp\InconsolataLGC.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Iosevka.zip -Outfile "$($env:USERPROFILE)\fontstemp\Iosevka.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/IosevkaTerm.zip -Outfile "$($env:USERPROFILE)\fontstemp\IosevkaTerm.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\JetBrainsMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Lekton.zip -Outfile "$($env:USERPROFILE)\fontstemp\Lekton.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/LiberationMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\LiberationMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Lilex.zip -Outfile "$($env:USERPROFILE)\fontstemp\Lilex.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Meslo.zip -Outfile "$($env:USERPROFILE)\fontstemp\Meslo.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Monofur.zip -Outfile "$($env:USERPROFILE)\fontstemp\Monofur.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Monoid.zip -Outfile "$($env:USERPROFILE)\fontstemp\Monoid.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Mononoki.zip -Outfile "$($env:USERPROFILE)\fontstemp\Mononoki.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/MPlus.zip -Outfile "$($env:USERPROFILE)\fontstemp\MPlus.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Noto.zip -Outfile "$($env:USERPROFILE)\fontstemp\Noto.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/OpenDyslexic.zip -Outfile "$($env:USERPROFILE)\fontstemp\OpenDyslexic.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Overpass.zip -Outfile "$($env:USERPROFILE)\fontstemp\Overpass.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/ProFont.zip -Outfile "$($env:USERPROFILE)\fontstemp\ProFont.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/ProggyClean.zip -Outfile "$($env:USERPROFILE)\fontstemp\ProggyClean.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/RobotoMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\RobotoMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/ShareTechMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\ShareTechMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/SourceCodePro.zip -Outfile "$($env:USERPROFILE)\fontstemp\SourceCodePro.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/SpaceMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\SpaceMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/NerdFontsSymbolsOnly.zip -Outfile "$($env:USERPROFILE)\fontstemp\NerdFontsSymbolsOnly.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Terminus.zip -Outfile "$($env:USERPROFILE)\fontstemp\Terminus.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Tinos.zip -Outfile "$($env:USERPROFILE)\fontstemp\Tinos.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Ubuntu.zip -Outfile "$($env:USERPROFILE)\fontstemp\Ubuntu.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/UbuntuMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\UbuntuMono.zip"
    iwr -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/VictorMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\VictorMono.zip"
    clear

# Decompress fonts
    write-host "Decompressing Fonts"
    New-Item -Path $env:USERPROFILE\fontstemp\decompressed -ItemType Directory -Force
    Set-Location -Path $env:USERPROFILE
    $FontFolder = "$($env:USERPROFILE)\fontstemp\decompressed"
    Get-ChildItem "$($env:USERPROFILE)\fontstemp\" -Filter *.zip | Expand-Archive -DestinationPath $FontFolder
    $Font = Get-Item -Path $FontFolder
    $FontList = Get-ChildItem -Path "$Font\*" -Include ('*.fon','*.otf','*.ttc','*.ttf')
    Set-Location -Path $env:USERPROFILE\fontstemp\decompressed
    clear

# Install fonts    
    foreach ($Font in $FontList) {
            Write-Host 'Installing font -' $Font.BaseName
            Copy-Item $Font "C:\Windows\Fonts"
            New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name         
    }
    clear

# Remove temp folder
    write-host "Performing Cleanup"
    Set-Location $env:USERPROFILE
    Remove-Item -Path fontstemp -Recurse
    write-host "Nerd Font installation completed"
    