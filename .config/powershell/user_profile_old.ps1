#Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox
#oh-my-posh init pwsh --config ~/.custom.omp.json | Invoke-Expression

#Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr

#Auto Complete
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows