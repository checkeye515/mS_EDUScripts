$UninstallString = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |Get-ItemProperty |Where-Object {$_.DisplayName -like "Dell Command | Update*"} |Select-Object -expandproperty UninstallString 
if($UninstallString.length -eq '0') {
    $UninstallString = Get-ChildItem -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall |Get-ItemProperty |Where-Object {$_.DisplayName -like "Dell Command | Update*"} |Select-Object -expandproperty UninstallString 
}

$UninstallString
& cmd /c $UninstallString /qn
