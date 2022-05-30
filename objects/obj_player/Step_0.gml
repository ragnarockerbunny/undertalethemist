/// @Execute State Machine and Control Constantly Updating Variables
depth = -y;

if(obj_game.game_state == BATTLE) state = playerstate_freeze;
script_execute(state);
