// Oscillate the cursor using sin function
cursorLevitate = dsin(cursorTime);

// Use this as an "angle" to use in the sin function
// to oscillate cursor
cursorTime += leviRate;


// Vertical input is determined by the press of up
// and down buttons
var vert =  keyboard_check_pressed(downButt) -  keyboard_check_pressed(upButt);

// Move cursor up or down depending on inputs
selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement

// Don't let cursor move past where it should be
selected = clamp(selected, 0, array_length_1d(menu) - 1);

// Whenever you press the confirm button, do whatever
// it should do depending on what menu element is selected
if(keyboard_check_pressed(confirmButt)){
	if(selected == 0){
		room_goto(rm_game);
	}
	
	//Instructions
	if(selected == 1){
		
		show_message(
"Four Keeps is a competitive multiplayer strategy game where players use turrets "+
"and cannons to destroy each others’ castle walls.\n\n"+

"Players start the game as the lord of a keep surrounded by castle walls. "+
"They place a few cannons inside their walls and fire them at their enemy’s "+
"walls to destroy them. The then players then build new walls using a random "+
"selection of polyominoes (Tetris-like shapes). Once the rebuild phase is "+
"over, should a player not have a keep enclosed in walls, that player’s keep "+
"has been breached and they lose a life. The round then cycles back to placing "+
"cannons and repeats. The first player to run out of lives, loses.\n\n"+

"Defend your keep, and defeat the enemy lord!");

	
	}
	
	// Controls
	if(selected == 2){
		show_message(
"\tPlayer 1: \t\t Player 2:\n"+
"============================\n"+
"Up \t     W     \t\t   NumPad 8  \n"+
"Left \t     A    \t\t   NumPad 4  \n"+
"Down \t     S    \t\t   NumPad 2  \n"+
"Right \t     D   \t\t   NumPad 6 \n\n"+

"Select \t     T  \t\t   Enter \n\n"+

"Move \n"+
"Faster \t     Y  \t\t   NumPad 5 \n"+
"(Hold) \n\n"+

"Previous \n"+
"Weapon \t     Q  \t\t   NumPad 7 \n"+
"Next \n"+
"Weapon \t     E  \t\t   NumPad 9 \n"+

"Main Menu \t\t\t M"+

"");
	}
	
	//About
	if(selected == 3){
		show_message(
"Four Keeps was created by Devan Recalde and Joshua Chapin as our capstone project for CSU Channel "+
"Islands from Fall 2019 to Spring 2020.\n\n"+

"Our game was inspired by the gameplay of Rampart, and our music "+
"and art were bought from asset stores. The exception to this is our cover picture, which we found using "+
"google images. We thank everyone who helped us in our development, our professor Eric Kaltman for his "+
"patience and guidance, and to you for taking the time to view our game."+

"");
	}
	
	//Quit
	if(selected == 4){
		game_end();
	}
	
}