///@description Movement



if(can_move){
	if(player != noone && player.can_move){
		
		var xx = x;
		var yy = y;
	
		//up
		if(keyboard_check_pressed(player.keybinds[0])){
			y -= global.tile_size;
		}

		//down
		if(keyboard_check_pressed(player.keybinds[1])){
			y += global.tile_size;
		}

		//left
		if(keyboard_check_pressed(player.keybinds[2])){
			x -= global.tile_size;
		}

		//right
		if(keyboard_check_pressed(player.keybinds[3])){
			x += global.tile_size;
		}

		//switch
		if(keyboard_check_pressed(player.keybinds[4])){
			//TODO: Change into alt cannon types
		}
	
		if(!Valid_move(self)){
			x = xx;
			y = yy;
		}
	
		if(place_empty(x,y)){
			var tx = floor(x/32);
			var ty = floor(y/32);
			if(
				((global.map_grid[ty, tx] % 10) == 1) &&
				((global.map_grid[ty+1, tx] % 10) == 1) &&
				((global.map_grid[ty, tx+1] % 10) == 1) &&
				((global.map_grid[ty+1, tx+1] % 10) == 1)
			)
			{
				image_alpha = 1;
				valid_spot = true;
			}
			else{
				image_alpha = .5;
				valid_spot = false;
			}
		}
		else{
			image_alpha = .5;
			valid_spot = false;
		}
	

		//place cannon
		if(keyboard_check_pressed(player.keybinds[5])){
			if(valid_spot){
				can_move = false;
			
				if(player.saved_cannons > 0){

					var newCannon = instance_create_layer(x, y, "pieces", o_Cannon);
					var temp = player.list_cannons;
					player.list_cannons[player.num_of_cannons] = newCannon;
					newCannon.player = player;
					newCannon.can_move = false;
					
					player.num_of_cannons++;
					player.saved_cannons--;
					
					if(player.saved_cannons <= 0){
						player.can_place_cannon = false;
						player.can_move = false;
						player.cursor = noone;
						instance_destroy(self);
					}
					else{
						layer = layer_get_id("UI");
						can_move = true;
					}
				}
				else{
					player.can_place_cannon = false;
					player.can_move = false;
					player.cursor = noone;
					instance_destroy(self);
				}

			}
		}
	}


}









