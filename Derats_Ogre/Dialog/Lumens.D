BEGIN lumens

IF ~!Global("pxLumensWait","GLOBAL",1) !GlobalGT("pxoQuest","GLOBAL",1)~ THEN BEGIN LumensPremierContact	SAY @4 
	IF ~Global("pxMeetLumens","GLOBAL",0)~ THEN REPLY @41 GOTO Pompeux
	IF ~Global("pxMeetLumens","GLOBAL",0)~ THEN REPLY @42 GOTO Merveilleuseries
	IF ~~ THEN REPLY @43 DO ~StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~Global("pxoQuest","GLOBAL",1) InParty("Tragar")~ THEN REPLY @44 GOTO VientPourTragar
	IF ~Global("pxoQuest","GLOBAL",1) !InParty("Tragar")~ THEN REPLY @45 GOTO Debutquete
	IF ~~ THEN REPLY @46 EXIT
END

IF ~~ THEN BEGIN Merveilleuseries	SAY @1
	IF ~~ THEN REPLY @11 DO ~SetGlobal("pxMeetLumens","GLOBAL",1) StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @12 DO ~SetGlobal("pxMeetLumens","GLOBAL",1) StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~Global("pxoQuest","GLOBAL",1) InParty("Tragar")~ THEN REPLY @13 GOTO VientPourTragar
	IF ~Global("pxoQuest","GLOBAL",1) !InParty("Tragar")~ THEN REPLY @14 GOTO Debutquete
	IF ~~ THEN REPLY @15 EXIT
END

IF ~~ THEN BEGIN Pompeux	SAY @2
	IF ~~ THEN REPLY @21 GOTO Merveilleuseries
	IF ~~ THEN REPLY @22 GOTO Merveilles
	IF ~Global("pxoQuest","GLOBAL",1) InParty("Tragar")~ THEN REPLY @23 GOTO VientPourTragar
	IF ~Global("pxoQuest","GLOBAL",1) !InParty("Tragar")~ THEN REPLY @24 GOTO Debutquete
END

IF ~~ THEN BEGIN Merveilles	SAY @3
	IF ~~ THEN REPLY @31 DO ~SetGlobal("pxMeetLumens","GLOBAL",1) StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @32 DO ~SetGlobal("pxMeetLumens","GLOBAL",1) StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @33 DO ~SetGlobal("pxMeetLumens","GLOBAL",1) StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @34 EXIT
END

IF ~~ THEN BEGIN VientPourTragar	SAY @303
	IF ~~ THEN REPLY @3031 DO ~SetGlobal("pxMeetLumens","GLOBAL",1)~ GOTO Debutquete
END

IF ~~ THEN BEGIN Debutquete	SAY @5
	IF ~~ THEN REPLY @51 GOTO Fougue
	IF ~~ THEN REPLY @52 GOTO Myrtilles
END

IF ~~ THEN BEGIN Fougue	SAY @6
	IF ~~ THEN REPLY @61 GOTO Desole
	IF ~~ THEN REPLY @62 GOTO Quelcommercant
	IF ~~ THEN REPLY @63 GOTO Moyen
END

IF ~~ THEN BEGIN Myrtilles	SAY @7
	IF ~~ THEN REPLY @62 GOTO Quelcommercant
	IF ~~ THEN REPLY @71 GOTO Moyen
	IF ~~ THEN REPLY @72 GOTO AltDesole
END

IF ~~ THEN BEGIN AltDesole	SAY @8
	IF ~~ THEN REPLY @81 GOTO Altproposition
	IF ~~ THEN REPLY @82 GOTO Commercant
	IF ~~ THEN REPLY @83 GOTO Menace
END

