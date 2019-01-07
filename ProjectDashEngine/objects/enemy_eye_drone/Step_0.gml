/// @description rotate around the eye
if instance_exists(master)
{
 x=master.x+cos(angle+master.angle) * lenght
 y=master.y+sin(angle+master.angle) * lenght
}

///shooting
if instance_exists(master)
{
 if shotdelay>0      {shotdelay-=1}
 if rapidshotdelay>0 {rapidshotdelay-=1}
 if shotdelay=0 {shotcounter=0 shotdelay=shottimer delay=mdelay}
 
 if (rapidshotdelay=0) and distance_to_object(obj_player)<500
 {
  if delay>0 {delay-=1}
  if delay<=0
  {
   if shotcounter<maxshotcounter
   {
    rapidshotdelay=rapidshottimer
    scr_enemy_eye_shoot()
    shotcounter+=1
   }
  }
 }
}
 else
{
 instance_destroy()
}


