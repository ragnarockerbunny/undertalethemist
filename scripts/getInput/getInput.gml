//Script which polls the keyboard and gamepad for input
function getInput(){
	key_right = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh)>0.2);
	key_left = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh)<-0.2);
	key_up = keyboard_check(vk_up) || gamepad_button_check(0, gp_padu) || (gamepad_axis_value(0, gp_axislv)<-0.2);
	key_down = keyboard_check(vk_down) || gamepad_button_check(0, gp_padd) || (gamepad_axis_value(0, gp_axislv)>0.2);
	
	key_rightpressed = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr) || (gamepad_axis_value(0, gp_axislh)>0.2);
	key_leftpressed = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl) || (gamepad_axis_value(0, gp_axislh)<-0.2);
	key_uppressed = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu) || (gamepad_axis_value(0, gp_axislv)<-0.2);
	key_downpressed = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd) || (gamepad_axis_value(0, gp_axislv)>0.2);
	
	key_interact = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face3);
	key_cancel = keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face2);
	key_menu = keyboard_check_pressed(ord("C") || gamepad_button_check_pressed(0, gp_face1));
}