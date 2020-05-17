list_players[0].layer = layer_get_id("UI");
list_players[1].layer = layer_get_id("UI");

list_players[0].list_capturables[0] = p1_capture1;
list_players[0].list_capturables[1] = p1_capture2;
list_players[0].list_capturables[2] = p1_capture3;
list_players[0].list_capturables[3] = p1_capture4;
list_players[0].list_capturables[4] = p1_capture5;
	
list_players[1].list_capturables[0] = p2_capture1;
list_players[1].list_capturables[1] = p2_capture2;
list_players[1].list_capturables[2] = p2_capture3;
list_players[1].list_capturables[3] = p2_capture4;
list_players[1].list_capturables[4] = p2_capture5;
	
var list_cap_values = [];
for(var i = 0; i < 3; i++){
	list_cap_values[i] = irandom(3);
}

	
with(o_Player){
	x = list_capturables[0].x;
	y = list_capturables[0].y;
	
	for(var i = 0; i < global.numOfCapturables; i++){
		var curCap = list_capturables[i];
		
		with(curCap){
			if((i == 0) || (i == 1)){
				instance_change(o_Castle, true);
			}
			else{
				if(list_cap_values[i-2] == 0){
					instance_change(o_Castle, true);
				}
				else if(list_cap_values[i-2] == 1){
					instance_change(o_Volcano, true);
				}
				else if(list_cap_values[i-2] == 2){
					instance_change(o_Trebuchet, true);
				}
				else if(list_cap_values[i-2] == 3){
					instance_change(o_Ballista, true);
				}
			
			}
		}
		
		curCap.player = self;
		curCap.image_index = curCap.player.num-1;
		
	}	
}