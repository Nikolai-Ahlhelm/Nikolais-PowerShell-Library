[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

function InfoBox {  #InfoBox -title "TITLE" -text "TEXT"
    param (
        [Parameter(Mandatory=$false)] [string]$title = 'Infobox',
        [Parameter(Mandatory=$false)] [string]$text = 'This is a infobox'
    )

    [System.Windows.Forms.MessageBox]::Show($text,$title,0)
    
}