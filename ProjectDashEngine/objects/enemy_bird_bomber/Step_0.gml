/// @description movement
if image_xscale=-1
{
 x-=movespeed
 
} 
 else
{
 x+=movespeed
}


///atacking
if state=0
{
 if alarm[0]=-1
 {
  scr_enemy_bird_bomb()  
  alarm[0]=shoottimer
 } 
 if distance_to_point(x,obj_player.y)>800
 {
  instance_destroy()
 }
}





