#[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

function MessageBox {  #MessageBox -title "TITLE" -text "TEXT" -mode "OkCancel" -icon 0
    param (
        [Parameter(Mandatory=$false)] [string]$title = 'Infobox',
        [Parameter(Mandatory=$false)] [string]$text = 'This is a infobox',
        [Parameter(Mandatory=$false)] [string]$mode = 'OkCancel',
        [Parameter(Mandatory=$false)] [string]$icon = 64
    )

    if (-Not(0,16,32,48,64 -contains $icon)) {
        Write-Host "⚠️ [MessageBox] Invalid icon"
        $icon = 0
    }

    [System.Windows.MessageBox]::Show($text,$title,$mode,$icon)
    return $result
}