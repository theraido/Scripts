$files = Get-ChildItem -Path /home/hharmsel/Videos/tiktak/* -Include *.mp4
$files | ForEach-Object{

    scenedetect -i $_.Name detect-content save-images -o /home/hharmsel/Videos/tiktak/scenes/ export-html split-video -o /home/hharmsel/Videos/tiktak/split/

}