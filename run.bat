@echo off

cls

rem echo SETTING......

set PROCESSING="D:\processing\processing-3.4\processing-java.exe"

rem echo set FINISHED

del /s output/

%PROCESSING% --sketch="%cd%/src" --output="%cd%/output/" --force --run

echo run