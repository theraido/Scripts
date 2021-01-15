
<#
.SYNOPSIS
DewPoint.ps1 
.DESCRIPTION 
Dew point is defined as the temperature at which dew will form. When the dew point equals the temperature, the relative humudity is 100%. 
Whenever the relative humidity is less than 100% the dew point is always less than the air temperature.

http://www.1728.org/dewpoint.htm

.EXAMPLE
Dewpoint -T 20 -RH 50
.NOTES
Written by: TheRaido
#>

function DewPoint {
    param (

        [Alias("Temperature")]
        [Parameter(Mandatory=$true)]
        [double]$T,
        [Alias("RelativeHumidity","Humidity")]
        [Parameter(Mandatory=$true)]
        [double]$RH

    )
    $N = ([Math]::Log($RH/100) + (17.27*$T) / (237.3 + $T))/17.27
    $D = (237.3 * $N) /(1 -$N)
    return $D
}