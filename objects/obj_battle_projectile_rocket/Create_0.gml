/// @description Insert description here
dir = 0;
if instance_exists(obj_playerheart) {
	dir = point_direction(x,y,obj_playerheart.x,obj_playerheart.y);
}

spd = 0.6;
x_velocity = 0;
y_velocity = 0;
alarm[0] = 70;

