DINIT0FJ	;SFISC/MKO-DATA FOR FORM AND BLOCK FILES ;10:49 AM  30 Mar 1999
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	F I=1:2 S X=$T(ENTRY+I) G:X="" ^DINIT0FK S Y=$E($T(ENTRY+I+1),5,999),X=$E(X,4,999),@X=Y
	Q
ENTRY	;
	;;^DIST(.404,.404041,40,8,0)
	;;=12^PRE ACTION^3
	;;^DIST(.404,.404041,40,8,1)
	;;=11
	;;^DIST(.404,.404041,40,8,2)
	;;=13,26^50^13,14
	;;^DIST(.404,.404041,40,9,0)
	;;=13^POST ACTION^3
	;;^DIST(.404,.404041,40,9,1)
	;;=12
	;;^DIST(.404,.404041,40,9,2)
	;;=14,26^50^14,13
	;;^DIST(.404,.404041,40,10,0)
	;;=14^POST ACTION ON CHANGE^3
	;;^DIST(.404,.404041,40,10,1)
	;;=13
	;;^DIST(.404,.404041,40,10,2)
	;;=15,26^50^15,3
	;;^DIST(.404,.404041,40,11,0)
	;;=9^EXECUTABLE CAPTION^3
	;;^DIST(.404,.404041,40,11,1)
	;;=1.1
	;;^DIST(.404,.404041,40,11,2)
	;;=9,26^50^9,6
	;;^DIST(.404,.404041,40,11,13)
	;;=D PUT^DDSVALF("CAPTION","","",$S(X="":"",1:"!M"))
	;;^DIST(.404,.404041,40,12,0)
	;;=10^EXECUTABLE DEFAULT^3
	;;^DIST(.404,.404041,40,12,1)
	;;=6.01
	;;^DIST(.404,.404041,40,12,2)
	;;=10,26^50^10,6
	;;^DIST(.404,.404041,40,12,13)
	;;=D PUT^DDSVAL(.4044,.DA,6,$S(X="":"",1:"!M"))
	;;^DIST(.404,.404041,40,13,0)
	;;=3^FORM ONLY FIELD PARAMETERS...^2
	;;^DIST(.404,.404041,40,13,2)
	;;=3,73^1^3,43^1
	;;^DIST(.404,.404041,40,13,7)
	;;=^11
	;;^DIST(.404,.404041,40,13,20)
	;;=F^^0:0
	;;^DIST(.404,.404041,40,13,21,0)
	;;=^^1^1^2940928
	;;^DIST(.404,.404041,40,13,21,1,0)
	;;=Press <RET> to edit the properties of this form-only field
	;;^DIST(.404,.404041,40,14,0)
	;;=4^OTHER PARAMETERS...^2
	;;^DIST(.404,.404041,40,14,2)
	;;=4,26^1^4,6^1
	;;^DIST(.404,.404041,40,14,7)
	;;=^21
	;;^DIST(.404,.404041,40,14,20)
	;;=F^^0:0
	;;^DIST(.404,.404041,40,14,21,0)
	;;=^^1^1^2940928
	;;^DIST(.404,.404041,40,14,21,1,0)
	;;=Press <RET> to edit additional properties of this form-only field
	;;^DIST(.404,.404041,40,15,0)
	;;=7^CAPTION^2
	;;^DIST(.404,.404041,40,15,2)
	;;=7,26^50^7,17
	;;^DIST(.404,.404041,40,15,3)
	;;=!M
	;;^DIST(.404,.404041,40,15,3.1)
	;;=S Y=$G(DDGFCAP0)
	;;^DIST(.404,.404041,40,15,13)
	;;=D FOCAP^DDGFU
	;;^DIST(.404,.404041,40,15,20)
	;;=DD^^.4044,1
	;;^DIST(.404,.404041,40,15,23)
	;;=S DDGFCAP=X
	;;^DIST(.404,.404041,40,16,0)
	;;=5^SUPPRESS COLON AFTER CAPTION?^2
	;;^DIST(.404,.404041,40,16,2)
	;;=4,73^3^4,43^1
	;;^DIST(.404,.404041,40,16,3)
	;;=!M
	;;^DIST(.404,.404041,40,16,3.1)
	;;=S Y=$G(DDGFSUP0)
	;;^DIST(.404,.404041,40,16,20)
	;;=DD^^.4044,5.2
	;;^DIST(.404,.404041,40,16,23)
	;;=S DDGFSUP=X
	;;^DIST(.404,.404041,40,17,0)
	;;=6^UNIQUE NAME^3
	;;^DIST(.404,.404041,40,17,1)
	;;=3.1
	;;^DIST(.404,.404041,40,17,2)
	;;=5,26^50^5,13
	;;^DIST(.404,.404042,0)
	;;=DDGF FIELD FORM ONLY PARAMS^.4044
	;;^DIST(.404,.404042,40,0)
	;;=^.4044I^9^8
	;;^DIST(.404,.404042,40,1,0)
	;;=1^ Other Form Only Field Parameters ^1
	;;^DIST(.404,.404042,40,1,2)
	;;=^^1,22
	;;^DIST(.404,.404042,40,2,0)
	;;=2^READ TYPE^3
	;;^DIST(.404,.404042,40,2,1)
	;;=20.1
	;;^DIST(.404,.404042,40,2,2)
	;;=3,20^15^3,9
	;;^DIST(.404,.404042,40,2,4)
	;;=1
	;;^DIST(.404,.404042,40,3,0)
	;;=3^PARAMETERS^3
	;;^DIST(.404,.404042,40,3,1)
	;;=20.2
	;;^DIST(.404,.404042,40,3,2)
	;;=4,20^2^4,8
	;;^DIST(.404,.404042,40,4,0)
	;;=4^QUALIFIERS^3
	;;^DIST(.404,.404042,40,4,1)
	;;=20.3
	;;^DIST(.404,.404042,40,4,2)
	;;=5,20^52^5,8
	;;^DIST(.404,.404042,40,5,0)
	;;=6^INPUT TRANSFORM^3
	;;^DIST(.404,.404042,40,5,1)
	;;=22
	;;^DIST(.404,.404042,40,5,2)
	;;=9,20^52^9,3
	;;^DIST(.404,.404042,40,6,0)
	;;=5^HELP (WP)^3
	;;^DIST(.404,.404042,40,6,1)
	;;=21
	;;^DIST(.404,.404042,40,6,2)
	;;=7,20^1^7,9
	;;^DIST(.404,.404042,40,8,0)
	;;=7^SCREEN^3
	;;^DIST(.404,.404042,40,8,1)
	;;=24
	;;^DIST(.404,.404042,40,8,2)
	;;=10,20^52^10,12
	;;^DIST(.404,.404042,40,9,0)
	;;=8^SAVE CODE^3
	;;^DIST(.404,.404042,40,9,1)
	;;=23
	;;^DIST(.404,.404042,40,9,2)
	;;=11,20^52^11,9
	;;^DIST(.404,.404051,0)
	;;=DDGF FIELD COMPUTED^.4044
	;;^DIST(.404,.404051,40,0)
	;;=^.4044I^8^8
	;;^DIST(.404,.404051,40,1,0)
	;;=1^ Computed Field Properties ^1
	;;^DIST(.404,.404051,40,1,2)
	;;=^^1,26
	;;^DIST(.404,.404051,40,2,0)
	;;=2^FIELD ORDER^3
	;;^DIST(.404,.404051,40,2,1)
	;;=.01
	;;^DIST(.404,.404051,40,2,2)
	;;=3,24^4^3,11
	;;^DIST(.404,.404051,40,3,0)
	;;=3^OTHER PARAMETERS...^2
	;;^DIST(.404,.404051,40,3,2)
	;;=4,24^1^4,4^1
	;;^DIST(.404,.404051,40,3,7)
	;;=^11
	;;^DIST(.404,.404051,40,3,20)
	;;=F^^1:1
	;;^DIST(.404,.404051,40,3,21,0)
	;;=^^1^1^2930916
	;;^DIST(.404,.404051,40,3,21,1,0)
	;;=Press 'RETURN' to edit additional properties of this Data Dictionary field
	;;^DIST(.404,.404051,40,4,0)
	;;=4^SUPPRESS COLON AFTER CAPTION?^2
	;;^DIST(.404,.404051,40,4,2)
	;;=4,71^3^4,41^1
	;;^DIST(.404,.404051,40,4,3)
	;;=!M
	;;^DIST(.404,.404051,40,4,3.1)
	;;=S Y=DDGFSUP0
	;;^DIST(.404,.404051,40,4,20)
	;;=DD^^.4044,5.2
	;;^DIST(.404,.404051,40,4,23)
	;;=S DDGFSUP=X
	;;^DIST(.404,.404051,40,5,0)
	;;=5^UNIQUE NAME^3
	;;^DIST(.404,.404051,40,5,1)
	;;=3.1
	;;^DIST(.404,.404051,40,5,2)
	;;=5,24^50^5,11
	;;^DIST(.404,.404051,40,6,0)
	;;=6^CAPTION^2
	;;^DIST(.404,.404051,40,6,2)
	;;=7,24^50^7,15
	;;^DIST(.404,.404051,40,6,3)
	;;=!M
	;;^DIST(.404,.404051,40,6,3.1)
	;;=S Y=DDGFCAP0
	;;^DIST(.404,.404051,40,6,13)
	;;=D COMPCAP^DDGFU
	;;^DIST(.404,.404051,40,6,20)
	;;=DD^^.4044,1
	;;^DIST(.404,.404051,40,6,23)
	;;=S DDGFCAP=X
	;;^DIST(.404,.404051,40,7,0)
	;;=7^EXECUTABLE CAPTION^3
	;;^DIST(.404,.404051,40,7,1)
	;;=1.1
	;;^DIST(.404,.404051,40,7,2)
	;;=8,24^50^8,4
	;;^DIST(.404,.404051,40,7,13)
	;;=D PUT^DDSVALF("CAPTION","","",$S(X="":"",1:"!M"))
	;;^DIST(.404,.404051,40,8,0)
	;;=8^COMPUTED EXPRESSION^3
	;;^DIST(.404,.404051,40,8,1)
	;;=30
	;;^DIST(.404,.404051,40,8,2)
	;;=10,24^50^10,3
	;;^DIST(.404,.404051,40,8,4)
	;;=1
	;;^DIST(.404,.404052,0)
	;;=DDGF FIELD COMPUTED OTHER^.4044
	;;^DIST(.404,.404052,40,0)
	;;=^.4044I^8^5
	;;^DIST(.404,.404052,40,1,0)
	;;=1^ Other Computed Field Properties ^1
	;;^DIST(.404,.404052,40,1,2)
	;;=^^1,6
	;;^DIST(.404,.404052,40,5,0)
	;;=3^DATA LENGTH^2
	;;^DIST(.404,.404052,40,5,2)
	;;=5,25^3^5,12
	;;^DIST(.404,.404052,40,5,3)
	;;=!M
	;;^DIST(.404,.404052,40,5,3.1)
	;;=S Y=$G(DDGFDL0)
	;;^DIST(.404,.404052,40,5,20)
	;;=DD^^.4044,4.2
	;;^DIST(.404,.404052,40,5,23)
	;;=S DDGFDL=X
	;;^DIST(.404,.404052,40,6,0)
	;;=4^CAPTION COORDINATE^2
	;;^DIST(.404,.404052,40,6,2)
	;;=6,25^7^6,5
	;;^DIST(.404,.404052,40,6,3)
	;;=!M
	;;^DIST(.404,.404052,40,6,3.1)
	;;=S Y=$G(DDGFCC0)
	;;^DIST(.404,.404052,40,6,20)
	;;=DD^^.4044,5.1
	;;^DIST(.404,.404052,40,6,23)
	;;=S DDGFCC=X
	;;^DIST(.404,.404052,40,7,0)
	;;=5^DATA COORDINATE^2
	;;^DIST(.404,.404052,40,7,2)
	;;=7,25^7^7,8
	;;^DIST(.404,.404052,40,7,3)
	;;=!M
	;;^DIST(.404,.404052,40,7,3.1)
	;;=S Y=$G(DDGFDC0)
	;;^DIST(.404,.404052,40,7,20)
	;;=DD^^.4044,4.1
	;;^DIST(.404,.404052,40,7,23)
	;;=S DDGFDC=X
	;;^DIST(.404,.404052,40,8,0)
	;;=2^RIGHT JUSTIFY^3
