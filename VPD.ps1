#VPDCalc https://betterorganix.com/blog/what-is-how-to-calculate-vapour-pressure-deficit/
function VapourPressureDeficit {
    param (

        [Alias("Temperature")]
        [Parameter(Mandatory=$true)]
        [double]$T,
        [Alias("RelativeHumidity","Humidity")]
        [Parameter(Mandatory=$true)]
        [double]$RH

    )
    $VPSat = (610.7 * [Math]::Pow(10,(7.5*$T)/(237.3+$T))/1000)
    $VPPair = (610.7 * [Math]::Pow(10,(7.5*$T)/(237.3+$T))/1000) * ($RH/100)
    $VPD = $VPSat - $Vppair
    return $VPD    
}