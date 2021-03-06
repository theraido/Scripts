param(
    [Parameter(Mandatory=$TRUE, HelpMessage="What to spell fool!")]
    [string]$this)

Add-Type -AssemblyName System.speech
$tts = New-Object System.Speech.Synthesis.SpeechSynthesizer
$tts.Rate   = 0  # -10 is slowest, 10 is fastest

$PSScriptRoot
$nato = @{"A"="Alpha"; "B"="Bravo"; "C"="Charlie"; "D"="Delta"; "E"="Echo"; "F"="Foxtrot"; "G"="Golf"; "H"="Hotel"; "I"="India"; "J"="Juliet"; "K"="Kilo"; "L"="Lima"; "M"="Mike"; "N"="November"; "O"="Oscar"; "P"="Papa"; "Q"="Quebec"; "R"="Romeo"; "S"="Sierra"; "T"="Tango"; "U"="Uniform"; "V"="Victor"; "W"="Whiskey"; "X"="X-ray"; "Y"="Yankee"; "Z"="Zulu"}
$natojson = Invoke-WebRequest -Uri https://gist.githubusercontent.com/zekesonxx/8fa351cf7cec21fe7c43/raw/0d9a416c3f1ceeef4859293e166f9fdab65c64ca/nato.json | ConvertFrom-Json
$line = @()
function Spell([string]$me) {
    $spellme = $me.ToCharArray()
    $spellme | ForEach-Object {
        $line += $nato.Get_Item("$_")
        }   
    [string]$line
    $tts.Speak([string]$line)
}
Spell($this)