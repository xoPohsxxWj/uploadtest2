function Test-Port {
    param(
        [string]$computerName,
        [int]$port
    )

    try {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $tcpClient.Connect($computerName, $port)
        $tcpClient.Close()
        Write-Host "Port $port is open on $computerName"
        return $true
    }
    catch {
        Write-Host "Port $port is closed on $computerName"
        return $false
    }
}

# Usage example:
Test-Port -computerName "host1" -port 80
