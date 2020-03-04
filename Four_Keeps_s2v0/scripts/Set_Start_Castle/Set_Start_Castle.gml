///@function Set_start_Castle(cursor)
///@description setup the starting castle locatoin

//FIXME: HACK: Uses the cursor but thats a horrible way to do it

var myCursor = argument0;
var myPlayer = myCursor.player;


myPlayer.can_move = false;
myPlayer.startX = myCursor.x;
myPlayer.startY = myCursor.y;
myPlayer.cursor = noone;
			
			
var curPiece = instance_create_layer(myCursor.x, myCursor.y, "pieces", o_Single);
curPiece.player = myPlayer;
		
//create walls around the castle
with(curPiece){
				                      				
	x -= (32*4);
	y -= (32*4);
					
	Add_Piece(self);

	for(var i = 0; i < 7; i++){
		x += 32;
		Add_Piece(self);		
	}
			
	for(var j = 0; j < 7; j++){
		y += 32;
		Add_Piece(self);
	}
	for(var i = 0; i < 7; i++){
		x -= 32;
		Add_Piece(self);		
	}
			
	for(var j = 0; j < 6; j++){
		y -= 32;
		Add_Piece(self);
	}

	instance_destroy(curPiece);
}
			
FloodAll();
CheckEnclosed();
			

instance_destroy( myCursor );











