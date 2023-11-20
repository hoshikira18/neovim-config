#Prompt
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias cc clear
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Tig\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'


# Utilities
function which($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue | 
	   Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
	}

# Load prompt config 
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) "myprofile.omp.json"
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression


function touch {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )

  if (Test-Path -LiteralPath $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  } else {
    New-Item -Type File -Path $Path
  }
}
