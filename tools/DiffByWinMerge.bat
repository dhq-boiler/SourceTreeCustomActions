
REM %1 : リポジトリのパス
REM %2 : 指定したsha
REM %3 : ファイル

chcp 65001

if %2==-1 (

msg %username% /W 未コミットのdiffは確認できません。

exit

) 

git checkout %2 %3

set p1=%1\%3

more %p1:/=\% > %1\after.txt

setlocal
for /f "usebackq delims=" %%A in (` git rev-list -1 %2^^ -- %3 `) do set HOGE=%%A

git checkout %HOGE%^^ %3

more %p1:/=\% > %1\before.txt

"C:\Program Files\WinMerge\WinMergeU.exe" %1\before.txt %1\after.txt

git checkout HEAD %3

del %1\before.txt
del %1\after.txt

exit