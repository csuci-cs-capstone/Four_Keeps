///@description Game Over

show_message("Checking castle saftey...");

//TODO: if we want to allow for multiple hp, we'll have to 
//reset only the correct player's side, and
//allow them to do phase 0 again

FloodAll();
CheckEnclosed();

with(o_Player){
	if(num_castles_enclosed <= 0){
		hp--;
	}
	
}

if( (player1.hp <= 0) && (player2.hp <= 0 ) ){
	//draw or both players have 1 life and restart
	show_message("No one has a safe castle. Try again");
	player1.hp = 1;
	player2.hp = 1;
	global.phase = 3;
	alarm[3] = 1 * global.gSpeed;
		
}
else if(player1.hp <= 0){
	show_message("Player 2 wins!");
	room_goto(rm_main)
}
else if(player2.hp <= 0){
	show_message("Player 1 wins!");
	room_goto(rm_main)
}
else{

	alarm[6] = 1 * global.gSpeed;	
}
