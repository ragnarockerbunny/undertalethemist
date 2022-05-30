//Script which runs after calculations on x_velocity and y_velocity and allows for collisions with solid objects
//Also actually adds x_velocity and y_velocity to the calling object's x and y positions
function collisions(){
	var x_meet = false;
    var y_meet = false;
    var xy_meet = false;
    
    var x_block = false;
    var y_block = false;
    var xy_block = false;
	

    
	if (place_meeting(x + x_velocity, y + y_velocity, obj_solid)) xy_meet = true;
    
	if (place_meeting(x + x_velocity, y, obj_solid))
	{
	    var g = movespeed;
	    while (g > 0)
	    {
	        if (!keyboard_check(input.key_down) and !place_meeting(x + x_velocity, y - g, obj_solid)) { 
				y -= g; 
				y_velocity = 0; 
				break;
			}
	        else if (!keyboard_check(input.key_up) and !place_meeting(x + x_velocity, y + g, obj_solid)) { 
				y += g; 
				y_velocity = 0; 
				break;
			}
	        else {
				g -= 1; 
				continue;
			}
	    }
        
	    x_meet = true;
	    x_block = false;
        
	    if (x_velocity != 0)
	    {
	        var i = x_velocity;
	        var _i = sign(i);
            
	        while (i >= 0 or i <= 0)
	        {
	            if (!place_meeting(x + i, y, obj_solid)) { 
					x_velocity = i; 
					x_block = true; 
					break;
				}
	            else { 
					i -= _i; 
					continue;
				}
	        }
	    }
        
	    if (!x_block) x_velocity = 0
	}
	if place_meeting(x, y + y_velocity, obj_solid)
	{
	    var g = movespeed;
	    while (g > 0)
	    {
	        if (!keyboard_check(input.key_right) and !place_meeting(x - g, y + y_velocity, obj_solid)) { 
				x -= g; 
				x_velocity = 0; 
				break;
			}
	        else if (!keyboard_check(input.key_left) and !place_meeting(x + g, y + y_velocity, obj_solid)) { 
				x += g; 
				x_velocity = 0; 
				break;
			}
	        else { 
				g -= 1; 
				continue; 
			}
	    }
        
	    y_meet = true;
	    y_block = false;
        
	    if (y_velocity != 0)
	    {
	        var i = y_velocity;
	        var _i = sign(i);
            
	        while (i >= 0 or i <= 0)
	        {
	            if (!place_meeting(x, y + i, obj_solid)) { 
					y_velocity = i; 
					y_block = true; 
					break; 
				} else { 
					i -= _i; 
					continue;
				}
	        }
	    }
        
	    if (!y_block) y_velocity = 0;
	}
    
	if place_meeting(x + x_velocity, y + y_velocity, obj_solid)
	{
	    xy_meet = true;
	    xy_block = false;
        
	    var i = x_velocity;
	    var j = y_velocity;
	    var _i = sign(i);
	    var _j = sign(j);
        
	    while i != 0 or j != 0
	    {
	        if (!place_meeting(x + i, y + j, obj_solid)) { 
				x_velocity = i; 
				y_velocity = j; 
				xy_block = true; 
				break;
			}
	        else
	        {
	            if (abs(i) >= 1 and i != 0) i -= _i;
	            else i = 0;
                
	            if (abs(j) >= 1 and j != 0) j -= _j;
	            else j = 0;
                
	            continue;
	        }
	    }
        
	    if !xy_block { 
			x_velocity = 0; 
			y_velocity = 0; 
		}
	}
	
	
	x+=x_velocity;
	y+=y_velocity;
	exit;
}

function collisions_simple(){
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
