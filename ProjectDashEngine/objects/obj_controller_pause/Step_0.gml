/// @description  Check for pause key pressed / unpause
if instance_exists(obj_player)
{
 pause_key=obj_player.key_pause
 pad_pause=obj_player.pad_pause
}


if keyboard_check_pressed(pause_key) or pad_pause
  {
  // This makes sure we press the pause key once
  io_clear();
  // Pause or unpause depending on the visibility of the controller
  if (visible = false)
    {
    // Set global variables before starting the pausing process
    // Basically, you get the private variables of the objects
    // you wish here to store them in a global variable which can
    // be read by your objects after the pause screen is shown.
    
    //with obj_something
    //  {
    //  global.anim_count = my_anim_count;
    //  }
    // Tell this controller to pause the game
    visible = true;
    game_paused = true;
    }
  else
    {game_paused = false;}
  }

if (visible = false) {exit;}

// Show any other objects on the pause screen
if (game_paused = true && deactivated = true)
  {
  // Add an object in the pause screen
  if (!instance_exists(obj_pause_screen))
    {
    instance_create(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),obj_pause_screen);
    }
  }

// Reactivate all instances and unpause
if (game_paused = false && deactivated = true)
  {
  // Destroy any instances that were visible on the pause screen
  if (instance_exists(obj_pause_screen))
    {
    with obj_pause_screen {instance_destroy();}
    }
  // Free memory of background data
  if (background_exists(pause_bg) = true) {background_delete(pause_bg)}
  // Reactivate all objects
  instance_activate_all();
  deactivated = false;
  // Hide pause screen
  visible = false;
  }

