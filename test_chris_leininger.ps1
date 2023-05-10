function startupBaseVMs(){
$vmsToStart = @("U665MMSQ6RTN69NQL1BMM3VS8USHKIIK")

$header2 = @{
            "Accept"="application/json"
            "Authorization"= 'Basic Y2xlaW5pbmdlcjpCdCZCaDAwZGllcw=='
            "Content-Type"="application/vnd.vmware.vmw.rest-v1+json"
            } 

foreach($vm in $vmsToStart){
Write-Host $vm
Invoke-WebRequest -Method 'PUT' -Uri "http://127.0.0.1:8697/api/vms/$vm/power" -Headers $header2 -Body "on"
}

}

#Start-Process cmd -FilePath "C:\Program Files (x86)\VMware\VMware Workstation\vmrest.exe" 

startupBaseVMs