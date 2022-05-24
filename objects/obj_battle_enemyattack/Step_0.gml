/// @Manage Enemy Attack
timer++;

if(obj_game.player_hp<=0){
	obj_battlecontroller.state = LOSE;
	instance_destroy();
}

var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);

//Placement of Battle Square, ie. the square the battle takes place in during the enemy's attack
var battle_square_start_x = xx+115;
var battle_square_start_y = yy+139;
var battle_square_end_x = xx+204;
var battle_square_end_y = yy+204;

//Player Limit. Limits Player to square on screen
var playerlim_x1 = battle_square_start_x;
var playerlim_x2 = battle_square_end_x-14;
var playerlim_y1 = battle_square_start_y;
var playerlim_y2 = battle_square_end_y-14;

if(instance_exists(obj_playerheart)){
	obj_playerheart.x = clamp(obj_playerheart.x, playerlim_x1, playerlim_x2);
	obj_playerheart.y = clamp(obj_playerheart.y, playerlim_y1, playerlim_y2);
}

//Create Projectiles/Damage Objects
switch(obj_battlecontroller.enemy_sprite){
	case spr_enemy_test:
		if(timer%25 == 0){
			instance_create_depth(battle_square_start_x, irandom_range(battle_square_start_y+8, battle_square_end_y-8,), depth-1, obj_battle_projectile_orb)
		}
		break;
	case spr_enemy_test_cube:
		if(timer%25 == 0){
			instance_create_depth(battle_square_start_x, irandom_range(battle_square_start_y+8, battle_square_end_y-8,), depth-1, obj_battle_projectile_orb)
		}
		break;
	case spr_enemy_test_weirdmonster:
		if(timer%25 == 0){
			instance_create_depth(choose(battle_square_start_x,battle_square_end_x),choose(battle_square_start_y,battle_square_end_y),depth -1,obj_battle_projectile_rocket)
		}
		break;
}
