	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUIDE

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	clearflag ENGINE_BROCK_REMATCH_FIGHT
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	checkflag ENGINE_BROCK_REMATCH_FIGHT
	iftrue .PostRematch
	checkevent EVENT_OPENED_MT_SILVER
	iffalse .PostInitialFight
	readvar VAR_WEEKDAY	
	ifnotequal SATURDAY, .PostInitialFight
	checktime NITE
	iffalse .PostInitialFight
	writetext BrockText_AskRematch
	yesorno
	iftrue .BrockRematch
	writetext BrockText_RematchDeclined
	waitbutton
	closetext
	end
.PostInitialFight:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

.BrockRematch:
	writetext BrockText_RematchAccepted
	waitbutton
	winlosstext BrockText_RematchDefeat, 0
	readmem wBrockFightCount
	ifequal 4, .LoadFight4
	ifequal 3, .LoadFight3
	ifequal 2, .LoadFight2
	ifequal 1, .LoadFight1

.LoadFight1:
	loadtrainer BROCK, BROCK2
	startbattle
	reloadmapafterbattle
	loadmem wBrockFightCount, 2
	setflag ENGINE_BROCK_REMATCH_FIGHT
	opentext
	writetext BrockText_IveLostAgain
	waitbutton
	closetext
	end

.LoadFight2:
	loadtrainer BROCK, BROCK3
	startbattle
	reloadmapafterbattle
	loadmem wBrockFightCount, 3
	setflag ENGINE_BROCK_REMATCH_FIGHT
	opentext
	writetext BrockText_IveLostAgain
	waitbutton
	closetext
	end

.LoadFight3:
	loadtrainer BROCK, BROCK4
	startbattle
	reloadmapafterbattle
	loadmem wBrockFightCount, 4
	setflag ENGINE_BROCK_REMATCH_FIGHT
	opentext
	writetext BrockText_IveLostAgain
	waitbutton
	closetext
	end

.LoadFight4:
	loadtrainer BROCK, BROCK5
	startbattle
	reloadmapafterbattle
	setflag ENGINE_BROCK_REMATCH_FIGHT
	opentext
	writetext BrockText_IveLostAgain
	waitbutton
	closetext
	end

.PostRematch:
	writetext BrockText_IveLostAgain
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetext PewterGymGuideText
	waitbutton
	closetext
	end

.PewterGymGuideWinScript:
	writetext PewterGymGuideWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

BrockIntroText:
	text "BROCK: Wow, it's"
	line "not often that we"

	para "get a challenger"
	line "from JOHTO."

	para "I'm BROCK, the"
	line "PEWTER GYM LEADER."

	para "I'm an expert on"
	line "rock-type #MON."

	para "My #MON are im-"
	line "pervious to most"

	para "physical attacks."
	line "You'll have a hard"

	para "time inflicting"
	line "any damage."

	para "Come on!"
	done

BrockWinLossText:
	text "BROCK: Your #-"
	line "MON's powerful at-"
	cont "tacks overcame my"
	cont "rock-hard defense…"

	para "You're stronger"
	line "than I expected…"

	para "Go ahead--take"
	line "this BADGE."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> received"
	line "BOULDERBADGE."
	done

BrockBoulderBadgeText:
	text "BROCK: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."

	para "That BOULDERBADGE"
	line "will make your"

	para "#MON even more"
	line "powerful."
	done

BrockFightDoneText:
	text "BROCK: The world"
	line "is huge. There are"

	para "still many strong"
	line "trainers like you."

	para "Just wait and see."
	line "I'm going to be-"
	cont "come a lot strong-"
	cont "er too."
	done

BrockText_AskRematch:
	text "What's up?"

	para "Hey, you came at"
	line "just the right"
	cont "time!"

	para "I'm free right now."
	line "Want to battle me"
	cont "again?"
	done

BrockText_RematchAccepted:
	text "All right, all"
	line "right!"
	done

BrockText_RematchDeclined:
	text "Is that so?"
	line "Well, I suppose"

	para "you must have a"
	line "lot of things to"
	cont "do yourself…"
	done

BrockText_RematchDefeat:
	text "Looks like you're"
	line "the stronger one…"
	done

BrockText_IveLostAgain:
	text "I've lost again…"

	para "You aren't advent-"
	line "uring around for"
	cont "nothing!"
	done

CamperJerrySeenText:
	text "The trainers of"
	line "this GYM use rock-"
	cont "type #MON."

	para "The rock-type has"
	line "high DEFENSE."

	para "Battles could end"
	line "up going a long"

	para "time. Are you"
	line "ready for this?"
	done

CamperJerryBeatenText:
	text "I have to win"
	line "these battles…"
	done

CamperJerryAfterBattleText:
	text "Hey, you! Trainer"
	line "from JOHTO! BROCK"

	para "is tough. He'll"
	line "punish you if you"

	para "don't take him"
	line "seriously."
	done

PewterGymGuideText:
	text "Yo! CHAMP in"
	line "making! You're"

	para "really rocking."
	line "Are you battling"

	para "the GYM LEADERS of"
	line "KANTO?"

	para "They're strong and"
	line "dedicated people,"

	para "just like JOHTO's"
	line "GYM LEADERS."
	done

PewterGymGuideWinText:
	text "Yo! CHAMP in"
	line "making! That GYM"

	para "didn't give you"
	line "much trouble."

	para "The way you took"
	line "charge was really"

	para "inspiring. I mean"
	line "that seriously."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
