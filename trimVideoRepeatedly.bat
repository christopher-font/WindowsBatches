setlocal enabledelayedexpansion
set /p source="Input source file: "
set /p timeAmount="Input Amount of Time between cuts (in mins): "
set /p loopAmount="Input Amount of videos + 1: "
set /A timeAmount = %timeAmount% * 60
set /A startVidTime=0

for /L %%i IN (0, 1, %loopAmount%) DO (
	set /A startVidTime=%timeAmount%*%%i
	::If having issues with ffmpeg switch ffmpeg with the location of ffmpeg.exe or whatever
	::I'm tired.
	ffmpeg -i %source% -ss !startVidTime! -t %timeAmount% -c:v copy -c:a copy %source%-%%i.mp4
	)
ENDLOCAL

