    $LogPath = "C:\Data\Logs"
    If(!(Test-Path -Path $LogPath -ErrorAction SilentlyContinue))
    {
        New-Item -Path $LogPath -ItemType Directory -ErrorAction SilentlyContinue
    }
    
    $LogFile = "$($LogPath)\$($myInvocation.MyCommand).log" 
    
    Start-Transcript $LogFile 
    Write-Host "Logging to $LogFile" 
    
    #region Do Stuff Here     = (Get-NetAdapter).InterfaceIndex
    New-NetIPAddress -InterfaceIndex "" -AddressFamily IPv4 -IPAddress "$($IPAddress)" -PrefixLength 24 -DefaultGateway "$($IPSubNet)1";
    Set-DnsClientServerAddress -ServerAddresses ('127.0.0.1') -InterfaceIndex "$($InterfaceID)";
    #Restart-Computer -Force;    #endregion

    Stop-Transcript
