"System Check - $(Get-Date)" | Out-File diagnostics.log

"CPU Usage:" | Out-File -Append diagnostics.log
Get-CimInstance Win32_Processor | Select-Object LoadPercentage | Out-File -Append diagnostics.log

"Memory Usage:" | Out-File -Append diagnostics.log
Get-CimInstance Win32_OperatingSystem | Select-Object FreePhysicalMemory,TotalVisibleMemorySize | Out-File -Append diagnostics.log

"Disk Usage:" | Out-File -Append diagnostics.log
Get-PSDrive -PSProvider 'FileSystem' | Out-File -Append diagnostics.log

"Top 10 Processes by Memory Usage:" | Out-File -Append diagnostics.log
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 | Out-File -Append diagnostics.log
