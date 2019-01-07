/// @description stick to player
if state=1 and sticked=false and obj_player.state!=2
{
 if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru))
 {
  xx=random_range(distance_to_point(obj_player.x,y)-10,distance_to_point(obj_player.x,y)+10)
  yy=random_range(distance_to_point(x,obj_player.y)-5,distance_to_point(x,obj_player.y)+5)
  if x<obj_player.x {ix=-1} else {ix=1}
  if y<obj_player.y {iy=-1} else {iy=1}
  obj_player.b_movespeed+=-1
  sticked=true;state=10;
 }
} 


