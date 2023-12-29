Function src {
	. $PROFILE
}

if ($IsWindows) {
	Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
}

try {
	Import-Module git-aliases -DisableNameChecking -ErrorAction stop
} catch {
	Install-Module git-aliases
	Import-Module git-aliases -DisableNameChecking
}

try {
	Import-Module Posh-Git -ErrorAction stop
} catch {
	Install-Module Posh-Git
	Import-Module Posh-Git
}

try {
	Import-Module Microsoft.PowerShell.UnixTabCompletion -ErrorAction stop
} catch {
	Install-Module Microsoft.PowerShell.UnixTabCompletion
	Import-Module Microsoft.PowerShell.UnixTabCompletion
}

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -EditMode Emacs

Import-PSUnixTabCompletion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineKeyHandler -Key Ctrl+w -Function ShellBackwardKillWord
Set-PSReadLineKeyHandler -Key Ctrl+u -Function DeleteLine

Set-PSReadLineKeyHandler -Key Ctrl+e `
  -BriefDescription EndOfLineOrAcceptSuggestion `
  -LongDescription "Move cursor at the end of the line or accept the suggestion" `
  -ScriptBlock {
	  param($key, $arg)

	  $line = $null
	  $cursor = $null
	  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
	  
	  if ($cursor -lt $line.Length) {
		  [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine($key, $arg)
	  } else {
		  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion($key, $arg)
	  }
  }

try {
	## Add argument completer for the dotnet CLI tool
	Register-ArgumentCompleter -Native -CommandName dotnet  -ErrorAction stop -ScriptBlock {
		param($wordToComplete, $commandAst, $cursorPosition)
		dotnet complete --position $cursorPosition $commandAst.ToString() |
		  ForEach-Object {
			  [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
		  }
	}
} catch {
	Write-Error -Message "Failed to set up dotnet completions, is it installed?"
}


try {
	Invoke-Expression (&starship init powershell) -ErrorAction stop
	Invoke-Expression (& { (starship completions powershell | Out-String) }) -ErrorAction stop
} catch {
	Write-Error -Message "Failed to init starship, continuing without it"
}

try {
	Invoke-Expression (& { (zoxide init powershell | Out-String) }) -ErrorAction stop
} catch {
	Write-Error -Message "Failed to init zoxide, continuing without it"
}

$Env:EZA_ICONS_AUTO = "true"
Set-Alias -Name ls -Value eza
Function la {
	eza -la
}
