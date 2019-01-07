// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_player
global.__objectDepths[1] = 0; // obj_block
global.__objectDepths[2] = 0; // obj_jumpthru
global.__objectDepths[3] = 0; // obj_cam
global.__objectDepths[4] = 0; // obj_saw
global.__objectDepths[5] = 0; // obj_bullet
global.__objectDepths[6] = 0; // BLUR
global.__objectDepths[7] = 0; // FX_AFTERIMAGE
global.__objectDepths[8] = -100; // FX_bullet_charge
global.__objectDepths[9] = -100; // FX_bullet_charge_2
global.__objectDepths[10] = -100000; // FX_bullet_shot
global.__objectDepths[11] = 0; // POWERUP
global.__objectDepths[12] = -1569246078; // GAME
global.__objectDepths[13] = 1530494976; // obj_background
global.__objectDepths[14] = -2000000; // obj_controller_pause
global.__objectDepths[15] = -2000001; // obj_pause_screen
global.__objectDepths[16] = 0; // obj_AI
global.__objectDepths[17] = 0; // enemy_parent
global.__objectDepths[18] = 0; // test_cannon
global.__objectDepths[19] = 0; // test_projectile
global.__objectDepths[20] = 0; // test_wall
global.__objectDepths[21] = 0; // test_block_spawner
global.__objectDepths[22] = 0; // test_moving_block
global.__objectDepths[23] = 0; // obj_rain
global.__objectDepths[24] = 0; // enemy_eye_bullet
global.__objectDepths[25] = 0; // enemy_eye
global.__objectDepths[26] = 0; // enemy_eye_drone
global.__objectDepths[27] = 0; // enemy_bird_flee
global.__objectDepths[28] = 0; // enemy_bird_target
global.__objectDepths[29] = 0; // enemy_bird
global.__objectDepths[30] = 0; // enemy_brid_diver
global.__objectDepths[31] = 0; // enemy_bird_bomber
global.__objectDepths[32] = -1; // enemy_bird_bullet
global.__objectDepths[33] = -1; // enemy_bird_bomb
global.__objectDepths[34] = 1; // enemy_lizard
global.__objectDepths[35] = 1; // enemy_lizard_jetpack
global.__objectDepths[36] = 1; // enemy_lizard_jetpack_alt
global.__objectDepths[37] = 0; // enemy_spawn
global.__objectDepths[38] = 0; // enemy_border
global.__objectDepths[39] = 0; // obj_electric_field
global.__objectDepths[40] = 0; // obj_electric_field_strong


global.__objectNames[0] = "obj_player";
global.__objectNames[1] = "obj_block";
global.__objectNames[2] = "obj_jumpthru";
global.__objectNames[3] = "obj_cam";
global.__objectNames[4] = "obj_saw";
global.__objectNames[5] = "obj_bullet";
global.__objectNames[6] = "BLUR";
global.__objectNames[7] = "FX_AFTERIMAGE";
global.__objectNames[8] = "FX_bullet_charge";
global.__objectNames[9] = "FX_bullet_charge_2";
global.__objectNames[10] = "FX_bullet_shot";
global.__objectNames[11] = "POWERUP";
global.__objectNames[12] = "GAME";
global.__objectNames[13] = "obj_background";
global.__objectNames[14] = "obj_controller_pause";
global.__objectNames[15] = "obj_pause_screen";
global.__objectNames[16] = "obj_AI";
global.__objectNames[17] = "enemy_parent";
global.__objectNames[18] = "test_cannon";
global.__objectNames[19] = "test_projectile";
global.__objectNames[20] = "test_wall";
global.__objectNames[21] = "test_block_spawner";
global.__objectNames[22] = "test_moving_block";
global.__objectNames[23] = "obj_rain";
global.__objectNames[24] = "enemy_eye_bullet";
global.__objectNames[25] = "enemy_eye";
global.__objectNames[26] = "enemy_eye_drone";
global.__objectNames[27] = "enemy_bird_flee";
global.__objectNames[28] = "enemy_bird_target";
global.__objectNames[29] = "enemy_bird";
global.__objectNames[30] = "enemy_brid_diver";
global.__objectNames[31] = "enemy_bird_bomber";
global.__objectNames[32] = "enemy_bird_bullet";
global.__objectNames[33] = "enemy_bird_bomb";
global.__objectNames[34] = "enemy_lizard";
global.__objectNames[35] = "enemy_lizard_jetpack";
global.__objectNames[36] = "enemy_lizard_jetpack_alt";
global.__objectNames[37] = "enemy_spawn";
global.__objectNames[38] = "enemy_border";
global.__objectNames[39] = "obj_electric_field";
global.__objectNames[40] = "obj_electric_field_strong";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for