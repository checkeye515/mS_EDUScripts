if(Test-Path -Path "C:\Program Files\Dell\CommandUpdate\dellcommandupdate.exe"){ 
    $Path = "C:\Program Files\Dell\CommandUpdate\dellcommandupdate.exe"
    $PathExists = $True }

if(Test-Path -Path "C:\Program Files (x86)\Dell\CommandUpdate"){ 
    $Path = "C:\Program Files (x86)\Dell\CommandUpdate\dellcommandupdate.exe"
    $PathExists = $True }

if(Test-Path -Path "C:\Program Files\WindowsApps\Dellinc.DellCommandUpdate*"){
    $PathExists = $False
    $DCUVersion = "3.0.0" }

else { $PathExists = $False }


If($Pathexists){
    $DCUVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($Path) | Select -ExpandProperty FileVersion
    return $DCUVersion
}
