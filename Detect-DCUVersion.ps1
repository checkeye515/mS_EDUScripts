$App = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -like "Dell Command*"}
return $App.version
