/// @Initialize game and macros
//MACRO DEFINITIONS
//Animation and Cardinal Direction Macros, used for animating actors
	#macro RIGHT 0
	#macro UP 1
	#macro LEFT 2
	#macro DOWN 3
//Battle Object Macros, used  states from the Battle Object
	#macro MAIN 0 
	#macro FIGHT 1
	#macro ACT 2
	#macro ITEM 3
	#macro MERCY 4
	#macro FLEE 5
	#macro CHOOSE_ENEMY 6
	#macro WIN 7
	#macro LOSE 8
	#macro PLAYER_ATTACK 9
	#macro ENEMY_ATTACK 10
//Game State Macros
	#macro ADVENTURE 0
	#macro BATTLE 1
	#macro MENU 2
//Main Menu Macros
	#macro FADEIN 0
	#macro PRESSSTART 1
	//reuse MENU 2 Macro

//Initialize Game Variables
player_maxhp = 10;
player_level = 1;
player_hp = player_maxhp;
player_attack = 1;
game_state = ADVENTURE;
