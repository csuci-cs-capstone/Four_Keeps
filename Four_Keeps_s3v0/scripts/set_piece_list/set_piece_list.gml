var i = 0;
global.tPieces = ds_list_create();
while (true){
     if (!object_exists(i)){
		 break; //stop loop if reached last object index
	 }
     else if (object_is_ancestor(i,o_TetrisPiece) ){
		 ds_list_add(global.tPieces,i);
	 }
     i++;
}