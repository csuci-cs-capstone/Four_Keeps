///@function Set_start_Castle(player)
///@description setup the starting castle locatoin

var myPlayer = argument0;

myPlayer.can_move = false;
			
var curPiece = instance_create_layer(myPlayer.x, myPlayer.y, "pieces", o_Single);
curPiece.player = myPlayer;
		
//create walls around the castle
with(curPiece){
				                      				
	x -= (32*4);
	y -= (32*4);
	
	if(place_empty(x,y)){
		Add_Piece(self);
	}
	
	for(var i = 0; i < 7; i++){
		x += 32;
		if(place_empty(x,y)){
			Add_Piece(self);
		}	
	}
			
	for(var j = 0; j < 7; j++){
		y += 32;	
		if(place_empty(x,y)){
			Add_Piece(self);
		}
	}
	for(var i = 0; i < 7; i++){
		x -= 32;
		if(place_empty(x,y)){
			Add_Piece(self);
		}	
	}
			
	for(var j = 0; j < 6; j++){
		y -= 32;
		if(place_empty(x,y)){
			Add_Piece(self);
		}
	}

	instance_destroy(curPiece);
}

audio_play_sound(snd_Default1, 1, false);
			
FloodAll();
CheckEnclosed();











