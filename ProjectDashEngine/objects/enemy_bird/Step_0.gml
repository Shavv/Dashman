/// @description movement
if state=0
{
 if obj_player.x<x
 {
  x-=movespeed
  image_xscale=-1
 } 
  else
 {
  x+=movespeed
  image_xscale=1
 }
 if distance_to_point(x,obj_player.y-350)>1
 {
  if obj_player.y-350<y
  {
   y-=movespeed
  }
   else
  {
   y+=movespeed
  }
 }
}




///atacking
if state=0
{
 if distance_to_point(obj_player.x,y)<550
 {
  if image_xscale=-1 {path=path_dive_r}
  if image_xscale=1  {path=path_dive_l}
  path_start(path,mspd,"",0)
  alarm[0]=35
  alarm[1]=50
  image_xscale=1
  state=1
 }
}

if state=1
{
 if alarm[0]=-1
 {
  scr_enemy_bird_shoot()  
  alarm[0]=shoottimer
 } 
 if distance_to_point(x,obj_player.y)>800
 {
  instance_destroy()
 }
}



/*
Notes:
- look at reference path0
- bullet shooting when going up again from the mouth or the back




/* */
/*  */
