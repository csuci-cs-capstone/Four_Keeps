///@description Place cannons

show_message("Place your cannons");

with(o_Player){
	cursor = instance_create_layer(x-32, y-32, "UI", o_Cannon);
	can_move = true;
	cursor.player = self;
	cursor.can_move = true;
	saved_cannons += (num_castles_enclosed + 1);
	can_place_cannon = true;
}

SetTimer();


