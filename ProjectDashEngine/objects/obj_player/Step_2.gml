/// @description reset test room if hp is 0
if room=demo_room
{
 if hp=0
 {
  game_restart()
 }
}


///stop moving inside
if place_meeting(x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),obj_block) {speed=0 move_outside_all(direction-180,10)}

