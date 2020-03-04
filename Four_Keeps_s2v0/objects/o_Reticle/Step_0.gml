///@description Movement

var xx = x;
var yy = y;

if(player.can_move){

	//faster
	if(keyboard_check(player.keybinds[4])){
		move_speed = 8;
	}
	else{
		move_speed = 4;	
	}
	
	//up
	if(keyboard_check(player.keybinds[0])){
		y -= move_speed;
	}

	//down
	if(keyboard_check(player.keybinds[1])){
		y += move_speed;
	}

	//left
	if(keyboard_check(player.keybinds[2])){
		x -= move_speed;
	}

	//right
	if(keyboard_check(player.keybinds[3])){
		x += move_speed;
	}

	if(!Valid_move(self)){
		x = xx;
		y = yy;
	}
	
	var curTurret = player.current_turret;
	//rotate through other turrets if avaliable
	if(keyboard_check_pressed(player.keybinds[6]))
	{
		do{
			player.current_turret--;
			if(player.current_turret < 0)
				{
					player.current_turret = global.totalWeapons-1;
				}
			var curCannon = player.list_cannons[player.current_turret,0];
		}until((curCannon != noone) && (curCannon.enabled))

	}
	
	if(keyboard_check_pressed(player.keybinds[7]))
	{
		do{
			player.current_turret++;
			if(player.current_turret > global.totalWeapons-1)
				{
					player.current_turret = 0;
				}
			var curCannon = player.list_cannons[player.current_turret,0];
		}until((curCannon != noone) && (curCannon.enabled))
	}
	
	if(curTurret != player.current_turret){
		var sName = "s_Reticle";
		switch( player.current_turret ){
			case 0:
				sName = "s_Reticle"; break;
			case 1:
				sName = "s_target_volcano"; break;
			case 2:
				sName = "s_target_laser"; break;
			case 3:
				sName = "s_target_mangonel"; break;
			default:
				sName = "s_Reticle"; break;
		}
		sprite_index = asset_get_index(sName);
	}
		
		
	//fire
	if(keyboard_check_pressed(player.keybinds[5])){
		var fired = false;
		//volcano/AOE
		if(player.current_turret == 1)
		{
			var curCannon = player.list_cannons[1,0];
			if( (curCannon.enabled) && (!curCannon.cooldown) ){
				ball = 	instance_create_layer(curCannon.x, curCannon.y, "pieces", o_fireball);
				ball.targetX = x;
				ball.targetY = y;
				ball.source = curCannon;
				ball.fired = true;
			
				curCannon.cooldown = true;				
				fired = true;
			}
		}
		//laser/ one time straight line, will add more interactions with this later
		else if(player.current_turret == 2)
		{
			var curCannon = player.list_cannons[2,0];
			if( (curCannon.enabled) && (!curCannon.cooldown)  )
			{
				laser = instance_create_layer(curCannon.x+global.tile_size/2, curCannon.y+global.tile_size/2, "pieces", o_laser);
				laser.image_angle = point_direction(curCannon.x,curCannon.y,x,y);
				laser.source = curCannon;
				curCannon.cooldown = true;
				fired = true;
			}
			
		}
				//mangonel, random AOE
		if(player.current_turret == 3)
		{
			var curCannon = player.list_cannons[3,0];
			if( (curCannon.enabled) && (!curCannon.cooldown) && (curCannon.enabled) ){
				//create 6 small rocks with random targets
			for(i = 0; i < 3; i++)
			{
			randomize();
			rock = instance_create_layer(curCannon.x,curCannon.y,"pieces",o_Rock);
			rock.targetX = random_range(x-100,x+100);
			rock.targetY = random_range(y-100,y+100);
			rock.source = curCannon;
			rock.fired = true;
			//make it shoot in intervals
			for(timer = room_speed*0.5; timer < 0; timer--)
			{			}

			}

			curCannon.cooldown = true;				
			fired = true;
			}
		}

		//default turret
		else
		{	
			for(var i = 0; (i < player.num_of_cannons) && (!fired); i++){
				var curCannon = player.list_cannons[0,i];
			
				//if the cannon is not killed or outside walls and not on cooldown
				if( (curCannon.enabled) && (!curCannon.cooldown) ){
					ball = instance_create_layer(curCannon.x, curCannon.y, "pieces", o_Ball)
					ball.targetX = x;
					ball.targetY = y;
					ball.source = curCannon;
					ball.fired = true;

					curCannon.cooldown = true;				
					fired = true;
				}	
			}
		}	
	}

}