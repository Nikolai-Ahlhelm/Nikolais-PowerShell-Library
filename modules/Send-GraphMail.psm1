# https://mikecrowley.us/2021/09/25/send-mgusermessage/

function Send-GraphMail {
    [CmdletBinding()]
    param ()
    
    # Dependency check & installation
    $deps = @("Microsoft.Graph.Authentication","Microsoft.Graph.Mail","Microsoft.Graph.Users.Actions")
    foreach ($dep in $deps) {
        if (Get-Module -ListAvailable -Name $dep) {
            #Dependency already satisfied
            Write-Host "✅ Dependency $dep already satisfied"
        }
        else
        {
            try {
                Write-Host "⌛ Installing: $dep"
                Install-Module $dep -Force
                Write-Host "✅ Installed: $dep"
            }
            catch {
                Write-Host "❌ Installation failed: $dep"
            }
            
        }
    }




}



<#
#requires -modules Microsoft.Graph.Authentication,Microsoft.Graph.Mail,Microsoft.Graph.Users

#connect with CBA
# https://docs.microsoft.com/en-us/graph/powershell/app-only?tabs=azure-portal
# https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-self-signed-certificate

$ConnectParams = @{
    ClientId = '84af9676-<not real>4194bb6d9e3'
    TenantId = 'ef508849-9d0<not real>5d800549'
    CertificateThumbprint = '96546bf89<not real>67332c703e15123b07'
}
Connect-Graph @ConnectParams

#recipients
$EmailAddress  = @{address = 'user1@recipientDomain.com'} # https://docs.microsoft.com/en-us/graph/api/resources/recipient?view=graph-rest-1.0
$Recipient = @{EmailAddress = $EmailAddress}  # https://docs.microsoft.com/en-us/graph/api/resources/emailaddress?view=graph-rest-1.0

#Body
$body  = @{
    content = '<html>hello <b>world</b></html>'
    ContentType = 'html'
}

#Attachments
# If over ~3MB: https://docs.microsoft.com/en-us/graph/outlook-large-attachments?tabs=http
$AttachmentPath = 'C:\tmp\Book1.xlsx'
$EncodedAttachment = [convert]::ToBase64String((Get-Content $AttachmentPath -Encoding byte)) 
$Attachment = @{
    "@odata.type"= "#microsoft.graph.fileAttachment"
    name = ($AttachmentPath -split '\\')[-1]
    contentBytes = $EncodedAttachment
}

#Create Message (goes to drafts)
$Message = New-MgUserMessage -UserId me@mydomain.com -Body $body -ToRecipients $Recipient -Subject Subject1 -Attachments $Attachment

#Send Message
Send-MgUserMessage -UserId me@mydomain.com -MessageId $Message.Id
 

#end

#>