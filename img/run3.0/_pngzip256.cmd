cd /d %~dp0 
echo %~d1%~p1%~n1%~x1
goto %~x1
:.png
pngquant.exe %~d1%~p1%~n1.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_256.png" "%~d1%~p1%~n1_256.png"
DeflOpt.exe %~d1%~p1%~n1_256.png
del /f /s /q "%~d1%~p1%~n1.png"
rename "%~d1%~p1%~n1_256.png" "%~n1.png"
exit