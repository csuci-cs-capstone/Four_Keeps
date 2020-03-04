///@function CheckCastles()
///@description check players' castles

with(o_Player){
	var tcast;
	num_castles_enclosed = 0;

	for(var i = 0; i < 2; i++){
		tcast = list_castles[i];
		
		var spot = global.map_grid[floor(tcast.y/32), floor(tcast.x/32)];

		if((spot % 10) == 1){
			num_castles_enclosed++;
			tcast.enclosed = true;
			tcast.image_index = 1;
		}
		else if(tcast.enclosed){
			//num_castles_enclosed--;
			tcast.enclosed = false;
			tcast.image_index = 0;
		}

	}
	
	for(var i = 1; i < global.totalWeapons; i++)
	{
			tcast = list_cannons[i,0]; 
			var spot = global.map_grid[floor(tcast.y/32), floor(tcast.x/32)];
				
			if((spot % 10) == 1)
				tcast.enabled = true;

			else if(tcast.enabled)
				tcast.enabled = false;
	}
	
	
	
}