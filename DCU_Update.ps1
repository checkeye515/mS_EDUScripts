if(Test-Path -Path "C:\Program Files\Dell\CommandUpdate\dellcommandupdate.exe"){ 
    $Path = "C:\Program Files\Dell\CommandUpdate\dellcommandupdate.exe"
    $DCUVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($Path) | Select -ExpandProperty FileVersion
    $PathExists = $True }

elseif(Test-Path -Path "C:\Program Files (x86)\Dell\CommandUpdate"){ 
    $Path = "C:\Program Files (x86)\Dell\CommandUpdate\dellcommandupdate.exe"
    $DCUVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($Path) | Select -ExpandProperty FileVersion
    $PathExists = $True }

elseif(Test-Path -Path "C:\Program Files\WindowsApps\Dellinc.DellCommandUpdate*"){
    $PathExists = $True
    $DCUVersion = "3.0.0"
    $WindowsApp = Get-ChildItem -path "C:\Program Files\WindowsApps\DellInc.DellCommandUpdate*"
    Remove-AppxPackage $windows[0].name
    }

else { $PathExists = $False }


If($Pathexists){    
    $UninstallString = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |Get-ItemProperty |Where-Object {$_.DisplayName -like "Dell Command | Update*"} |Select-Object -expandproperty UninstallString 
        if($UninstallString.length -eq '0') {
            $UninstallString = Get-ChildItem -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall |Get-ItemProperty |Where-Object {$_.DisplayName -like "Dell Command | Update*"} |Select-Object -expandproperty UninstallString 
        }
}

if($DCUVersion -lt 4){
    #$UninstallString = $UninstallString + "/qn"
    #& cmd /c $UninstallString
    $argumentList = $UninstallString.Split()[1] + " /qn"
    Start-Process -Wait -FilePath "C:\Windows\System32\msiexec.exe" -ArgumentList $argumentList

    #Invoke-WebRequest "https://dl.dell.com/FOLDER06986400M/2/Dell-Command-Update-Application_P5R35_WIN_4.1.0_A00.EXE" -OutFile "C:\kworking\k01\Dell-Command-Update-Application_P5R35_WIN_4.1.0_A00.EXE"
    $InstallDCU = "c:\kworking\k01\Dell-Command-Update-Application_P5R35_WIN_4.1.0_A00.EXE"# l=C:\kworking\k01\DCUInstallLog.txt"
    Start-Process -Wait -FilePath $InstallDCU -ArgumentList "/s" -PassThru
}
