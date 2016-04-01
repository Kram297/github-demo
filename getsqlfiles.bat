echo off

if %1.==. goto SYNTAX
if %2.==. goto SYNTAX

:GETFILES
set ver1=%1
set ver2=%2
set outputfile=sqlfiles_%ver1%_%ver2%.txt

git diff --oneline --name-only %ver1%..%ver2% -- *.sql > %outputfile%
@powershell -command "(gc ./%outputfile%).replace('.sql', '.sql') | Set-content ./%outputfile%

GOTO END

:SYNTAX
echo getsqlfiles {tag 1} {tag 2}

:END