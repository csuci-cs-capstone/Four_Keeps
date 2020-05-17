var spot = global.map_grid[floor(y/32), floor(x/32)];
spot /= 10;
if( (spot == 1) || (spot == 1) || (spot == 2)){ 
	instance_create_layer(x,y,"pieces",o_Crater);
}


