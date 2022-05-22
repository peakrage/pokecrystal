BrentPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue .NotMonday
	checkflag ENGINE_BRENT_HAS_LINKING_CORD
	iftrue .LinkingCord
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue BrentMondayMorning

.NotMonday:
	farsjump BrentHangUpScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump BrentReminderScript

.LinkingCord
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump BrentFoundItemScript

BrentPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, BrentBillTrivia
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftrue .Generic
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue .Generic
	checkflag ENGINE_BRENT_HAS_LINKING_CORD
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, BrentWantsBattle
	checkevent EVENT_BRENT_GAVE_LINKING_CORD
	iftrue .LinkingCord
	farscall PhoneScript_Random2
	ifequal 0, BrentHasLinkingCord

.LinkingCord
	farscall PhoneScript_Random2
	ifequal 0, BrentHasLinkingCord

.Generic:
	farsjump Phone_GenericCall_Male

BrentMondayMorning:
	setflag ENGINE_BRENT_MONDAY_MORNING

BrentWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	setflag ENGINE_BRENT_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

BrentHasLinkingCord:
	setflag ENGINE_BRENT_HAS_LINKING_CORD
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump PhoneScript_FoundItem_Male

BrentBillTrivia:
	farsjump BrentBillTriviaScript
