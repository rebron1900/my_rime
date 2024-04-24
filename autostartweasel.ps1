$processName = "WeaselServer"
$processPath = "C:\Program Files (x86)\Rime\weasel-0.15.0\WeaselServer.exe"
$intervalInSeconds = 10

function Start-WeaselServer {
    Start-Process -FilePath $processPath
}

while ($true) {
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
    if (!$process) {
        Write-Output "WeaselServer process not found, starting..."
        Start-WeaselServer
    }
    Start-Sleep -Seconds $intervalInSeconds
}