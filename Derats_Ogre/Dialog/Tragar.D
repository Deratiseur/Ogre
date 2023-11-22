BEGIN tragar

IF ~Global("pxMeetTragar","GLOBAL",0) ~ THEN BEGIN PremierContact	SAY @1 
	IF ~~ THEN REPLY @11 DO ~SetGlobal("pxMeetTragar","GLOBAL",1)~ GOTO BesoinAide
	IF ~~ THEN REPLY @12 DO ~SetGlobal("pxMeetTragar","GLOBAL",1)~ GOTO BesoinAide
	IF ~~ THEN REPLY @13 DO ~SetGlobal("pxMeetTragar","GLOBAL",1)~ GOTO BesoinAide
END

IF ~~ THEN BEGIN BesoinAide	SAY @2
	IF ~~ THEN REPLY @21 GOTO Explication
	IF ~~ THEN REPLY @22 GOTO Avertissement
	IF ~~ THEN REPLY @23 GOTO Blague
	IF ~~ THEN REPLY @24 DO ~SetGlobal("pxLeaveTragar","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Avertissement	SAY @3
	IF ~~ THEN REPLY @31 GOTO Mechancete
	IF ~~ THEN REPLY @32 GOTO AltExplication
	IF ~~ THEN REPLY @33 GOTO Mechancete
END

IF ~~ THEN BEGIN AltExplication	SAY @4
	IF ~~ THEN REPLY @41 GOTO Association
	IF ~~ THEN REPLY @42 GOTO Insistance
	IF ~~ THEN REPLY @43 GOTO Menace
END

IF ~~ THEN BEGIN Insistance	SAY @5
	IF ~~ THEN REPLY @51 GOTO Association
	IF ~~ THEN REPLY @52 DO ~SetGlobal("pxoQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @40 EXIT
END

IF ~~ THEN BEGIN Blague	SAY @6
	IF ~~ THEN REPLY @61 DO ~SetGlobal("pxTragarUnlike","GLOBAL",1)~ JOURNAL @401 EXIT
	IF ~~ THEN REPLY @62 GOTO Explication
	IF ~~ THEN REPLY @63 GOTO Menace
END

IF ~~ THEN BEGIN Mechancete	SAY @7
	IF ~~ THEN REPLY @71 DO ~SetGlobal("pxTragarUnlike","GLOBAL",1)~ JOURNAL @401 EXIT
	IF ~~ THEN REPLY @72 GOTO Menace
END

IF ~~ THEN BEGIN Menace	SAY @8
	IF ~~ THEN REPLY @81 DO ~Enemy()~ JOURNAL @402 EXIT
	IF ~~ THEN REPLY @82 DO ~SetGlobal("pxTragarUnlike","GLOBAL",1)~ JOURNAL @401 EXIT
END

IF ~~ THEN BEGIN Association	SAY @9
	IF ~~ THEN REPLY @91 DO ~SetGlobal("pxoQuest","GLOBAL",1)~	UNSOLVED_JOURNAL @40 GOTO Attente
	IF ~~ THEN REPLY @92 DO ~SetGlobal("pxoQuest","GLOBAL",1)	JoinParty()~ UNSOLVED_JOURNAL @40 EXIT
END

IF ~~ THEN BEGIN Explication	SAY @10
	IF ~~ THEN REPLY @101 GOTO Association
	IF ~~ THEN REPLY @102 GOTO Attente
END

IF ~~ THEN BEGIN Attente	SAY @201
	IF ~~ THEN DO ~SetGlobal("pxoQuest","GLOBAL",1)~	UNSOLVED_JOURNAL @40 EXIT
END

IF ~Global("pxLeaveTragar","GLOBAL",1)~ THEN BEGIN SecondContact	SAY @202
	IF ~~ THEN REPLY @2021 GOTO SecondContact2
	IF ~~ THEN REPLY @2022 GOTO Menace
END

IF ~~ THEN BEGIN SecondContact2	SAY @203
	IF ~~ THEN REPLY @31 GOTO Mechancete
	IF ~~ THEN REPLY @32 GOTO AltExplication
	IF ~~ THEN REPLY @33 GOTO Mechancete
END

IF ~Global("pxTragarUnlike","GLOBAL",1)~ THEN BEGIN Aimepas	SAY @204
IF ~~ THEN JOURNAL @401 EXIT
END

IF ~!Global("pxoQuest","GLOBAL",5)~ THEN BEGIN Retour	SAY @205
	IF ~PartyHasItem("pxopotio")~ THEN REPLY @2051 GOTO Finalite
	IF ~Global("pxoQuest","GLOBAL",2)~ THEN REPLY @2052 GOTO Proposition2
	IF ~~ THEN REPLY @2053 GOTO Tempsperdu
END

IF ~~ THEN BEGIN Tempsperdu	SAY @206
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Proposition2	SAY @207
	IF ~~ THEN REPLY @2071 GOTO Tempsperdu
	IF ~~ THEN REPLY @2072 GOTO Association2
END

IF ~~ THEN BEGIN Association2	SAY @9
	IF ~~ THEN REPLY @2081 GOTO Tempsperdu
	IF ~~ THEN REPLY @92 DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN Finalite	SAY @30
	IF ~~ THEN DO ~	TakePartyItemNum("pxopotio",1) 	UseItem("pxopotio",Myself)	SetGlobal("pxoQuest","GLOBAL",5)
	AddexperienceParty(20000)	StartDialog("tragar",[PC])~ 	EXIT
END

IF ~Global("pxoQuest","GLOBAL",5)~ THEN BEGIN Nain	SAY @301
	IF ~!InParty("Tragar")~ THEN REPLY @3011 DO ~SetGlobal("pxoQuest","GLOBAL",6)~ GOTO Nain2
	IF ~InParty("Tragar")~ THEN REPLY @3011 DO ~SetGlobal("pxoQuest","GLOBAL",6)	ChangeAIScript("",OVERRIDE)	ChangeAIScript("",GENERAL)~	UNSOLVED_JOURNAL @406 EXIT
	IF ~Global("pxLumensInsatisfait","GLOBAL",1)~ THEN REPLY @3012 GOTO Fin1
	IF ~~ THEN REPLY @3013 GOTO Fin2
	IF ~~ THEN REPLY @3014 GOTO ParleNormal
END

IF ~~ THEN BEGIN Fin1	SAY @302
	IF ~~ THEN SOLVED_JOURNAL @407 EXIT
END

IF ~~ THEN BEGIN Fin2	SAY @303
	IF ~~ THEN SOLVED_JOURNAL @407 EXIT
END

IF ~~ THEN BEGIN Nain2	SAY @304
	IF ~~ THEN REPLY @3041 DO ~JoinParty()	ChangeAIScript("",OVERRIDE)	ChangeAIScript("",GENERAL)~	UNSOLVED_JOURNAL @406 EXIT
	IF ~~ THEN REPLY @3042 DO ~SetGlobal("pxoQuest","GLOBAL",7)~ GOTO Fin3
END

IF ~~ THEN BEGIN Fin3	SAY @305
	IF ~~ THEN SOLVED_JOURNAL @401 EXIT
END

IF ~~ THEN BEGIN NainBleu	SAY @306
	IF ~~ EXTERN ~LUMENS~ DeRetour
END

IF ~~ THEN BEGIN Calme7	SAY @307
	IF ~~ THEN DO ~SetGlobal("pxoQuest","GLOBAL",7) LeaveParty() EscapeArea()~ SOLVED_JOURNAL @408 EXIT
END

IF ~~ THEN BEGIN Calme8	SAY @308
	IF ~~ THEN DO ~SetGlobal("pxoQuest","GLOBAL",7) LeaveParty() EscapeArea()~ SOLVED_JOURNAL @408 EXIT
END
IF ~~ THEN BEGIN Calme9	SAY @309
	IF ~~ THEN DO ~SetGlobal("pxoQuest","GLOBAL",7) LeaveParty() EscapeArea()~ SOLVED_JOURNAL @409 EXIT
END

IF ~~ THEN BEGIN ParleNormal	SAY @3010
	IF ~!InParty("Tragar")~ THEN REPLY @30101 DO ~SetGlobal("pxoQuest","GLOBAL",6)~ GOTO Nain2
	IF ~InParty("Tragar")~ THEN REPLY @30101 DO ~SetGlobal("pxoQuest","GLOBAL",6)	ChangeAIScript("",OVERRIDE)	ChangeAIScript("",GENERAL)~	UNSOLVED_JOURNAL @406 EXIT
	IF ~Global("pxLumensInsatisfait","GLOBAL",1)~ THEN REPLY @3012 SOLVED_JOURNAL @407 GOTO Fin1
	IF ~~ THEN REPLY @30103 UNSOLVED_JOURNAL @406 GOTO Fin2
END