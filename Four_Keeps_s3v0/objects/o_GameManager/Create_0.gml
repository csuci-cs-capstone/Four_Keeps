///@description Start game

randomize();

global.tile_size = 32;
global.rounds = 10;
global.curRound = 1;
global.numOfCapturables = 5;

global.phase = 0;
phaseTime = 0;
//currently 10/10/15/20 seems to be best?
timers = [10, 10, 20, 20, 0, 0, 0, 0]; 
//gameTime = 0; //total time game is running. so good for if 10m limit
global.isPaused = false;

game_set_speed(60, gamespeed_fps);
global.gSpeed = game_get_speed(gamespeed_fps);


set_piece_list();

global.map_width = room_width / global.tile_size;
global.map_height = room_height / global.tile_size;


InitializeMap();

InitializePlayers();




clock = instance_create_layer(room_width/2, ( (room_height - o_Temp_Hud_Bottom.sprite_height) /2), "UI", o_Clock);
clock.visible = false;

FloodAll();

audio_channel_num(5);

alarm[0] = 1 * global.gSpeed;







 