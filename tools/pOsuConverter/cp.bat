@echo off

cls

echo COMPILING...

g++ main.cpp poct.cpp -o %1.exe

echo FINISH

if %ERRORLEVEL% EQU 0 (
	%1 -i %2.txt -o %3.txt
)
