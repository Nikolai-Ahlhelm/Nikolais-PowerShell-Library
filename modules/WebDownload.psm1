function WebDownload {
    [CmdletBinding()]
    param (
      [Parameter(Mandatory=$true)]
      [string]$Url,
      [Parameter(Mandatory=$true)]
      [string]$SavePath
    )
  
    # Create a web client
    $webClient = New-Object System.Net.WebClient
  

    if (!(Test-Path -Path $SavePath)) {
        New-Item -ItemType Directory -Path $SavePath | Out-Null
    }
      
    # Download the file
    $webClient.DownloadFile($Url, $SavePath)
  }


#  Download-File -Url "http://example.com/file.zip" -SavePath "C:\Downloads\file.zip"