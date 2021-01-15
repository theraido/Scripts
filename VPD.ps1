<#
.SYNOPSIS

.DESCRIPTION 
Vapour Pressure Deficit (VPD) is a measure of the drying power of your air. With this metric you can more easily evaluate and mitigate threats of crop diseases, 
better adjust your watering or irrigation and fine-tune your nutrient concentration for all stages of growth. 

https://betterorganix.com/blog/what-is-how-to-calculate-vapour-pressure-deficit/

.EXAMPLE
VapourPressureDeficit -T 20 -RH 50
.NOTES
Written by: TheRaido
#>


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