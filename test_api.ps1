$headers = @{
"Accept"="application/json"
}

$startBody = @{
"TenantId"="ABE0563"
"Version"="1.0"
"User"="cloudadmin@billslab.com"
}


$start = Invoke-WebRequest -Method "POST" -Uri "https://abe0563.my.centrify.net/Security/StartAuthentication" -Headers $headers -Body $startBody

write-host $start