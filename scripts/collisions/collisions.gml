//Script which runs after calculations on x_velocity and y_velocity and allows for collisions with solid objects
//Also actually adds x_velocity and y_velocity to the calling object's x and y positions
function collisions(){
	if(place_meeting(x + x_velocity, y, obj_solid)){
		while(!place_meeting(x + sign(x_velocity), y, obj_solid)){
			x+= sign(x_velocity)
		}
		x_velocity = 0;
	}
	x+=x_velocity;
	
	if(place_meeting(x, y + y_velocity, obj_solid)){
		while(!place_meeting(x, y + sign(y_velocity), obj_solid)){
			y+= sign(y_velocity)
		}
		y_velocity = 0;
	}
	y+=y_velocity;
}