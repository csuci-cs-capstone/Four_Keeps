///SetTimer()

o_GameManager.phaseTime = o_GameManager.timers[global.phase];// * global.gSpeed;
o_GameManager.timerOn = true;
o_GameManager.clock.image_index = o_GameManager.timers[global.phase];
o_GameManager.clock.visible = true;
