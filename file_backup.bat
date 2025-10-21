@echo off
set source_file=C:\Users\xnem\source.txt
set backup_path=D:\bk
set backup_file=%backup_path%\bk_source.txt

echo F | xcopy /Y %source_file% %backup_file%