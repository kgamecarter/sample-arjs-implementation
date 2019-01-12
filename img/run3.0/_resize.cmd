cd /d %~dp0 
echo %~d1%~p1%~n1%~x1

magick.exe %~d1%~p1%~n1%~x1[0] -coalesce -resize "1200x620^" -layers "compare-any optimize optimize-plus remove-dups" -gravity center -crop "1200x620!+0+0" %~d1%~p1%~n1_ogimg.png
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_ogimg.png" "%~d1%~p1%~n1_ogimg.png"
DeflOpt.exe %~d1%~p1%~n1_ogimg.png

goto %~x1
:.gif
magick.exe %~d1%~p1%~n1%~x1 -coalesce -adaptive-resize "640x1280>" -layers "compare-any optimize optimize-plus remove-dups" %~d1%~p1%~n1_Q%~x1
gif2webp.exe -lossy -mt -m 6 -f 1 -q 31 %~d1%~p1%~n1_Q%~x1 -o %~d1%~p1%~n1_Q.webp
gifsicle.exe --colors 256 -O3 %~d1%~p1%~n1_Q%~x1 > %~d1%~p1%~n1_Q_256%~x1
gif2apng.exe -z1 %~d1%~p1%~n1_Q%~x1 %~d1%~p1%~n1_Q.png
del /f /s /q "%~d1%~p1%~n1_Q%~x1"
rename "%~d1%~p1%~n1_Q_256%~x1" "%~n1_Q%~x1"

magick.exe %~d1%~p1%~n1_Q%~x1 -coalesce -adaptive-resize "320x640>" -layers "compare-any optimize optimize-plus remove-dups" %~d1%~p1%~n1_L%~x1
gif2webp.exe -lossy -mt -m 6 -f 1 -q 31 %~d1%~p1%~n1_L%~x1 -o %~d1%~p1%~n1_L.webp
gifsicle.exe --colors 256 -O3 %~d1%~p1%~n1_L%~x1 > %~d1%~p1%~n1_L_256%~x1
gif2apng.exe -z1 %~d1%~p1%~n1_L%~x1 %~d1%~p1%~n1_L.png
del /f /s /q "%~d1%~p1%~n1_L%~x1"
rename "%~d1%~p1%~n1_L_256%~x1" "%~n1_L%~x1"

magick.exe %~d1%~p1%~n1_L%~x1 -coalesce -adaptive-resize "160x320>" -layers "compare-any optimize optimize-plus remove-dups" %~d1%~p1%~n1_M%~x1
gif2webp.exe -lossy -mt -m 6 -f 1 -q 31 %~d1%~p1%~n1_M%~x1 -o %~d1%~p1%~n1_M.webp
gifsicle.exe --colors 256 -O3 %~d1%~p1%~n1_M%~x1 > %~d1%~p1%~n1_M_256%~x1
gif2apng.exe -z1 %~d1%~p1%~n1_M%~x1 %~d1%~p1%~n1_M.png
del /f /s /q "%~d1%~p1%~n1_M%~x1"
rename "%~d1%~p1%~n1_M_256%~x1" "%~n1_M%~x1"

magick.exe %~d1%~p1%~n1_M%~x1 -coalesce -adaptive-resize "80x160>" -layers "compare-any optimize optimize-plus remove-dups" %~d1%~p1%~n1_S%~x1
gif2webp.exe -lossy -mt -m 6 -f 1 -q 31 %~d1%~p1%~n1_S%~x1 -o %~d1%~p1%~n1_S.webp
gifsicle.exe --colors 256 -O3 %~d1%~p1%~n1_S%~x1 > %~d1%~p1%~n1_S_256%~x1
gif2apng.exe -z1 %~d1%~p1%~n1_S%~x1 %~d1%~p1%~n1_S.png
del /f /s /q "%~d1%~p1%~n1_S%~x1"
rename "%~d1%~p1%~n1_S_256%~x1" "%~n1_S%~x1"
exit
:.png
:.svg
magick.exe %~d1%~p1%~n1%~x1 -resize "640x1280>" %~d1%~p1%~n1_Q.png
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_Q.png -o %~d1%~p1%~n1_Q.webp
pngquant.exe %~d1%~p1%~n1_Q.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_Q_256.png" "%~d1%~p1%~n1_Q_256.png"
DeflOpt.exe %~d1%~p1%~n1_Q_256.png

