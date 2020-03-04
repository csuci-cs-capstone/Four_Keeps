/// @description Clean up
//this is to allow a pause between phases, and to disable various variables

FloodAll();
CheckEnclosed();
		
//FIXME: This section has overlap, and needs cleaning up

with(o_Player){
	
	if(cursor != noone){
		if(global.phase == 0){
			Set_Start_Castle(cursor);
		}
		instance_destroy(cursor);
		cursor = noone;
	}
	
	if(global.phase == 3){
		if(piece != noone){
			instance_destroy(piece);
			piece = noone;
		}
		
		if(num_castles_enclosed <= 0){
			hp--;	
		}	
	}
	
	can_move = false;
	
	if(global.phase == 4){
		global.phase = 0; 
		global.curRound++;
	}
	
}


//move to next phase
global.phase++;

//how long you want to wait between each phase
var phaseDelay = 1;
alarm[global.phase] = phaseDelay * global.gSpeed;

//alarm[5] = 1;