IF ~~ THEN BEGIN Menace	SAY @9
	IF ~~ THEN REPLY @91 GOTO Potioninverse
	IF ~~ THEN REPLY @92 DO ~SetGlobal("pxLumensWait","GLOBAL",1)	SetGlobal("pxLumensInsatisfait","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Commercant	SAY @10
	IF ~~ THEN REPLY @101 DO ~SetGlobal("pxLumensInsatisfait","GLOBAL",1)~ GOTO Proposition
	IF ~~ THEN REPLY @102 DO ~SetGlobal("pxLumensInsatisfait","GLOBAL",1)~ GOTO Proposition
	IF ~~ THEN REPLY @103 DO ~SetGlobal("pxLumensInsatisfait","GLOBAL",1)~ GOTO Debrouille
END

IF ~~ THEN BEGIN Debrouille	SAY @201
	IF ~~ THEN REPLY @2011 GOTO Proposition
	IF ~~ THEN REPLY @2012 GOTO Doute
END

IF ~~ THEN BEGIN Doute	SAY @202
	IF ~~ THEN REPLY @2021 GOTO Proposition
	IF ~~ THEN REPLY @2022 DO ~SetGlobal("pxLumensWait","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN Moyen	SAY @203
	IF ~~ THEN REPLY @2031 GOTO Serviceapresvente
	IF ~~ THEN REPLY @101 GOTO Proposition
	IF ~~ THEN REPLY @102 GOTO Proposition
	IF ~~ THEN REPLY @103 GOTO Debrouille
END

IF ~~ THEN BEGIN Serviceapresvente	SAY @204
	IF ~~ THEN REPLY @2041 DO ~SetGlobal("pxLumensInsatisfait","GLOBAL",1)~ GOTO Proposition
	IF ~~ THEN REPLY @2042 DO ~SetGlobal("pxLumensInsatisfait","GLOBAL",1) SetGlobal("pxLumensWait","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN Quelcommercant	SAY @205
	IF ~~ THEN REPLY @2051 GOTO Puissantepotion
	IF ~~ THEN REPLY @2052 GOTO Moyen
END

IF ~~ THEN BEGIN Puissantepotion	SAY @206
	IF ~~ THEN REPLY @2031 GOTO Serviceapresvente
	IF ~~ THEN REPLY @101 GOTO Proposition
	IF ~~ THEN REPLY @102 GOTO Proposition
	IF ~~ THEN REPLY @103 GOTO Debrouille
END

IF ~~ THEN BEGIN Potioninverse	SAY @207
	IF ~~ THEN REPLY @2031 GOTO Serviceapresvente
	IF ~~ THEN REPLY @101 GOTO Proposition
	IF ~~ THEN REPLY @102 GOTO Proposition
	IF ~~ THEN REPLY @103 GOTO Debrouille
END

IF ~~ THEN BEGIN Desole	SAY @208
	IF ~~ THEN REPLY @81 GOTO Altproposition
	IF ~~ THEN REPLY @82 GOTO Commercant
	IF ~~ THEN REPLY @83 GOTO Menace
END

IF ~~ THEN BEGIN Altproposition	SAY @207
	IF ~~ THEN REPLY @101 GOTO Proposition
	IF ~~ THEN REPLY @102 GOTO Proposition
	IF ~~ THEN REPLY @103 GOTO Debrouille
END

IF ~~ THEN BEGIN VientPourTragar3	SAY @210
	IF ~~ THEN REPLY @3051 GOTO Proposition
	IF ~~ THEN REPLY @3052 GOTO Pourquoi
END

IF ~~ THEN BEGIN Proposition	SAY @301
	IF ~~ THEN REPLY @3011 GOTO Liste
	IF ~~ THEN REPLY @3012 DO ~SetGlobal("pxLumensWait","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN Liste	SAY @302
	IF ~~ THEN REPLY @3021 DO ~GiveItemCreate("pxoliste",Player1,1,1,1) SetGlobal("pxoQuest","GLOBAL",2)~ UNSOLVED_JOURNAL @501 EXIT
	IF ~~ THEN REPLY @3022 DO ~GiveItemCreate("pxoliste",Player1,1,1,1) SetGlobal("pxoQuest","GLOBAL",2) StartStore("pxolumens",LastTalkedToBy())~ EXIT
END

IF ~Global("pxLumensWait","GLOBAL",1)	!GlobalGT("pxoQuest","GLOBAL",1)~ THEN BEGIN Retour	SAY @304
	IF ~InParty("Tragar")~ THEN REPLY @3041 GOTO VientPourTragar3
	IF ~!InParty("Tragar")~ THEN REPLY @3042 GOTO VientPourTragar3
	IF ~~ THEN REPLY @3043 DO ~StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @46 EXIT
END

IF ~Global("pxLumensWait","GLOBAL",2)	!GlobalGT("pxoQuest","GLOBAL",1)~ THEN BEGIN Retour	SAY @304
	IF ~InParty("Tragar")~ THEN REPLY @3041 GOTO VientPourTragar2
	IF ~!InParty("Tragar")~ THEN REPLY @3042 GOTO VientPourTragar2
	IF ~~ THEN REPLY @3043 DO ~StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @46 EXIT
END

IF ~~ THEN BEGIN VientPourTragar2	SAY @305
	IF ~~ THEN REPLY @3051 GOTO Proposition
	IF ~~ THEN REPLY @3052 GOTO Pourquoi
END

IF ~~ THEN BEGIN Pourquoi	SAY @306
	IF ~~ THEN REPLY @3011 DO ~SetGlobal("pxLumensWait","GLOBAL",0)~ GOTO Liste
	IF ~~ THEN REPLY @3012 DO ~SetGlobal("pxLumensWait","GLOBAL",1) SetGlobal("pxLumensWait","GLOBAL",3)~ EXIT
END

IF ~Global("pxLumensWait","GLOBAL",3)	!GlobalGT("pxoQuest","GLOBAL",1)~ THEN BEGIN RetourAttente	SAY @307
	IF ~~ THEN REPLY @3071 DO ~SetGlobal("pxLumensWait","GLOBAL",0)~ GOTO Liste
	IF ~~ THEN REPLY @3072 DO ~StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @3073 EXIT
END

IF ~Global("pxoQuest","GLOBAL",2)~ THEN BEGIN RetourIngredients	SAY @308
	IF ~NumItemsPartyGT("pxorat",1) PartyHasItem("pxolotus") PartyHasItem("pxolapin")
	PartyHasItem("pxofrom1") PartyHasItem("misc39") PartyHasItem("pxopoudr")
	PartyGoldGT(150)~ THEN REPLY @03081 DO ~TakePartyGold(150) DestroyGold(150)
	TakePartyItemNum("pxorat",2)   DestroyItem("pxorat")
	TakePartyItemNum("pxolotus",1) DestroyItem("pxolotus")
	TakePartyItemNum("pxolapin",1) DestroyItem("pxolapin")
	TakePartyItemNum("pxofrom1",1) DestroyItem("pxofrom1")
	TakePartyItemNum("misc39",1)   DestroyItem("misc39")
	TakePartyItemNum("pxopoudr",1) DestroyItem("pxopoudr")
	CreateVisualEffect("spcrtwpn",[365.420])~ GOTO Preparation
	IF ~NumItemsPartyGT("pxorat",1) PartyHasItem("pxolotus") PartyHasItem("pxolapin")
	PartyHasItem("pxofrom1") PartyHasItem("misc39") PartyHasItem("pxopoudr")
	PartyGoldGT(150)~ THEN REPLY @3082 DO ~TakePartyGold(150) DestroyGold(150)
	TakePartyItemNum("pxorat",2)   DestroyItem("pxorat")
	TakePartyItemNum("pxolotus",1) DestroyItem("pxolotus")
	TakePartyItemNum("pxolapin",1) DestroyItem("pxolapin")
	TakePartyItemNum("pxofrom1",1) DestroyItem("pxofrom1")
	TakePartyItemNum("misc39",1)   DestroyItem("misc39")
	TakePartyItemNum("pxopoudr",1) DestroyItem("pxopoudr")
	CreateVisualEffect("spcrtwpn",[365.420])~ GOTO Preparation
	IF ~~ THEN REPLY @3072 DO ~StartStore("pxolumen",LastTalkedToBy())~ EXIT
	IF ~~ THEN REPLY @3083 EXIT
END

IF ~~ THEN BEGIN Preparation	SAY @309
	IF ~~ THEN REPLY @3091 DO ~GiveItemCreate("pxopotio",Player1,1,1,1) SetGlobal("pxoQuest","GLOBAL",4)~ UNSOLVED_JOURNAL @502 EXIT
	IF ~~ THEN REPLY @3092 DO ~GiveItemCreate("pxopotio",Player1,1,1,1) SetGlobal("pxoQuest","GLOBAL",4)~ UNSOLVED_JOURNAL @502 EXIT
END

IF ~Global("pxoQuest","GLOBAL",5) InParty("Tragar")~ THEN BEGIN Probleme	SAY @400
	IF ~~ EXTERN ~TRAGAR~ NainBleu
END

IF ~~ THEN BEGIN DeRetour	SAY @401
	IF ~~ THEN REPLY @4011 GOTO Suffisance
	IF ~~ THEN REPLY @4012 GOTO Permanence
	IF ~~ THEN REPLY @4013 GOTO Malhonnete2
END

IF ~~ THEN BEGIN Suffisance	SAY @402
	IF ~~ EXTERN ~TRAGAR~ Calme7
END

IF ~~ THEN BEGIN Permanence	SAY @403
	IF ~~ THEN REPLY @4031 GOTO Malhonnete1
	IF ~!Global("pxLumensInsatisfait","GLOBAL",1)~ THEN REPLY @4032 GOTO Encore
	IF ~~ THEN REPLY @4033 EXTERN ~TRAGAR~ Calme9
END

IF ~~ THEN BEGIN Malhonnete1	SAY @405
	IF ~~ EXTERN ~TRAGAR~ Calme7
END

IF ~~ THEN BEGIN Malhonnete2	SAY @406
	IF ~~ EXTERN ~TRAGAR~ Calme7
END

IF ~~ THEN BEGIN Encore	SAY @407
	IF ~~ THEN REPLY @4071 EXTERN ~TRAGAR~ Calme8
	IF ~~ THEN REPLY @4072 EXTERN ~TRAGAR~ Calme9
END

IF ~Global("pxoQuest","GLOBAL",6)~ THEN BEGIN RetourIngredients	SAY @308
	IF ~~ THEN REPLY @3043 DO ~StartStore("pxolumen",LastTalkedToBy())~ EXIT
END