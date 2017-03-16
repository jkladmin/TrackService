# Powershell script to send email if service stops
#Just copy this file to c:\scripts and run it. You can leave the windows up or minimize it.
$srvce = "spooler"
$srvce2 = "diagtrack"
$ES = "jklappsrv1"
$EF = "appsrv@me.com"
$ET = "jklnyg@gmail.com"

while ((Get-Service $srvce).status -eq "Running")
{Start-Sleep -Seconds 10}
while ((Get-Service $srvce).status -eq "Running")
{Start-Sleep -Seconds 10}

 
Send-MailMessage -smtpserver $ES -From $EF -To $ET -subject "Monitored $srvce service stopped!!!" -Body "Monitored $srvce Service Stopped!!!"
$d = get-date
write-host "$srvce Service Stopped at $d . Sending email and attempting to restart service"
start-service $srvce
powershell c:\scripts\trackservice.ps1

