﻿$ipaddr = "139.130.4.5"
$timestamp = Get-Date -Format "MM-dd-yyyyTHH-mm-ssZzzz"

echo $timestamp

Start-Transcript -Path ".\network-test-$timestamp.txt"
$result = Test-NetConnection -ComputerName $ipaddr -t

echo "----------"
echo "Route to $ipaddr`:"
echo "----------"
tracert $ipaddr

$i = 1
$j = $result.TraceRoute.Count

echo "`n----------"
echo "Ping results for each step of route"
echo "----------"

foreach ($item in $result.TraceRoute) {
    
    echo "`n----------"
    echo "step $i of $j"
    echo "----------"
    ping $item
    $i = $i + 1

}

Stop-Transcript 