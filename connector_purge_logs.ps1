(Stop-Service -Name adproxy)
(Get-ChildItem -Path "C:\Program Files\Centrify\Centrify Connector\" | Select -ExpandProperty FullName) -match ".txt.*" | Remove-Item
(Start-Service -Name adproxy)
