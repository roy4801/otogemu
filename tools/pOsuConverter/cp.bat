@echo off

cls

echo COMPILING...

g++ %1.cpp -o %1.exe

echo FINISH

if %ERRORLEVEL% EQU 0 (

	%1 -i %1 -o %1
)
