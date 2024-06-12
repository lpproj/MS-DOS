if "%1" == "" goto cs_exit
if not exist %1\MAKEFILE goto cs_exit
cd %1
for %%f in (*.obj) do del %%f
if exist %1.CTL del %1.CTL
for %%f in (%1.cl*) do del %%f
if exist %1.MAP del %1.MAP
if exist %1.EXE del %1.EXE
if exist %1.COM del %1.COM

:cs_loop
shift
if "%1" == "" goto cs_brk
for %%f in (%1) do if exist %%f del %%f
goto cs_loop

:cs_brk
cd ..

:cs_exit
