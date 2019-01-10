///@description End step

//testing
#region testing

//reset room if hp = 0
if room=demo_room
{
 if hp=0
 {
  game_restart()
 }
}

///stop moving inside
if place_meeting(x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),obj_block) {speed=0 move_outside_all(direction-180,10)}

#endregion

///animation
#region Animation
///MC animation
if state=0
{
 if place_meeting(x,y+1,obj_block) or (place_meeting(x,y+1,obj_jumpthru))
 {
  if (keyboard_check(key_right) or pad_right) and (!keyboard_check(key_left) and !pad_left) {image_xscale= 1 set_image_step(spr_mc_run,0.3)}
  if (keyboard_check(key_left) or pad_left) and (!keyboard_check(key_right) and !pad_right)   {image_xscale=-1 set_image_step(spr_mc_run,0.3)}
  if (keyboard_check(key_left) and keyboard_check(key_right)) or (pad_left and pad_right) {set_image_step(spr_mc_idle,0.15)}
  
  if ((!keyboard_check(key_right) and (!pad_left)) and (!keyboard_check(key_left) and !pad_right))
  {
   ///crouching
   if keyboard_check(key_down)
   {
    set_image_stop(spr_mc_crouch,0.3)
    crouching=true
   } 
    else
   {
    set_image_step(spr_mc_idle,0.15)
    crouching=false
   }  
  }
   else
  {
   crouching=false
  } 
 }
  else
 {
  crouching=false
  image_xscale=imm
  if (keyboard_check(key_right) or pad_right) {image_xscale= 1 imm= 1}
  if (keyboard_check(key_left) or pad_left)   {image_xscale=-1 imm=-1}
  if !keyboard_check(key_left) and !keyboard_check(key_right)
  and pad_left and pad_right
  {
   image_xscale=imm
  } 
  if alarm[5]=-1 {set_image_step(spr_mc_fall,0.3)}
 }
}

if state=1
{
 if (keyboard_check(key_right) or pad_right) {imm= 1}
 if (keyboard_check(key_left) or pad_left)   {imm=-1} 
 alarm[5]=5
}

#endregion

//weapons
#region Weapon3: Laser Weapon
///Weapon3: Laser weapon
if !keyboard_check(key_shoot) and !pad_shoot
{
 if keyboard_check(key_shooti) or pad_shooti
 {
  sprite_laser_shooting()
 }
}
///in draw event
#endregion