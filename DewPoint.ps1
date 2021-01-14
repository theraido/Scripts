#Dew point is defined as the temperature at which dew will form. When the dew point equals the temperature, the relative humudity is 100%. Whenever the relative humidity is less than 100% the dew point is always less than the air temperature.

function DewPoint {
    param (

        [Alias("Temperature")]
        [Parameter(Mandatory=$true)]
        [double]$T,
        [Alias("RelativeHumidity","Humidity")]
        [Parameter(Mandatory=$true)]
        [double]$RH

    )
    $dewpoint = $T - ((100 - $RH)/5.)
    return $dewpoint
}

DewPoint -T 20 -RH 50

function DewPoint2 {
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

DewPoint2 -T 20 -RH 50