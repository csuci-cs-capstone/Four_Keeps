///@description Movement



if(can_move){
	
	if(!place_snapped(global.tile_size,global.tile_size)){
		move_snap(global.tile_size, global.tile_size);
	}
	
	if(player != noone){
		pColor = player.color;	
	}
	
	if( (player != noone) && (player.can_move) ){
		
		var xx = x;
		var yy = y;
	
		//up
		if(keyboard_check_pressed(player.keybinds[0])){
			y -= global.tile_size;
		}

		//down
		else if(keyboard_check_pressed(player.keybinds[1])){
			y += global.tile_size;
		}

		//left
		else if(keyboard_check_pressed(player.keybinds[2])){
			x -= global.tile_size;
		}

		//right
		else if(keyboard_check_pressed(player.keybinds[3])){
			x += global.tile_size;
		}

		//rotate
		else if(keyboard_check_pressed(player.keybinds[4])){
			image_index++;
		}

		if( !Valid_move( self ) ){
			x = xx;
			y = yy;
		}
		
		if(place_empty(x,y)){
			valid_spot = true;
			
			image_alpha = 1;
		}
		else{
			valid_spot = false;
			
			image_alpha = 0.5;
		}

		//place
		if(keyboard_check_pressed(player.keybinds[5])){
			if(valid_spot){	
				Add_Piece(self);

				var range = ds_list_size(global.tPieces)-1;
				if(global.curRound < 2){
					range = 2;
				}
		
				//TODO: This can just change the piece's sprite
				var newPiece = instance_create_layer(x, y, "pieces", ds_list_find_value(global.tPieces, irandom_range(0,range)));
				player.piece = newPiece;
				newPiece.player = player;
				newPiece.can_move = true;

				FloodAll();
				CheckEnclosed();
				
				instance_destroy(self);
				
			}
		}

	}
}











