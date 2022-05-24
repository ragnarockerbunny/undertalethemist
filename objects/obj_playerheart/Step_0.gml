/// @Execute State Machine and Control Constantly Updating Variables

//Movement
var move_x = (input.key_right - input.key_left);
var move_y = (input.key_down - input.key_up);
//dir = point_direction(0, 0, move_x, move_y);
x_velocity = move_x * movespeed;
y_velocity = move_y * movespeed;

x+=x_velocity;
y+=y_velocity;
