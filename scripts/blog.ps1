param(
	[ValidateSet('dev', 'check', 'type-check', 'build', 'preview', 'install')]
	[string]$Action = 'dev'
)

$ErrorActionPreference = 'Stop'
$projectPath = Split-Path -Parent $PSScriptRoot
$runtimeCandidates = @(
	(Join-Path $env:USERPROFILE '.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe'),
	(Get-Command node -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source)
) | Where-Object { $_ -and (Test-Path -LiteralPath $_) }
$runtimePath = $runtimeCandidates | Where-Object {
	[int]((& $_ -p 'process.versions.node.split(".")[0]') | Select-Object -Last 1) -ge 24
} | Select-Object -First 1
if (-not $runtimePath) { throw '需要 Node 24。安装后重新打开终端再运行此脚本。' }
$previousPath = $env:PATH
$previousLocation = Get-Location
try {
	$env:PATH = (Split-Path -Parent $runtimePath) + ';' + $previousPath
	Set-Location -LiteralPath $projectPath
	Write-Host ('Node: ' + (& $runtimePath --version))
	if ($Action -eq 'install') { & pnpm install --frozen-lockfile }
	elseif ($Action -in @('dev', 'preview')) { & pnpm run $Action --host 127.0.0.1 }
	else { & pnpm run $Action }
	$commandExitCode = $LASTEXITCODE
} finally {
	$env:PATH = $previousPath
	Set-Location -LiteralPath $previousLocation
}
exit $commandExitCode
