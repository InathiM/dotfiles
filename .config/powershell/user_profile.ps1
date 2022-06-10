# For the first time install Terminal-Icons with
# Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module Terminal-Icons

oh-my-posh --init --shell pwsh --config ~/inathi-theme.omp.json | Invoke-Expression

# History

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineOption -EditMode Windows

# Alias

Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr

# Directory Alias

function work {
    cd "~/source/work/$args"
}

function repos {
    cd "~/source/repos/$args"
}
function Downloads{
    cd "~/Downloads/"
}
function Documents{
    cd "~/Documents/"
}
# Macros

# Inspired by Scott's profile https://gist.github.com/shanselman/25f5550ad186189e0e68916c6d7f44c3
Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
    -BriefDescription BuildCurrentDirectory `
    -LongDescription "Build the current directory" `
    -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        if(Test-Path -Path ".\package.json") {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm run build")
        }else {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
        }
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }

Set-PSReadLineKeyHandler -Key Ctrl+Shift+t `
    -BriefDescription BuildCurrentDirectory `
    -LongDescription "Build the current directory" `
    -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        if(Test-Path -Path ".\package.json") {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm run test")
        }else {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet test")
        }
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }

Set-PSReadLineKeyHandler -Key Ctrl+Shift+s `
    -BriefDescription StartCurrentDirectory `
    -LongDescription "Start the current directory" `
    -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        if(Test-Path -Path ".\package.json") {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm start")
        }else {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet run")
        }
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }
