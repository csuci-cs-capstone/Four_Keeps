///@description Start game

//randomize the stuff
randomize();

global.tile_size = 32;
global.rounds = 5;
global.curRound = 1;
global.numberOfPlayers = 2;
global.castles = 2;
global.totalWeapons = 4;

global.phase = 0;
phaseTime = 0; //rename to phaseTime?
//currently 10/10/15/20 seems to be best?
timers = [10, 10, 15, 20, 0, 0, 0, 0]; 
gameTime = 0; //total time game is running. so good for if 10m limit

game_set_speed(60, gamespeed_fps);
global.gSpeed = game_get_speed(gamespeed_fps);


set_piece_list();

global.map_width = 40;
global.map_height = 25;

InitializeMap();

//TODO: Make initialize players take num of players
InitializePlayers();

clock = instance_create_layer(640, 400, "UI", o_Clock);
clock.visible = false;

FloodAll();

alarm[0] = 1 * global.gSpeed;






 