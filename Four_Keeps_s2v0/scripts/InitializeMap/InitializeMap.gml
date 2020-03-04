
/*
//0-9 is general map stuff
0 - land (inaccessable by players to build on)
1 - water


//Player x stuff is from x0-x9
x0 - land
x1 - inside valid area
x2 - wall
x3 - castle
x4 - upgrade objective thingy
x5 - cannon

*/


var tm = "MapGrid";
var curSpot;
var newSpot;

for(var i = 0; i < global.map_width; i++){
	for(var j = 0; j < global.map_height; j++){
		curSpot = tilemap_get((layer_tilemap_get_id("MapGrid")), i, j);
		switch(curSpot){
			case 1:
				newSpot = 0; break;
			case 2:
				newSpot = 1; break;
			case 3: 
				newSpot = 10; break;
			case 6:
				newSpot = 20; break;
			default: 
				newSpot = 0; break;
		}
		
		global.map_grid[j, i] = newSpot;
	}
	
}














