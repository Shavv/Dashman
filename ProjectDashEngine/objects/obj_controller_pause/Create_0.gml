/// @description  Declare variables for pause event

// This controller will deactivate all instances in the room
// bisides itself. This means that all instances dissapear when
// being deactivated. The screenshot will be taken before that happens.
// Make sure this controller is in front of everything, even tiles.
pause_key=ord("P")
game_paused = false;        // If game is paused or not
deactivated = false;        // Whether or not the instances in the room have been deactivated
pause_col=make_color_rgb(40,40,40); // Color of the pause screen (darken the screen)
pause_bg = -1;              // Background to draw on the pause menu

scr_global_stuff();         // Call the global variable script to initiate the global vars

