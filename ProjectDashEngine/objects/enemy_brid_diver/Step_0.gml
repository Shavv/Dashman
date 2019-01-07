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
  if divedir="down"
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
 
 if distance_to_point(x,obj_player.y+350)>1
 {  
  if divedir="up"
  {
   if obj_player.y-350>y
   {
    y-=movespeed
   }
    else
   {
    y+=movespeed
   }
  } 
 }
}


///define pathing 


///atacking
if state=0
{
 if distance_to_point(obj_player.x,y)<230
 {
  if divedir="down"
  {
   if image_xscale=-1 {pathd=dive_r_down}
   if image_xscale=1  {pathd=dive_l_down}
   path_start(pathd,mspd,"",0)
  }
  
  if divedir="up"
  {
   if image_xscale=-1 {pathu=dive_r_up}
   if image_xscale=1  {pathu=dive_l_up}
   path_start(pathu,mspd,path_action_stop,0)
  } 
  //
  alarm[0]=20
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
 speed=movespeed
}





