Add-Type -AssemblyName System.Windows.Forms

function BallonInfo {
    param (
        [Parameter(Mandatory=$false)] [string]$title = 'Info Ballon',
        [Parameter(Mandatory=$false)] [string]$text = 'This is a info ballon',
        [Parameter(Mandatory=$false)] [int]$timeout = 10000
    )
    
    if ($null -eq $script:balloon)
    {
        $script:notify = New-Object System.Windows.Forms.NotifyIcon
    }

    $path = Get-Process -id $pid | Select-Object -ExpandProperty Path
    $notify.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $notify.BalloonTipIcon = "Info"
    $notify.BalloonTipTitle = $title
    $notify.BalloonTipText = $text
    $notify.Visible = $true
    $notify.ShowBalloonTip($timeout)

}



function BallonWarn {
    param (
        [Parameter(Mandatory=$false)] [string]$title = 'Warning Ballon',
        [Parameter(Mandatory=$false)] [string]$text = 'This is a warning ballon',
        [Parameter(Mandatory=$false)] [int]$timeout = 10000
    )
    
    if ($null -eq $script:balloon)
    {
        $script:notify = New-Object System.Windows.Forms.NotifyIcon
    }

    $path = Get-Process -id $pid | Select-Object -ExpandProperty Path
    $notify.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $notify.BalloonTipIcon = "Warning"
    $notify.BalloonTipTitle = $title
    $notify.BalloonTipText = $text
    $notify.Visible = $true
    $notify.ShowBalloonTip($timeout)

}



function BallonError {
    param (
        [Parameter(Mandatory=$false)] [string]$title = 'Error Ballon',
        [Parameter(Mandatory=$false)] [string]$text = 'This is a error ballon',
        [Parameter(Mandatory=$false)] [int]$timeout = 10000
    )
    
    if ($null -eq $script:balloon)
    {
        $script:notify = New-Object System.Windows.Forms.NotifyIcon
    }

    $path = Get-Process -id $pid | Select-Object -ExpandProperty Path
    $notify.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $notify.BalloonTipIcon = "Error"
    $notify.BalloonTipTitle = $title
    $notify.BalloonTipText = $text
    $notify.Visible = $true
    $notify.ShowBalloonTip($timeout)

}