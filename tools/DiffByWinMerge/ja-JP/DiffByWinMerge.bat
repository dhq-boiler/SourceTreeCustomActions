
REM
REM			DiffByWinMerge.bat
REM			created by @dhq_boiler
REM
REM 		%1 : リポジトリのパス
REM 		%2 : 指定されたハッシュ値
REM 		%3 : 対象ファイル
REM

chcp 65001

if %2==-1 (

PowerShell -command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"未コミットの diff は SorceTree で確認してください。\", 'DiffByWinMerge', 'OK', 'Warning');exit $result;"

exit

) 

git checkout %2 %3

set p1=%1\%3

more %p1:/=\% > %1\after.txt

setlocal
for /f "usebackq delims=" %%A in (` git rev-list -1 %2^^ -- %3 `) do set HASH=%%A

git checkout %HASH%^^ %3

more %p1:/=\% > %1\before.txt

"C:\Program Files\WinMerge\WinMergeU.exe" %1\before.txt %1\after.txt

git checkout HEAD %3

del %1\before.txt
del %1\after.txt

exit