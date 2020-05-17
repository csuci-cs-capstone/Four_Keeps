///@function FloodAll()


//TODO: add parameter to be used when players play a piece;
//this is so that if player 1 sets a piece, the entire map doesn't need
//to be checked?


var curSpot;
var newSpot;

var checklist = ds_stack_create();

var checked; //boolean 2d array for if a spot is checked
for(var i = 0; i < global.map_width; i++){
	for(var j = 0; j < global.map_height; j++){
		checked[j, i] = false;
	}
}

//check the perimeter and all spots not enclosed
ds_stack_push(checklist, 0);
while(!ds_stack_empty(checklist)){
	curSpot = ds_stack_pop(checklist);
	var xx = floor(curSpot % global.map_width);
	var yy = floor(curSpot / global.map_width);
	
	if(!checked[yy, xx]){
		checked[yy, xx] = true;
		
		//check spots around current spot
		for(var i = -1; i <= 1; i++){
			for(var j = -1; j <= 1; j += 1){

				if( ( xx+i < 0) || (xx+i >= global.map_width) || (yy+j < 0) || (yy+j >= global.map_height) ){
					//out of bounds
				}
				else if(!checked[yy+j, xx+i]){
					
					newSpot = global.map_grid[yy+j, xx+i];
					var pNum = floor(newSpot / 10);	
					var tValue = (newSpot % 10);	
					
					switch(tValue){	
						case 0: //normal land
							ds_stack_push(checklist, (xx+i) + ((yy+j)*global.map_width) );
							break;
						case 1: //river or interior
							if(pNum != 0){
								tValue = 0;
							}
							global.map_grid[yy+j, xx+i] = ((10*pNum) +tValue);
							ds_stack_push(checklist, (xx+i) + ((yy+j)*global.map_width) );
							break;
						case 2: //wall
							if(pNum != 0){
								tValue = 2;
							}
							//BUG: Is it here that the wrong colors get set?
							checked[yy+j, xx+i] = true;
							global.map_grid[yy+j, xx+i] = ((10*pNum) + tValue);
							break;
						default: //cannon, castle, etc
							global.map_grid[yy+j, xx+i] = (10*pNum);
							ds_stack_push(checklist, (xx+i) + ((yy+j)*global.map_width) );
							break;
					}

				}
			}
		}
	}
}

//at this point, the only unchecked spots should be interiors
//so this will go through and change them accordingly
for(var xx = 0; xx < global.map_width; xx++){
	for(var yy = 0; yy < global.map_height; yy++){
		if(!checked[yy, xx]){
			checked[yy, xx] = true;
			curSpot = global.map_grid[yy, xx];
			
			var pNum = floor(curSpot / 10);
			//BUG: Is it here that the wrong colors get set?
			global.map_grid[yy, xx] = ((10*pNum) + 1);
		}
	}
	
}

for(var xx = 0; xx < global.map_width; xx++){
	for(var yy = 0; yy < global.map_height; yy++){
		var gridValue = global.map_grid[yy, xx];
		var newTile = 0;

		if(gridValue == 0){
			newTile = 1;
		}
		else if(gridValue == 1){
			newTile = 2;
		}
		else{
			var pNum = floor(gridValue / 10);
			var tValue = (gridValue % 10);
			if(tValue == 0){
				tValue = 2;
			}
			else if( (tValue >= 1) && (tValue <= 5)){
				tValue = 1;
			}

			//BUG: Is it here that the wrong colors get set?
			newTile = ((3*pNum) + tValue);
		}

		tilemap_set(layer_tilemap_get_id("tl_build"), newTile, xx, yy);
		
	}	
}
			





