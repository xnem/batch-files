@echo off

setlocal enabledelayedexpansion


set /p drive="�ۑ���h���C�u����͂��Ă��������B(c��d�Ȃ�) >>>"
set /p yn_check="%drive%:/radio/kinyou�ɕۑ����܂��B(y/n) >>>"
IF %yn_check:Y=Y%==Y (
	echo �h���C�u���݃`�F�b�N�����܂��B
) ELSE (
	echo y^(Y^)�ȊO�����͂��ꂽ���߁A�ۑ������I�����܂��B
	pause
	exit
)

If exist %drive%:\ (
	echo �ۑ����J�n���܂��B
) ELSE (
	echo %drive%�h���C�u�����݂��Ȃ����߁A�ۑ������I�����܂��B
	pause
	exit
)

If not exist %drive%:\radio\kinyou mkdir %drive%:\radio\kinyou

for /l %%a in (0, 1, 104) do (
	set /a count=%%a+1
	bitsadmin /transfer download https://omocoro.heteml.net/radio/sebu-nagata/!count!kaime.mp3 %drive%:\radio\kinyou\!count!kaime.mp3
)

rem 105�񂩂�URL���قȂ�
for /l %%a in (104, 1, 250) do (
	set /a count=%%a+1
	bitsadmin /transfer download https://omocoro.heteml.net/radio/sebu-nagata/!count!kaime/!count!kaime.mp3 %drive%:\radio\kinyou\!count!kaime.mp3
)