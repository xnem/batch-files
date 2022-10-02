@echo off

setlocal enabledelayedexpansion


set /p drive="保存先ドライブを入力してください。(cやdなど) >>>"
set /p yn_check="%drive%:/radio/kinyouに保存します。(y/n) >>>"
IF %yn_check:Y=Y%==Y (
	echo ドライブ存在チェックをします。
) ELSE (
	echo y^(Y^)以外が入力されたため、保存せず終了します。
	pause
	exit
)

If exist %drive%:\ (
	echo 保存を開始します。
) ELSE (
	echo %drive%ドライブが存在しないため、保存せず終了します。
	pause
	exit
)

If not exist %drive%:\radio\kinyou mkdir %drive%:\radio\kinyou

for /l %%a in (0, 1, 104) do (
	set /a count=%%a+1
	bitsadmin /transfer download https://omocoro.heteml.net/radio/sebu-nagata/!count!kaime.mp3 %drive%:\radio\kinyou\!count!kaime.mp3
)

rem 105回からURLが異なる
for /l %%a in (104, 1, 250) do (
	set /a count=%%a+1
	bitsadmin /transfer download https://omocoro.heteml.net/radio/sebu-nagata/!count!kaime/!count!kaime.mp3 %drive%:\radio\kinyou\!count!kaime.mp3
)