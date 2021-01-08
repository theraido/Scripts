. .\VPD.ps1
#outsidehumidity
#insidehumidity
#outsidetemperature
#insidetemperature

# measure inside temperature and humidity, calculate VPD based on this information. If the VPD is not inside preffered ranges for the specified vegetables check outside temperature and humidity. VPD below preffered range and humidity is outside higher, increase humidity by starting airflow from outside to inside. If VPD above preffered range and humidity is outside higher start airflow from inside to outside.
$testvpd = $(VapourPressureDeficit -T 15 -RH 20)
$vegetables = Get-Content ./vegetablespecs.json | ConvertFrom-Json

$vegetables | ForEach-Object {
    if ($testvpd -le $_.vpd_low) {
        $testvpd
        $_.vpd_low
        Write-host  $_.vegetable "to low" 
        }
        
        if ($testvpd -ge $_.vpd_high) {
            $_.vpd_high
            Write-host  $_.vegetable "to high"
            }
} 

