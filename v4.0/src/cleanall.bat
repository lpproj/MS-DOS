@echo off

rem -----------------------------------
rem  for MS-DOS 4.0 (or later) COMMAND.COM
rem  or Windows CMD.EXE
rem
rem  NOTE: The MS-DOS help says,
rem        "The GOTO command uses only the first eight characters of a label"
rem -----------------------------------

rem Check "Out of environment space" at first
set cleandir=CLEANALL
if not "%cleandir%" == "CLEANALL" goto exit

set cleandir=

rem DOSBox built-in command.com does not support `for' command
if "%COMSPEC%" == "Z:\COMMAND.COM" goto dosbox

if exist _rm.bat goto c_begin
echo wrong directory.
goto exit


rem -----------------------------------
:c_begin

:c_messages
:c_msg
set cleandir=MESSAGES
if not exist %cleandir%\makefile goto c_msg_end
echo cleaning %cleandir%
cd %cleandir%
call ..\_rm.bat *.idx
rem git restore USA-MS.MSG
cd ..
:c_msg_end

:c_mapper
:c_mpr
set cleandir=MAPPER
if not exist %cleandir%\makefile goto c_mpr_end
echo cleaning %cleandir%
cd %cleandir%
call ..\_rm.bat *.obj mapper.lib mapper.bak mapper.lst
cd ..
:c_mpr_end

:c_inc
set cleandir=INC
echo cleaning %cleandir%
if not exist %cleandir%\makefile goto c_inc_end
cd %cleandir%
call ..\_rm.bat cds.obj const2.obj dpb.obj errtst.obj nibdos.obj
call ..\_rm.bat msdata.obj msdosme.obj mstable.obj sysvar.obj
call ..\_rm.bat kstring.obj
cd ..
:c_inc_end

:c_boot
:c_bt
set cleandir=BOOT
echo cleaning %cleandir%
if not exist %cleandir%\makefile goto c_bt_end
cd %cleandir%
call ..\_rm.bat *.obj boot.cl*
call ..\_rm.bat msboot.exe msboot.bin
cd ..
:c_bt_end

:c_bios
:c_bio
set cleandir=BIOS
echo cleaning %cleandir%
if not exist %cleandir%\makefile goto c_bio_end
cd %cleandir%
call ..\_rm.bat *.obj msbio.cl*
call ..\_rm.bat msload.exe msload.map msload.com
call ..\_rm.bat msbio.exe msbio.map msbio.bin io.sys
cd ..
:c_bio_end

:c_dos
set cleandir=DOS
echo cleaning %cleandir%
if not exist %cleandir%\makefile goto c_dos_end
cd %cleandir%
call ..\_rm.bat *.obj msdos.cl*
call ..\_rm.bat msdos.exe msdos.map msdos.sys
cd ..
:c_dos_end


rem -----------------------------------
:c_cmd
rem CMD
if not exist CMD\makefile goto c_cmd_end
cd CMD

set cleandir=COMMAND
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=ATTRIB
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=ASSIGN
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=CHKDSK
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=DEBUG
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=EDLIN
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=EXE2BIN
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=FIND
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=FC
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%
call ..\_rm.bat ..\INC\kstring.obj

set cleandir=FORMAT
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% boot.cl*

set cleandir=JOIN
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=MORE
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=PRINT
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=RECOVER
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=SORT
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=SUBST
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=SYS
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=SHARE
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=NLSFUNC
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=IFSFUNC
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% msdos.cl*

set cleandir=MEM
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=FILESYS
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=BACKUP
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=COMP
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=DISKCOMP
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=DISKCOPY
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=FDISK
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%
cd %cleandir%
call ..\..\_rm.bat fdiskm.c fdisk5.cl*
call ..\..\_rm.bat fdboot.inc fdboot.exe fdboot.map fdboot.bin
cd ..

set cleandir=LABEL
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%
cd %cleandir%
call ..\..\_rm.bat labl.ctl labl.cl*
cd ..

set cleandir=MODE
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=RESTORE
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=TREE
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=REPLACE
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=XCOPY
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=GRAFTABL
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=FASTOPEN
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=APPEND
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=GRAPHICS
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

set cleandir=KEYB
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir%

:c_cmd_brk
cd ..
:c_cmd_end


rem -----------------------------------
:c_dev
rem DEV
if not exist DEV\makefile goto c_dev_end
cd DEV

set cleandir=COUNTRY
echo cleaning %cleandir%
call ..\_rm.bat %cleandir%\*.obj %cleandir%\mkcntry.exe %cleandir%\country.sys

set cleandir=ANSI
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% ansi.sys

set cleandir=KEYBOARD
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% keyboard.sys

set cleandir=DISPLAY
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% display.sys ega\*.obj ega\ega.cpi lcd\*.obj lcd\lcd.cpi

set cleandir=PRINTER
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% printer.sys
call ..\_rm.bat %cleandir%\5202\*.obj %cleandir%\5202\5202.cpi

set cleandir=DRIVER
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% driver.sys

set cleandir=RAMDRIVE
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% ramdrive.sys ramdrive.map ramdrive.map-map

set cleandir=SMARTDRV
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% smartdrv.sys

set cleandir=XMA2EMS
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% xma2ems.sys

set cleandir=VDISK
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% vdisk.sys

set cleandir=XMAEM
echo cleaning %cleandir%
call ..\cleansub.bat %cleandir% xmaem.sys

:c_dev_brk
cd ..
:c_dev_end


rem -----------------------------------
:c_sel
rem SELECT
set cleandir=SELECT
if not exist %cleandir%\makefile goto c_sel_end
echo cleaning %cleandir%
call cleansub.bat %cleandir% sstub.exe
cd %cleandir%
call ..\_rm.bat services.lib services.bak
call ..\_rm.bat select.dat sel-pan.exe sel-pan.map sel-pan.dat
call ..\_rm.bat panel.inf select.hlp
:c_sel_brk
cd ..
:c_sel_end


rem -----------------------------------
:c_memm0
:c_m0
rem MEMM
set cleandir=MEMM
if not exist %cleandir%\makefile goto c_m0_end
cd MEMM

set cleandir=EMM
if not exist %cleandir%\makefile goto c_emm_end
echo cleaning %cleandir%
cd %cleandir%
call ..\..\_rm.bat emmlib.lib *.obj *.lst *.cod
:c_emm_brk
cd ..
:c_emm_end

:c_memm
:c_em3
set cleandir=MEMM
if not exist %cleandir%\makefile goto c_em3_end
echo cleaning %cleandir%
cd %cleandir%
call ..\..\_rm.bat *.obj *.lst *.cod
call ..\..\_rm.bat emm386.exe emm386.map emm386.sys
:c_em3_brk
cd ..
:c_em3_end

:c_m0_brk
cd ..
:c_m0_end


set cleandir=
goto noerr

rem -----------------------------------
:dosbox
echo ERROR: cleanall will not work with DOSBox built-in COMMAND.COM
echo (Use external COMMAND.COM)
goto exit

:err
echo something goes wrong in %cleandir%

:noerr
:exit
