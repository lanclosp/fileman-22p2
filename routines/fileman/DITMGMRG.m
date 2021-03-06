DITMGMRG	;SFISC/EDE(OHPRD)-RELINK/MERGE TWO ENTRIES BELOW POINTED TO FILE ;8MAR2006
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	; Merge two entries below pointed to file.  See ^DITMDOC.
	;
START	;
	D ^DITMGM1
	I 'DITMGMRG("GO") D EOJ K DITMGMRG Q
	D EN
	K DITMGMRG
	Q
	;
EN	; EXTERNAL ENTRY POINT
	D INIT^DITMGMRI
	Q:$D(DITMGMQF)
	D STACK
	S:$D(DITMGMRG("NOTALK")) DITMGM2("NOTALK")=1
	D ^DITMGM2 K DITMGM2("NOTALK")
	K ^UTILITY("DITMGMRG",$J)
	W:'$D(DITMGMRG("NOTALK")) !!,"Merge complete",!!
	D EOJ
	Q
	;
STACK	;STACK ALL FILES POINTING TO POINTED TO FILE AND IF .01 FIELD
	;POINTING AND DINUM, FILES POINTING TO POINTING FILE, AND SO ON.
	;
	W:'$D(DITMGMRG("NOTALK")) !!,"Gathering files and checking 'PT' nodes"
	NEW DITMGFLE,DITMGPFL,DITMGPFD,DITMSKP
	K ^UTILITY("DITMGMRG",$J)
	S DITMGFLE=DITMGMRG("FILE")
	D FILES
	Q
	;
FILES	; CALLED RECURSIVELY
	D PTCHK
	F DITMGPFL=0:0 S DITMGPFL=$O(^DD(DITMGFLE,0,"PT",DITMGPFL)) Q:DITMGPFL'=+DITMGPFL  D  I 'DITMSKP D FIELDS
	. S DITMSKP=0
	. I $D(DITMGMRG("EXCLUDE",DITMGPFL)) S DITMSKP=1 Q
	. ;I DITMGFLE=DITMGPFL S DITMSKP=1 Q
	. Q:'$D(DITMGMRG("PACKAGE"))
	. I DITMGMRG("PACKAGE") S:'$D(DITMGMRG("PACKAGE",DITMGPFL)) DITMSKP=1 Q
	. Q
	Q
	;
FIELDS	;
	;W:'$D(DITMGMRG("NOTALK")) "f"
	F DITMGPFD=0:0 S DITMGPFD=$O(^DD(DITMGFLE,0,"PT",DITMGPFL,DITMGPFD)) Q:DITMGPFD'=+DITMGPFD  D
IHS	. I DITMGPFL=2,DITMGPFD=.082 Q   ;NEW LINE
	. S ^UTILITY("DITMGMRG",$J,DITMGPFL,DITMGPFD)=DITMGFLE
	. ;W:'$D(DITMGMRG("NOTALK")) $S($D(^DD(DITMGPFL,0,"UP")):"s",1:".")
	. I DITMGPFD=.01,'$D(^DD(DITMGPFL,0,"UP")),$P(^DD(DITMGPFL,.01,0),U,5,99)["DINUM" D RECURSE
	Q
	;
RECURSE	;
	;W:'$D(DITMGMRG("NOTALK")) "d"
	NEW DITMGFLE
	S DITMGFLE=DITMGPFL
	NEW DITMGPFL,DITMGPFD
	D FILES
	Q
	;
PTCHK	; MAKE SURE "PT" CORRECT
	I '$D(DITMGMRG("NOTALK")) ;W $S(DITMGMRG("FILE")=DITMGFLE:"",1:"[")
	E  S DITMU4("NOTALK")=1
	S DITMU4FI=DITMGFLE
	F DITMU4PF=0:0 S DITMU4PF=$O(^DD(DITMU4FI,0,"PT",DITMU4PF)) Q:DITMU4PF=""  F DITMU4PD=0:0 S DITMU4PD=$O(^DD(DITMU4FI,0,"PT",DITMU4PF,DITMU4PD)) Q:DITMU4PD=""  D CHKIT^DITMU4
	K DITMU4FI,DITMU4L,DITMU4PF,DITMU4PD,DITMU4X,DITMU4("NOTALK")
	;I DITMGMRG("FILE")'=DITMGFLE,'$D(DITMGMRG("NOTALK")) W "]"
	Q
	;
EOJ	;
	K X,Y
	K %,DIPGM
	I $D(DITMGMQF) S DITMGMRG("QFLG")=DITMGMQF
	K DITMGMF,DITMGMFG,DITMGMFL,DITMGMQF,DITMGMT
	K AUPNDAYS,AUPNDOB,AUPNDOD,AUPNPAT,AUPNSEX
	I $D(ZTQUEUED) S ZTREQ="@" Q
	I $D(ZTSK) K ^%ZTSK(ZTSK),ZTSK Q  ; old Kernel
	I '$D(DITMGMRG("NOTALK")),$D(DITMGMRG("ERROR")) D EOJ2 K DITMGMRG("ERROR")
	Q
	;
EOJ2	; List errors
	W !!,"The following errors occurred during the merge: ",!
	F %=0:0 S %=$O(DITMGMRG("ERROR",%)) Q:%'=+%  W !,DITMGMRG("ERROR",%)
	W !
	K %
	Q
