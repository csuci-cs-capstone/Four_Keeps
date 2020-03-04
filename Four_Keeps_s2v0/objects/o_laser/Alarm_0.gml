
image_xscale = size*2*velocity;
size += velocity;
		var wall = instance_position(bbox_left,bbox_top,o_TetrisPiece);
		if(wall != noone)
		{
			global.map_grid[floor(bbox_top/32), floor(bbox_left/32)]--;
			instance_destroy(wall);
		}
	
	alarm[0]= velocity*2