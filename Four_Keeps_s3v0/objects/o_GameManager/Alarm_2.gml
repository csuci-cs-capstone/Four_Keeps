/// @description Fire cannons

show_message("Shoot your enemy's walls");

with(o_Player){
	cursor = instance_create_layer(x, y, "UI", o_Reticle);

	cursor.player = self;
	can_move = true;
	cursor.can_move = true;
	
	for(var i = 0; i < global.numOfCapturables; i++){
		list_capturables[i].recharging = false;
	}
	
}

SetTimer();