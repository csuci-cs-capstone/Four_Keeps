/// @description Clean up
//this is to allow a pause between phases, and to disable various variables

FloodAll();
CheckEnclosed();
		
//FIXME: This section has overlap, and needs cleaning up

with(o_Player){
	
	if(global.phase == 0){
		if(cursor != noone){
			
			Set_Start_Castle(self);		
			instance_destroy(cursor);
			cursor = noone;
		}
	}
	

	
	if(global.phase == 3){
		if(piece != noone){
			instance_destroy(piece);
			piece = noone;
		}
		
	}
	
	instance_destroy(cursor);
	can_move = false;

	
	
}

instance_destroy(o_Choose);
instance_destroy(o_Reticle);

if(global.phase == 2){
	instance_destroy(o_Projectile);
	with(o_Crater){
		burnTime--;
		//TODO: lower image alpha? blend with more black?
		if(burnTime < 0){
			instance_destroy();
		}
	}
}
else if(global.phase == 4){
	global.phase = 0; 
	global.curRound++;
}


//move to next phase
global.phase++;

//how long you want to wait between each phase
var phaseDelay = 1;
alarm[global.phase] = phaseDelay * global.gSpeed;

//alarm[5] = 1;

