///@function CheckCastles()
///@description check players' castles

with(o_Player){
	var tCap;
	num_castles_enclosed = 0;

	for(var i = 0; i < global.numOfCapturables; i++){
		tCap = list_capturables[i];

		var spot = global.map_grid[floor(tCap.y/32), floor(tCap.x/32)];

		if((spot % 10) == 1){
			tCap.enclosed = true;
			if(tCap.object_index == o_Castle){
				num_castles_enclosed++;
			}
		}
		else{
			tCap.enclosed = false;
		}
	}
	
	for(var i = 0; i < num_of_cannons; i++){
		var tCannon = list_cannons[i];

		var spot = global.map_grid[floor(tCannon.y/32), floor(tCannon.x/32)];

		if((spot % 10) == 1){
			tCannon.enclosed = true;
		}
		else{
			tCannon.enclosed = false;
		}
	}
	
}