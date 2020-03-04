///@description Choose Castle

show_message("Choose your castle.");

with(o_Player){
	cursor = instance_create_layer(startX, startY, "UI", o_Choose);
	cursor.player = self;
	can_move = true;
	cursor.can_move = true;
	move_snap(32, 32);
}

SetTimer();




