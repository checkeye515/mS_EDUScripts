$UninstallString = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |Get-ItemProperty |Where-Object {$_.DisplayName -like "Dell Command | Update*"} |Select-Object -expandproperty UninstallString 
if($UninstallString.length -eq '0') {
    $UnisntallString = Get-ChildItem -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall |Get-ItemProperty |Where-Object {$_.DisplayName -like "Dell Command | Update*"} |Select-Object -expandproperty UninstallString 
}

return $UnisntallString
