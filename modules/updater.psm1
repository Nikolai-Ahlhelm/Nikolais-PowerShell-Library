#function UpdatePSLM {
    [CmdletBinding()]
    param ()
   


    # Replace <USERNAME> and <REPO> with the relevant values
    $url = "https://github.com/<USERNAME>/<REPO>/archive/master.zip"

    # Use Invoke-WebRequest to download the zip file to the current directory
    Invoke-WebRequest -Uri $url -OutFile "master.zip"

    # Extract the zip file
    Expand-Archive -Path "master.zip" -DestinationPath .

    # Remove the zip file
    Remove-Item "master.zip"


}


