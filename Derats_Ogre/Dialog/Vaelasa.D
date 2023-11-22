ADD_TRANS_TRIGGER vaelasa 8
~!Global("pxoQuest","GLOBAL",2)~

EXTEND_BOTTOM VAELASA 8
IF ~Global("pxoQuest","GLOBAL",2)~ THEN REPLY @0 DO ~SetGlobal("frLeaveDryads","ar1200",1)
	EraseJournalEntry(34092)
	EraseJournalEntry(34093)~ 
	SOLVED_JOURNAL #47779 GOTO PoudreDeFee
END

APPEND ~VAELASA~
	IF ~~ THEN BEGIN PoudreDeFee	SAY @1
		IF ~~ THEN DO ~FadeToColor([20.0],0) Wait(2) FadeFromColor([20.0],0)~ GOTO PoudreDeFeeMerci
	END

	IF ~~ THEN BEGIN PoudreDeFeeMerci	SAY @2
		IF ~~ THEN REPLY @3 DO ~GiveItemCreate("pxopoudr",Player1,0,0,0) EscapeArea()~ EXIT
	END
END