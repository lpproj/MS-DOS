IFE DBCS

	%out ..filesize.inc

BIOS_SIZE	equ	 35000		;actually
DOS_SIZE	equ	 37000		;actually

ELSE

	%out ..filesize.inc (MS-DOS DBCS)

BIOS_SIZE	equ	 33364		;actually
DOS_SIZE	equ	 38832		;actually

ENDIF
