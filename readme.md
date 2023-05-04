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
