@echo off
set err_rebuild=

rem cleaning...

if exist COMMAND.COM del COMMAND.COM
if exist COMMAND.MAP del COMMAND.MAP
if exist COMMAND.CTL del COMMAND.CTL
del COMMAND.CL*
del *.OBJ

rem build the message...

if exist ..\..\MESSAGES\USA-MS.IDX goto bld
cd ..\..\MESSAGES
nmake
if errorlevel 1 set err_rebuild=1
cd ..\CMD\COMMAND
if not x%err_rebuild% == x goto exit

:bld
rem build COMMAND.COM ...

nmake
if errorlevel 1 set err_rebuild=1

:exit
if not x%err_rebuild%x == xx echo something goes wrong...

