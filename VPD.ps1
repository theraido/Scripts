#VPDCalc https://betterorganix.com/blog/what-is-how-to-calculate-vapour-pressure-deficit/

$T = "15"
$RH = "70"
$VPSat = (610.7 * [Math]::Pow(10,(7.5*$T)/(237.3+$T))/1000)
$VPPair = (610.7 * [Math]::Pow(10,(7.5*$T)/(237.3+$T))/1000) * ($RH/100)
$VPD = $VPSat - $Vppair
$VPD