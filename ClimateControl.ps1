. .\VPD.ps1

#test variables go here
$outsidehumidity = 78
$outsidetemperature = 2
$insidehumidity = 20
$insidetemperature = 15

# measure inside temperature and humidity, calculate VPD based on this information. If the VPD is not inside preffered ranges for the specified vegetables check outside temperature and humidity. VPD below preffered range and humidity is outside higher, increase humidity by starting airflow from outside to inside. If VPD above preffered range and humidity is outside higher start airflow from inside to outside.
$insidetestvpd = $(VapourPressureDeficit -T $insidetemperature -RH $insidehumidity)
$outsidetestvpd = $(VapourPressureDeficit -T $outsidetemperature -RH $outsidehumidity)
$vegetables = Get-Content ./vegetablespecs.json | ConvertFrom-Json

$vegetables[0] | ForEach-Object {
    if ($insidetestvpd -le $_.vpd_low) {
        Write-host  $_.vegetable "vpd inside:" $insidetestvpd "to low. Min vpd: $($_.vpd_low)"
        }
        
        if ($insidetestvpd -ge $_.vpd_high) {
                        Write-host  $_.vegetable "vpd inside:" $insidetestvpd "to high. Max vpd: $($_.vpd_high)"
            }
}

$vegetables[0] | ForEach-Object {
    if ($outsidetestvpd -le $_.vpd_low) {
                Write-host  $_.vegetable "vpd outside:" $outsidetestvpd "to low. Min vpd: $($_.vpd_low)"
        }
        
        if ($outsidetestvp -ge $_.vpd_high) {
            
            Write-host  $_.vegetable "vpd outside:" $outsidetestvpd "to high. Max vpd: $($_.vpd_high)"
            }
}