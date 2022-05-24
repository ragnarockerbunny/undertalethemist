// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerstate_move(){
	//Movement
	var move_x = (input.key_right - input.key_left);
	var move_y = (input.key_down - input.key_up);
	dir = point_direction(0, 0, move_x, move_y);
	x_velocity = move_x * movespeed;
	y_velocity = move_y * movespeed;
	//Collisions
	collisions();
	//Animation
	if(move_x != 0 || move_y!=0){
			facing = round((dir/360)*4);
			if(facing == 4) facing = 0;
	}
	switch(facing){
			case RIGHT:
				sprite_index = spr_gaster_idle_right;
				break;
			case LEFT:
				sprite_index = spr_gaster_idle_left;
				break;
			case UP:
				sprite_index = spr_gaster_idle_up;
				break;
			case DOWN:
				sprite_index = spr_gaster_idle_down;
				break;
	}
}