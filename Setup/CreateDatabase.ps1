Import-Module dbatools

$dbName = "Theater"

# Change as needed for your server.  See https://docs.dbatools.io/#Connect-DbaInstance and, possibly, Get-Help Get-Credential.
$instance = Connect-DbaInstance -SqlInstance "."

New-DbaDatabase -SqlInstance $instance -Name $dbName

$tableNames = @("Users", "Orders", "Show", "Auditorium", "Seat", "Screening", "Reservation")
$files = $tableNames | foreach { Join-Path $PSScriptRoot "..\Schema\Tables" "dbo.$_.sql" }

Invoke-DbaQuery -SqlInstance $instance -Database $dbName -File $files
