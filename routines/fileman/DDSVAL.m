DDSVAL	;SFISC/MKO-GET,PUT FOR DD IELDS ;2OCT2003
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
GET(DDSFILE,DA,DDSFLD,DDSER,DDSPARM)	;Get value for file/field
	N DDP,DIE,DDSANS,DDSTMP,X
	N DDSVDA,DDSVDDL0,DDSVDL,DDSVDV,DDSVND,DDSVPC,DIERR
	;
	S DDSANS=""
	I $G(DDSPARM)'["I",$G(DDSPARM)'["E" S DDSPARM=$G(DDSPARM)_"I"
	;
	D GDIE() G:$G(DIERR) GETQ G:'$G(DDSVDA) GETQ
	;
	I DDSFLD[":",$$FIND^DDSLIB(DDSFLD,":") D  G GETQ
	. S DDSANS=$$REL^DDSVALM(DDP,.DA,DDSFLD,DDSPARM)
	;
	S DDSFLD=$$FIELD(DDP,DDSFLD) G:$G(DIERR) GETQ
	;
	S:$D(DDSREFT)#2 DDSTMP=$NA(@DDSREFT@("F"_DDP,DDSVDA,DDSFLD))
	I $D(DDS),$D(DDSREFT)#2,$D(@DDSTMP@("D")) D
	. I $D(@DDSTMP@("M")),'^("M") D  Q
	.. S DDSANS=$NA(^TMP("DDSWP",$J,DDP,DDSVDA,DDSFLD))
	.. M @DDSANS=@DDSTMP@("D")
	. S DDSANS=$G(@DDSTMP@("D")) I DDSPARM["E",$D(^("X"))#2 S DDSANS=^("X")
	E  D
	. D GNDPC Q:$G(DIERR)
	. I DDSVPC=0,DDSVDV["W" D GETWP^DDSVALM Q
	. S DDSANS=$$GVAL(DIE,DA,DDSVND,DDSVPC)
	. I DDSPARM["E" S DDSANS=$$EXTERNAL^DILFD(DDP,DDSFLD,"",DDSANS)
	;
GETQ	D:$G(DIERR) ERR^DDSVALM("$$GET^DDSVAL")
	Q DDSANS
	;
PUT(DDSFILE,DA,DDSFLD,DDSVAL,DDSER,DDSPARM)	;Put value for file/field
	N DDP,DDSVDA,DDSV0,DDSV02,DDSVDL,DIE
	N DIERR
	;
	S:$D(DDSVAL)[0 DDSVAL=""
	I $G(DDSPARM)'["I",$G(DDSPARM)'["E" S DDSPARM=$G(DDSPARM)_"E"
	;
	D GDIE($D(DDS)#2) G:$G(DIERR) PUTQ G:'$G(DDSVDA) PUTQ
	S DDSFLD=$$FIELD(DDP,DDSFLD) G:$G(DIERR) PUTQ
	I DDSFLD=.01,"@"[DDSVAL D BLD^DIALOG(3086) G PUTQ
	;
	S DDSV0=^DD(DDP,DDSFLD,0),DDSV02=$P(DDSV0,U,2)
	I +DDSV02 D
	. D MULT^DDSVALM
	E  D VALPUT
	;
PUTQ	D:$G(DIERR) ERR^DDSVALM("PUT^DDSVAL")
	Q
	;
VALPUT	;Validate and put
	N DDSVY
	I DDSPARM["E" D
	. D VAL^DIE(DDP,DDSVDA,DDSFLD,"ER",DDSVAL,.DDSVY)
	E  D
	. D AUXVAL^DIEV(DDP,DDSVDA,DDSFLD,"EIR",DDSVAL,.DDSVY,DDSV0,DDSV02)
	Q:$G(DIERR)
	I DDSVY=DDSVY(0),'$D(@DDSREFT@("F"_DDP,DDSVDA,DDSFLD,"X")) K DDSVY(0)
	;
	I $D(DDS) D
	. S:'$D(@DDSREFT@("F"_DDP,DDSVDA,DDSFLD)) ^("GL")=DIE
	. D UPDATE(DDP,DDSVDA,.DA,DDSFLD,DDSPG,.DDSVY)
	. S DDSCHG=1
	E  D
	. N DDSFDA
	. S DDSFDA(DDP,DDSVDA,DDSFLD)=DDSVY
	. D FILE^DIE("","DDSFDA")
	Q
	;
UPDATE(DDP,DDSVDA,DA,FLD,PG,Y)	;Store value, repaint
	N DX,DY,BK,DDO,LEN,EXT,PAGE,RJ,REP,VAL
	S (EXT,@DDSREFT@("F"_DDP,DDSVDA,FLD,"D"))=Y,^("F")=3 S:$D(Y(0))#2 (EXT,^("X"))=Y(0)
	;
	D:FLD=.01
	. S PAGE=0 F  S PAGE=$O(@DDSREFS@("F"_DDP,FLD,"L",PAGE)) Q:'PAGE  D
	.. S BK=0 F  S BK=$O(@DDSREFS@("F"_DDP,FLD,"L",PAGE,BK)) Q:'BK  D
	... D:$P($G(@DDSREFS@(PAGE,BK)),U,8)
	.... N DDSPTB S DDSPTB=$G(@DDSREFS@(PAGE,BK,"PTB"))
	.... D:DDSPTB]"" RPF^DDS7(DDP,DDSPTB,DDSVDA,.DA)
	;
	S BK=0 F  S BK=$O(@DDSREFS@("F"_DDP,FLD,"L",PG,BK)) Q:'BK  D
	. S DDO=0 F  S DDO=$O(@DDSREFS@("F"_DDP,FLD,"L",PG,BK,DDO)) Q:'DDO  D
	.. S LEN=$G(@DDSREFS@(PG,BK,DDO,"D")) Q:LEN=""
	.. S DY=+LEN,DX=$P(LEN,U,2),RJ=$P(LEN,U,10),LEN=$P(LEN,U,3)
	.. S REP=$P($G(@DDSREFS@(PG,BK)),U,7)
	.. I $G(REP) D  Q:DY=""
	... N SN,PDA,OFS
	... S PDA=$G(@DDSREFT@(PG,BK)) I 'PDA S DY="" Q
	... S REP=$P($G(@DDSREFT@(PG,BK,PDA)),U,2,999) I REP="" S DY="" Q
	... S SN=$G(@DDSREFT@(PG,BK,PDA,"B",DDSVDA)) I 'SN S DY="" Q
HITE	... N HITE S HITE=$$HITE^DDSR(BK),OFS=SN-$P(REP,U,2)*HITE ;DJW/GFT
	... I OFS'<0,$P(REP,U,5)*HITE>OFS S DY=DY+OFS ;GFT OFFSET CAN'T BE OUTSIDE SCROLLING WINDOW
	... E  S DY=""
	.. S VAL=$P(DDGLVID,DDGLDEL)_$E(EXT,1,LEN)_$P(DDGLVID,DDGLDEL,10)
	.. X IOXY
	.. W $S(RJ:$J("",LEN-$L(EXT))_VAL,1:VAL_$J("",LEN-$L(EXT)))
	;
	D:$D(@DDSREFS@("PT",DDP,FLD)) RPB^DDS7(DDP,FLD,PG)
	D:$D(@DDSREFS@("COMP",DDP,FLD,PG)) RPCF^DDSCOMP(PG)
	Q
	;
GDIE(DDSVL)	;In:
	;  DDSFILE = File # or root
	;  DA      = Record array
	;  DDSVL   = Flag to lock record
	;Returns:
	;  DIE    = Global root of file
	;  DDP    = File #
	;  DDSVDL = Level #
	;  DDSVDA = DA,DA(1),...,
	S DDP=$S(DDSFILE=+DDSFILE:DDSFILE,1:+$P($G(@(DDSFILE_"0)")),U,2))
	I DDP=0 D BLD^DIALOG(202,"file") Q
	D GL^DDS10(DDP,.DA,.DIE,.DDSVDL,.DDSVDA,$G(DDSVL))
	Q
	;
GNDPC	;In:
	;  DDP    = File #
	;  DDSFLD = Field #
	;Returns:
	;  DDSVDDL0 = 0 node of DD
	;  DDSVND   = Node where data resides
	;  DDSVPC   = Piece where data resides
	;  DDSVDV   = Field specifications
	;  X        = Pointed to file root or set of codes
	I $G(DDSFLD)="" D BLD^DIALOG(202,"field") Q
	S DDSVDDL0=$G(^DD(DDP,DDSFLD,0))
	I DDSVDDL0?."^" D  Q
	. N I,E
	. S (I("FILE"),E("FILE"))=DDP,I(1)="#"_DDSFLD,E("FIELD")=DDSFLD
	. D BLD^DIALOG(501,.I,.E)
	;
	S DDSVPC=$P(DDSVDDL0,U,4)
	S DDSVND=$P(DDSVPC,";"),DDSVPC=$P(DDSVPC,";",2)
	S DDSVDV=$P(DDSVDDL0,U,2),X=$P(DDSVDDL0,U,3)
	;
	N P S P("FILE")=DDP,P("FIELD")=DDSFLD
	I DDSVPC=" " D
	. D BLD^DIALOG(520,"computed",.P)
	I DDSVPC=0 D
	. S DDSVDV=+DDSVDV_$P($G(^DD(+DDSVDV,.01,0)),U,2)
	. D:DDSVDV'["W" BLD^DIALOG(520,"multiple",.P)
	Q
	;
GVAL(DIE,DA,ND,PC)	;Get value
	N LN,Y
	S LN=$G(@(DIE_"DA,ND)"))
	I $E(PC)'="E" S Y=$P(LN,U,PC)
	E  S Y=$E(LN,+$E(PC,2,999),$P(PC,",",2)) S:Y?." " Y=""
	Q Y
	;
FIELD(DDP,FLD)	;Get field number
	N F,P
	S:$E(FLD)="""" FLD=$$UQT^DDSLIB($E(FLD,1,$$AFTQ^DDSLIB(FLD)-1))
	;
	S F=FLD,P("FILE")=DDP
	I FLD'=+$P(FLD,"E") D  Q:$G(DIERR) ""
	. S F=$O(^DD(DDP,"B",FLD,""))
	. I F="" S P(1)=FLD D BLD^DIALOG(501,.P)
	;
	I $D(^DD(DDP,F,0))[0 S P(1)="#"_F D BLD^DIALOG(501,.P) Q ""
	Q F
