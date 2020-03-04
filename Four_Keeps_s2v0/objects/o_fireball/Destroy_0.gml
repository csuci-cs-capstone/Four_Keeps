/// @description 
// check around when destroyed to see if walls are there and destroy any in that range

instance_create_layer(x,y,"pieces",o_explosion);
for(j = -1; j <= 1; j++)
{
yy = (y + global.tile_size * j);
	for(i = -1; i <= 1; i++)
	{
		xx = (x + global.tile_size * i);
			var wall = instance_position(xx, yy, o_TetrisPiece);
		if(wall != noone)
		{
			global.map_grid[floor(yy/32), floor(xx/32)]--;
			instance_destroy(wall);
		}
	}
}
