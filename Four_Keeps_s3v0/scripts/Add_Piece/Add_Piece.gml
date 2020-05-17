///@function Add_Piece(object)

var curObject = argument0;
		
with(curObject){
	var startX = bbox_left;
	var startY = bbox_top;

	var endX = bbox_right;
	var endY = bbox_bottom;
	
	for(var yy = startY; yy < endY; yy += 32){
		for(var xx = startX; xx < endX; xx += 32){
			var newPiece = instance_create_layer(xx, yy, "pieces", o_Single);
		
			if(place_meeting(x, y, newPiece)){
				//BUG: Is this where the wrong tile colors are being added?
				global.map_grid[floor(yy/32), floor(xx/32)] = ((10*player.num) + 2);
				newPiece.player = player;
				newPiece.image_alpha = 0.8;
				newPiece.image_blend = -1;
				newPiece.depth = 0;
			}
			else{
				instance_destroy( newPiece );
			}
		
		}
	}
}




