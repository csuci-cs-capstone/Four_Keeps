///@function Valid_move( object )
///@decription checks if the object's move was valid
///@param object object to check

var valid = true;
var object = argument0;
	
//TODO: make it adjust to take into account the border
if( (object.x < 0) || (object.x > room_width) || (object.y < 0) || (object.y > room_height) ){
	valid = false;
	
}


return valid;