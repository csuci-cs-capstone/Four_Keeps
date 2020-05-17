///@description Build

show_message("Build your walls and fill any gaps");


with(o_Player){

	var range = ds_list_size(global.tPieces)-1;
	if(global.curRound <2){
		range = 2;
	}
		
	piece = instance_create_layer(x, y, "pieces", ds_list_find_value(global.tPieces, irandom_range(0,range)));
	piece.player = self;
	piece.can_move = true;
	can_move = true;
}

SetTimer();


