cd /d %~dp0 
echo %~d1%~p1%~n1%~x1
goto %~x1
:.png
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1.png" "%~d1%~p1%~n1.png"
DeflOpt.exe %~d1%~p1%~n1.png
exit