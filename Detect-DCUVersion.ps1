if(Test-Path -Path "C:\Program Files\Dell\CommandUpdate\dellcommandupdate.exe"){ 
    $Path = "C:\Program Files\Dell\CommandUpdate"
    $PathExists = $True }

if(Test-Path -Path "C:\Program Files (x86)\Dell\CommandUpdate"){ 
    $Path = "C:\Program Files (x86)\Dell\CommandUpdate"
    $PathExists = $True }

if(Test-Path -Path "C:\Program Files\WindowsApps\Dellinc.DellCommandUpdate*"){ 
    $DCUVersion = "3.0"
    return $DCUVersion}

else { $PathExists = $False }

If($Pathexists){
    $Path = "C:\Program Files (x86)\Dell\CommandUpdate\dellcommandupdate.exe"
    $DCUVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($Path) | Select -ExpandProperty FileVersion
    return $DCUVersion
}
else {
   $DCUVersion = "3.0"
   return $DCUVersion
}
