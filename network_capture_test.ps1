# Load the PacketDotNet library
Add-Type -Path "path/to/PacketDotNet.dll"

# Set the path to your pcapng file
$pcapngFile = "path/to/your/file.pcapng"

# Set the RADIUS port number (1812 or 1813)
$radiusPort = 1812

# Initialize counters
$totalPackets = 0
$radiusPackets = 0

# Open the pcapng file
$reader = New-Object PacketDotNet.Utils.CaptureFileReader($pcapngFile)

# Iterate over each packet in the pcapng file
while ($nextPacket = $reader.ReadNext()) {
    # Check if the packet has the RADIUS protocol and is sent to or from the RADIUS port
    if ($nextPacket.HasRADIUS() -and ($nextPacket.UDP.DestinationPort -eq $radiusPort -or $nextPacket.UDP.SourcePort -eq $radiusPort)) {
        $radiusPackets++
    }
    $totalPackets++
}

# Calculate the percentage of packet loss for traffic using the RADIUS protocol
if ($totalPackets -gt 0) {
    $packetLoss = (1 - ($radiusPackets / $totalPackets)) * 100
} else {
    $packetLoss = 0
}

# Print the results
Write-Host "Total packets: $totalPackets"
Write-Host "RADIUS packets: $radiusPackets"
Write-Host "Packet loss for RADIUS traffic: $packetLoss%"