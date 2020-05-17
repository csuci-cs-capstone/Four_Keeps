///@description Movement


if(can_move){
	if( (player != noone) && (player.can_move) ){
	
		//next
		if(keyboard_check_pressed(player.keybinds[0]) || keyboard_check_pressed(player.keybinds[2])){
			capNum++;
			if(capNum >= global.numOfCapturables){
				capNum = 0;
			}
			while(player.list_capturables[capNum].object_index != o_Castle){
				capNum++;
				if(capNum >= global.numOfCapturables){
					capNum = 0;
				}
			}
			
			x = player.list_capturables[capNum].x;
			y = player.list_capturables[capNum].y;
		}

		//previous
		else if(keyboard_check_pressed(player.keybinds[1]) || keyboard_check_pressed(player.keybinds[3])){
			capNum--;
			if(capNum < 0){
				capNum = (global.numOfCapturables-1);
			}
			while(player.list_capturables[capNum].object_index != o_Castle){
				capNum--;
				if(capNum < 0){
					capNum = (global.numOfCapturables-1);
				}
			}
			
			x = player.list_capturables[capNum].x;
			y = player.list_capturables[capNum].y;
		}
		player.x = x;
		player.y = y;
		
		//choose starting castle
		if(keyboard_check_pressed(player.keybinds[5])){
			Set_Start_Castle(player);
			instance_destroy(self);
		}
	}
}
