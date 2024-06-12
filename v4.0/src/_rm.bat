@echo off
:rm_loop
if "%1" == "" goto rm_brk
for %%f in (%1) do if exist %%f del %%f
shift
goto rm_loop
:rm_brk
