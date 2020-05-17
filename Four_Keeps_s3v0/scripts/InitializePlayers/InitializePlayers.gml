//@description create the players

var num_players = 2;
var int p = 0;

//Player 1
if(p < num_players){
	player1 = instance_create_layer(x, y, "UI", o_Player);
	
	player1.num = 1;
	player1.color = c_red;
	player1.keybinds = [ord("W"), ord("S"), ord("A"), ord("D"), ord("Y"), ord("T"),ord("Q"),ord("E")];

	player1.list_capturables[0] = p1_capture1;
	player1.list_capturables[1] = p1_capture2;
	player1.list_capturables[2] = p1_capture3;
	player1.list_capturables[3] = p1_capture4;
	player1.list_capturables[4] = p1_capture5;
	
	p++;
}

//Player 2
if(p < num_players){
	player2 = instance_create_layer(x, y, "UI", o_Player);
	
	player2.num = 2;
	player2.color = c_blue;
	player2.keybinds = [vk_numpad8, vk_numpad2, vk_numpad4, vk_numpad6, vk_add, vk_enter,vk_numpad7,vk_numpad9];

	player2.list_capturables[0] = p2_capture1;
	player2.list_capturables[1] = p2_capture2;
	player2.list_capturables[2] = p2_capture3;
	player2.list_capturables[3] = p2_capture4;
	player2.list_capturables[4] = p2_capture5;
	
	p++;
}

var list_cap_values = [];

for(var i = 0; i < 3; i++){
	list_cap_values[i] = irandom(3);
}

with(o_Player){
	x = list_capturables[0].x;
	y = list_capturables[0].y;
	
	for(var i = 0; i < global.numOfCapturables; i++){
		var curCap = list_capturables[i];
		//curCap.player = self;
		
		
		with(curCap){
			if((i == 0) || (i == 1)){
				instance_change(o_Castle, true);
				//curCap.image_index = curCap.player.num-1;
			}
			else{
				if(list_cap_values[i-2] == 0){
					instance_change(o_Castle, true);
					//curCap.image_index = curCap.player.num-1;
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