magick.exe %~d1%~p1%~n1_Q.png -resize "320x640>" %~d1%~p1%~n1_L.png
del /f /s /q "%~d1%~p1%~n1_Q.png"
rename "%~d1%~p1%~n1_Q_256.png" "%~n1_Q.png"
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_L.png -o %~d1%~p1%~n1_L.webp
pngquant.exe %~d1%~p1%~n1_L.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_L_256.png" "%~d1%~p1%~n1_L_256.png"
DeflOpt.exe %~d1%~p1%~n1_L_256.png

magick.exe %~d1%~p1%~n1_L.png -resize "160x320>" %~d1%~p1%~n1_M.png
del /f /s /q "%~d1%~p1%~n1_L.png"
rename "%~d1%~p1%~n1_L_256.png" "%~n1_L.png"
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_M.png -o %~d1%~p1%~n1_M.webp
pngquant.exe %~d1%~p1%~n1_M.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_M_256.png" "%~d1%~p1%~n1_M_256.png"
DeflOpt.exe %~d1%~p1%~n1_M_256.png

magick.exe %~d1%~p1%~n1_M.png -resize "80x160>" %~d1%~p1%~n1_S.png
del /f /s /q "%~d1%~p1%~n1_M.png"
rename "%~d1%~p1%~n1_M_256.png" "%~n1_M.png"
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_S.png -o %~d1%~p1%~n1_S.webp
pngquant.exe %~d1%~p1%~n1_S.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_S_256.png" "%~d1%~p1%~n1_S_256.png"
DeflOpt.exe %~d1%~p1%~n1_S_256.png

del /f /s /q "%~d1%~p1%~n1_S.png"
rename "%~d1%~p1%~n1_S_256.png" "%~n1_S.png"
exit
:.jpg
:.jpeg
:.tiff
:.tif
:.bmp
magick.exe %~d1%~p1%~n1%~x1 -resize "640x1280>" %~d1%~p1%~n1_Q.png
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_Q.png -o %~d1%~p1%~n1_Q.webp
pngquant.exe %~d1%~p1%~n1_Q.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_Q_256.png" "%~d1%~p1%~n1_Q_256.png"
DeflOpt.exe %~d1%~p1%~n1_Q_256.png

magick.exe %~d1%~p1%~n1_Q.png -resize "320x640>" %~d1%~p1%~n1_L.png
del /f /s /q "%~d1%~p1%~n1_Q.png"
rename "%~d1%~p1%~n1_Q_256.png" "%~n1_Q.png"
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_L.png -o %~d1%~p1%~n1_L.webp
pngquant.exe %~d1%~p1%~n1_L.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_L_256.png" "%~d1%~p1%~n1_L_256.png"
DeflOpt.exe %~d1%~p1%~n1_L_256.png


magick.exe %~d1%~p1%~n1_L.png -resize "160x320>" %~d1%~p1%~n1_M.png
del /f /s /q "%~d1%~p1%~n1_L.png"
rename "%~d1%~p1%~n1_L_256.png" "%~n1_L.png"
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_M.png -o %~d1%~p1%~n1_M.webp
pngquant.exe %~d1%~p1%~n1_M.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_M_256.png" "%~d1%~p1%~n1_M_256.png"
DeflOpt.exe %~d1%~p1%~n1_M_256.png

magick.exe %~d1%~p1%~n1_M.png -resize "80x160>" %~d1%~p1%~n1_S.png
del /f /s /q "%~d1%~p1%~n1_M.png"
rename "%~d1%~p1%~n1_M_256.png" "%~n1_M.png"
cwebp.exe -mt -af -alpha_q 72 -m 6 -f 1 -q 58 %~d1%~p1%~n1_S.png -o %~d1%~p1%~n1_S.webp
pngquant.exe %~d1%~p1%~n1_S.png --speed 1 --ext "_256.png"
zopflipng.exe -y -m --iterations=1 --splitting=1 --filters=0 --lossy_8bit "%~d1%~p1%~n1_S_256.png" "%~d1%~p1%~n1_S_256.png"
DeflOpt.exe %~d1%~p1%~n1_S_256.png

del /f /s /q "%~d1%~p1%~n1_S.png"
rename "%~d1%~p1%~n1_S_256.png" "%~n1_S.png"
exit