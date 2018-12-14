@echo off

cls
set PROCESSING="D:\processing\processing-3.4\processing-java.exe"

rem del /s output/

%PROCESSING% --sketch="%cd%/" --output="%cd%/output/" --force --run