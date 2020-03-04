///@description Movement


if(can_move){
	if( (player != noone) && (player.can_move) ){
	
		//next
		if(keyboard_check_pressed(player.keybinds[0]) || keyboard_check_pressed(player.keybinds[2])){
			player.starting_castle++;
			if(player.starting_castle > 1){
				player.starting_castle = 0;
			}
		}

		//previous
		else if(keyboard_check_pressed(player.keybinds[1]) || keyboard_check_pressed(player.keybinds[3])){
			player.starting_castle--;
			if(player.starting_castle < 0){
				player.starting_castle = 1;
			}
		}
			
		x = player.list_castles[player.starting_castle].x;
		y = player.list_castles[player.starting_castle].y;
				
		//choose starting castle
		if(keyboard_check_pressed(player.keybinds[5])){
			Set_Start_Castle(self);
		}
	}
}

	
	


