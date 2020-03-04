
if(fired){
	move_towards_point(targetX, targetY, velocity);
	fired = false;
}

if(!Valid_move(self)){
	instance_destroy(self);
	source.cooldown = false;
}

else if( distance_to_point(targetX,targetY) <= global.tile_size ){
			var wall = instance_position(x, y, o_TetrisPiece);
		if(wall != noone)
		{
			global.map_grid[floor(y/32), floor(x/32)]--;
			instance_destroy(wall);
		}
	source.cooldown = false;
	instance_destroy(self);
}

