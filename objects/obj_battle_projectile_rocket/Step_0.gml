/// @move projectile



if instance_exists(obj_playerheart) {
	dir = point_direction(x,y,obj_playerheart.x,obj_playerheart.y);
}
image_angle += angle_difference(dir,image_angle) * 0.3;
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
