/// @description Insert description here
var start_x = 0;
var start_y = 0;
var object_following =-1;
if(instance_exists(obj_player)){
	start_x = obj_player.x;
	start_y = obj_player.y;
	object_following =obj_player;
}
//camera_destroy(view_camera[0]);
if(room!= rm_mainmenu){
	view_visible[0] = true;
	view_enabled = true;
	camera_destroy(view_camera[0]);
	view_camera[0] = camera_create_view(start_x, start_y, view_width, view_height, 0, object_following, -1, -1, view_width/2, view_height/2);
}
