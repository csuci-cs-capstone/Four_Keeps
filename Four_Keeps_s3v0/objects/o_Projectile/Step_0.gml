 
if(fired){
	move_towards_point(targetX, targetY, velocity);
	image_angle += point_direction(targetX,targetY,x,y); 
	fired = false; 
}

if(!Valid_move(self)){
	source.alarm[0] = (source.cooldown * global.gSpeed) + 1;
	instance_destroy();
}
else if ( (abs( targetX - x) <= 4) && (abs( targetY - y) <= 4) ){

	var wall = instance_position(targetX, targetY, o_TetrisPiece);
	if(wall != noone){
		global.map_grid[floor(targetY/32), floor(targetX/32)]--;
		instance_destroy(wall);
	}
	
	source.alarm[0] = (source.cooldown * global.gSpeed) + 1;
	instance_destroy();
}


