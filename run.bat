@echo off

cls
set PROCESSING="C:\processing3.4\processing-3.4\processing-java.exe"

rem del /s output/

%PROCESSING% --sketch="%cd%/src" --output="%cd%/output/" --force --run