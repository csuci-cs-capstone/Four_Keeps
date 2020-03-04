//@description create the players

var num_players = 2;
var int p = 0;

if(p < num_players){

	//Player 1
	
	player1 = instance_create_layer(x, y, "UI", o_Player);
	player1.num = 1;
	player1.color = c_red;
	player1.keybinds = [ord("W"), ord("S"), ord("A"), ord("D"), ord("R"), ord("T"),ord("Q"),ord("E")];

	player1.list_castles = [
		P1_Castle1,
		P1_Castle2,
	];

	player1.startX = P1_Castle1.x;
	player1.startY = P1_Castle1.y;
	
	player1.list_cannons[1,0] = P1_Volcano;
	player1.list_cannons[2,0] = P1_Laser;
	player1.list_cannons[3,0] = P1_Mangonel;
	
	p++;
}


if(p < num_players){
	
	//Player 2
	
	player2 = instance_create_layer(x, y, "UI", o_Player);
	player2.num = 2;
	player2.color = c_blue;
	player2.keybinds = [vk_up, vk_down, vk_left, vk_right, vk_rshift, vk_enter,vk_numpad1,vk_numpad2];

	player2.list_castles = [
		P2_Castle1,
		P2_Castle2,
	];

	player2.startX = P2_Castle1.x;
	player2.startY = P2_Castle1.y;

	player2.list_cannons[1,0] = P2_Volcano;
	player2.list_cannons[2,0] = P2_Laser;
	player2.list_cannons[3,0] = P2_Mangonel;
	
	
	p++;

}


with(o_Player){
	for(var i = 0; i < 2; i++){
		list_castles[i].player = self;	
	}
}








