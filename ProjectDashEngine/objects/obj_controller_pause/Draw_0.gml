// Make sure game is paused
if (game_paused = true && visible = true)
  {
  // Make sure instances are not yet deactivated to capture screen
  if (deactivated = false)
    {
    // Capture the screen
    pause_bg = scr_screen_capture();
    // Deactivate all instances besides this controler
    instance_deactivate_all(true);
    deactivated = true;
    }
  // Draw our pause screen
  draw_background_ext(pause_bg,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),1,1,0,pause_col,1); 
  draw_set_font(fnt_pause);
  draw_text_colour((__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2)-60,(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2)-30,string_hash_to_newline("PAUSE"),c_white,c_white,c_white,c_white,1);
  }

