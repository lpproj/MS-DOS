# building command.com on Windows (compliant with x64)
#
# my build tools:
#  ml.exe	MASM 6.13.8204 (included in VC++ for Python 2.7)
#  tlink.exe	Borland Turbo Linker 3.01 (in Turbo C++ 1.01)
#  msdos.exe	MS-DOS Player (http://takeda-toshiya.my.coocan.jp/msdos/index.html)

.SUFFIXES:
.SUFFIXES: .com .exe .obj .asm

RM_F=del /F /Q
#RM_F=deltree /Y
#RM_F=rm -f

# MASM 6.13.8204 (ml.exe)
AS=ml
ASFLAGS=-Cu -nologo -Zm
.asm.obj:
	$(AS) -c $(ASFLAGS) -Fo$@ $<

# MASM 5.10
#AS=msdos masm.exe
#ASFLAGS=/Mu /DDOSMACV2
#.asm.obj:
#	$(AS) $(ASFLAGS) $<,$@;

# Borland tlink 3.01 (tc++1.01)
LD=msdos tlink.exe
LDFLAGS=/t
# Microsoft link (3.65)
#LD=msdos link.exe
#LDFLAGS=/tiny

OBJS= command.obj rucode.obj rdata.obj init.obj uinit.obj tcode.obj tcode2.obj tcode3.obj tcode4.obj tcode5.obj tucode.obj copy.obj copyproc.obj cparse.obj tdata.obj tspc.obj

all: command.com

clean:
	-$(RM_F) command.com
	-$(RM_F) *.obj *.lst *.map

command.com: $(OBJS) COMLINK
	$(LD) $(LDFLAGS) @COMLINK

# for openwatcom linker wlink
# Unfortunately. the COMMAND.COM produced directly by wlink is courrupt, 
# so you should use external something exe2bin-like tool to convert the EXE to the COM.
#
#command.com: $(OBJS)
#	wlink form dos op quiet op nocase op nod file { $(OBJS) }
#	msdos exe2bin COMMAND.EXE COMMAND.COM

command.obj: command.asm

rucode.obj: rucode.asm

rdata.obj: rdata.asm

init.obj: init.asm

uinit.obj: uinit.asm

tcode.obj: tcode.asm

tcode2.obj: tcode2.asm

tcode3.obj: tcode3.asm

tcode4.obj: tcode4.asm

tcode5.obj: tcode5.asm

tucode.obj: tucode.asm

copy.obj: copy.asm

copyproc.obj: copyproc.asm

cparse.obj: cparse.asm

tdata.obj: tdata.asm

tspc.obj: tspc.asm

