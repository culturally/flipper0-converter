Dir *.gif | rename-item -newname { [io.path]::ChangeExtension($_.name, "png") }
Dir *.png | ForEach-Object -begin { $count=0 }  -process { rename-item $_ -NewName "frame_$count.png" ; $count++ }
$filecount = (Dir *.png).count
$frameorder = 0..($filecount - 1) -join ' '
New-Item -ItemType file -Path "meta.txt" -Force 
Add-Content -Path "meta.txt" -Value "Filetype: Flipper Animation`nVersion: 1`n`nWidth: 128`nHeight: 64`nPassive frames: $filecount`nActive frames: 0`nFrames order: $frameorder`nActive cycles: 0`nFrame rate: 6`nDuration: 3600`nActive cooldown: 0`n`nBubble slots: 0`n"
