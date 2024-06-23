;	SCCSID = @(#)comsw.asm	1.1 85/05/14
;	SCCSID = @(#)comsw.asm	1.1 85/05/14

TRUE		EQU	0FFFFh	;lpproj;
FALSE		EQU	0	;lpproj;

;lpproj; build "DOS generic" JAPAN version of command.com
IBMVER		EQU	FALSE	;lpproj;
MSVER		EQU	TRUE	;lpproj;
INTERNAT	EQU	TRUE	;lpproj;
JAPAN		EQU	TRUE	;lpproj;
KOREA		EQU	FALSE	;lpproj;
$CP_DEFAULT = 932		;lpproj;

VER_RELAXED	EQU	TRUE	;lpproj;

include version.inc
include versiona.inc		;lpproj;

$FOR_IBMPC = not 0		;lpproj; (not used for now)
$FOR_NEC98 = not 0		;lpproj; (not used for now)

