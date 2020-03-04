/// @description Fire cannons

show_message("Shoot your enemy's walls");

with(o_Player){
	cursor = instance_create_layer(startX, startY, "UI", o_Reticle);

	cursor.player = self;
	can_move = true;
	cursor.can_move = true;
	laser = list_cannons[2,0];
	laser.cooldown = false;
}

SetTimer();