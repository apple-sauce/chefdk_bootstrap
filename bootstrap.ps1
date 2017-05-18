Write-Host " "
Write-Host "Here are the top 10 CPU consuming processes right now"
Write-Host " "
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
# Write-Host "`n`nCongrats fellow Chefee!!! Your workstation is now set up for Chef Development!"
