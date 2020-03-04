///@description projectile

if(fired){
	move_towards_point(targetX, targetY, velocity);
	fired = false;
}

if(!Valid_move(self)){
	instance_destroy(self);
	source.cooldown = false;
}

else if( distance_to_point(targetX,targetY) = 0 ){
	source.cooldown = false;
	instance_destroy(self);
}


