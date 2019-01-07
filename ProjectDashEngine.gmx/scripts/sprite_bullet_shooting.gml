///sprite_bullet_shooting()

//normal movement
if state=0
{
 //not falling
 if vspd=0
 {
  if hspd=0
  {
   if crouching=false
   {
    if shoot_dir=180 {{image_ignore=spr_mc_idle set_image_stop(spr_mc_shoot_idle,0) image_xscale=-1 yyy=-15 xxx=-23 alarm[3]=20}}
    if shoot_dir=0 {{image_ignore=spr_mc_idle set_image_stop(spr_mc_shoot_idle,0) image_xscale=1 yyy=-15 xxx=23 alarm[3]=20}}
    if shoot_dir=90 {image_ignore=spr_mc_idle set_image_stop(spr_mc_shoot_up,0) yyy=-35 alarm[3]=20}
   }
    else
   {
    image_ignore=spr_mc_crouch set_image_stop(spr_mc_crouch_shoot,0) alarm[3]=20 xxx=image_xscale*20 yyy=-8
   }
  }
   else
  {
   ///running
   if shoot_dir=180 or shoot_dir=0
   {
    image_ignore=spr_mc_run set_image_step(spr_mc_run_shoot_horizontal,0.2) xxx=image_xscale*25 yyy=-14 alarm[3]=20
   }
   if shoot_dir=135 or shoot_dir=45
   {
    image_ignore=spr_mc_run set_image_step(spr_mc_run_shoot_diagnal,0.2) xxx=image_xscale*22 yyy=-36 alarm[3]=20
   }
  }
 }
  else
 {
  ///falling
  image_ignore=spr_mc_fall set_image_stop(spr_mc_fall_shoot,0)
  if shoot_dir=0   or shoot_dir=180 {image_index=2 yyy=-15 xxx=image_xscale*25}
  if shoot_dir=135 or shoot_dir=45  {image_index=1 yyy=-30 xxx=image_xscale*20}
  if shoot_dir=225 or shoot_dir=315 {image_index=3 yyy=0 xxx=image_xscale*18}
  if shoot_dir=270 {yyy=20  image_index=4}
  if shoot_dir=90  {yyy=-50 image_index=0}
  
  alarm[3]=20
 }
}

if state=1
{
 
 //diagnal down
 if sprite_index=spr_mc_dash_diagnal_down or sprite_index=spr_mc_dash_diagnal_down_shoot_0
 or sprite_index=spr_mc_dash_diagnal_down_shoot_45 or sprite_index=spr_mc_dash_diagnal_down_shoot_90
 or sprite_index=spr_mc_dash_diagnal_down_shoot_135 or sprite_index=spr_mc_dash_diagnal_down_shoot_180
 or sprite_index=spr_mc_dash_diagnal_down_shoot_225 or sprite_index=spr_mc_dash_diagnal_down_shoot_270
 or sprite_index=spr_mc_dash_diagnal_down_shoot_315
 {
  if shoot_dir=90  {set_image_step(spr_mc_dash_diagnal_down_shoot_90,0.2)} 
  if shoot_dir=270 {set_image_step(spr_mc_dash_diagnal_down_shoot_270,0.2)}
  ///////////////////////////////////////////////////////////////////////// 
  if image_xscale=1
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_diagnal_down_shoot_0,0.2)}
   if shoot_dir=180 {set_image_step(spr_mc_dash_diagnal_down_shoot_180,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_diagnal_down_shoot_45,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_diagnal_down_shoot_135,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_diagnal_down_shoot_225,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_diagnal_down_shoot_315,0.2)}  
  }
   else
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_diagnal_down_shoot_180,0.2)} 
   if shoot_dir=180 {set_image_step(spr_mc_dash_diagnal_down_shoot_0,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_diagnal_down_shoot_135,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_diagnal_down_shoot_45,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_diagnal_down_shoot_315,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_diagnal_down_shoot_225,0.2)}   
  }
 }

 //diagnal up
 if sprite_index=spr_mc_dash_diagnal_up or sprite_index=spr_mc_dash_diagnal_up_shoot_0 or sprite_index=spr_mc_dash_diagnal_up_shoot_45
 or sprite_index=spr_mc_dash_diagnal_up_shoot_90 or sprite_index=spr_mc_dash_diagnal_up_shoot_135 or sprite_index=spr_mc_dash_diagnal_up_shoot_180
 or sprite_index=spr_mc_dash_diagnal_up_shoot_225 or sprite_index=spr_mc_dash_diagnal_up_shoot_270 or sprite_index=spr_mc_dash_diagnal_up_shoot_315
 {
  if shoot_dir=90  {set_image_step(spr_mc_dash_diagnal_up_shoot_90,0.2)} 
  if shoot_dir=270 {set_image_step(spr_mc_dash_diagnal_up_shoot_270,0.2)}
  ///////////////////////////////////////////////////////////////////////// 
  if image_xscale=1
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_diagnal_up_shoot_0,0.2)}
   if shoot_dir=180 {set_image_step(spr_mc_dash_diagnal_up_shoot_180,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_diagnal_up_shoot_45,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_diagnal_up_shoot_135,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_diagnal_up_shoot_225,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_diagnal_up_shoot_315,0.2)}  
  }
   else
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_diagnal_up_shoot_180,0.2)} 
   if shoot_dir=180 {set_image_step(spr_mc_dash_diagnal_up_shoot_0,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_diagnal_up_shoot_135,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_diagnal_up_shoot_45,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_diagnal_up_shoot_315,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_diagnal_up_shoot_225,0.2)}   
  }
 }
 
 ///up 
 if sprite_index=spr_mc_dash_up or sprite_index=spr_mc_dash_up_shoot_0 or sprite_index=spr_mc_dash_up_shoot_45
 or sprite_index=spr_mc_dash_up_shoot_90 or sprite_index=spr_mc_dash_up_shoot_135 or sprite_index=spr_mc_dash_up_shoot_180
 or sprite_index=spr_mc_dash_up_shoot_225 or sprite_index=spr_mc_dash_up_shoot_270 or sprite_index=spr_mc_dash_up_shoot_315
 {
  if shoot_dir=90  {set_image_step(spr_mc_dash_up_shoot_90,0.2)} 
  if shoot_dir=270 {set_image_step(spr_mc_dash_up_shoot_270,0.2)}
  ///////////////////////////////////////////////////////////////////////// 
  if image_xscale=1
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_up_shoot_0,0.2)}
   if shoot_dir=180 {set_image_step(spr_mc_dash_up_shoot_180,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_up_shoot_45,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_up_shoot_135,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_up_shoot_225,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_up_shoot_315,0.2)}  
  }
   else
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_up_shoot_180,0.2)} 
   if shoot_dir=180 {set_image_step(spr_mc_dash_up_shoot_0,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_up_shoot_135,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_up_shoot_45,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_up_shoot_315,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_up_shoot_225,0.2)}   
  }
 }
 
 ///down
 if sprite_index=spr_mc_dash_down or sprite_index=spr_mc_dash_down_shoot_0 or sprite_index=spr_mc_dash_down_shoot_45
 or sprite_index=spr_mc_dash_down_shoot_90 or sprite_index=spr_mc_dash_down_shoot_135 or sprite_index=spr_mc_dash_down_shoot_180
 or sprite_index=spr_mc_dash_down_shoot_225 or sprite_index=spr_mc_dash_down_shoot_270 or sprite_index=spr_mc_dash_down_shoot_315
 {
  if shoot_dir=90  {set_image_step(spr_mc_dash_down_shoot_90,0.2)} 
  if shoot_dir=270 {set_image_step(spr_mc_dash_down_shoot_270,0.2)}
  ///////////////////////////////////////////////////////////////////////// 
  if image_xscale=1
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_down_shoot_0,0.2)}
   if shoot_dir=180 {set_image_step(spr_mc_dash_down_shoot_180,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_down_shoot_45,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_down_shoot_135,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_down_shoot_225,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_down_shoot_315,0.2)}  
  }
   else
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_down_shoot_180,0.2)} 
   if shoot_dir=180 {set_image_step(spr_mc_dash_down_shoot_0,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_down_shoot_135,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_down_shoot_45,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_down_shoot_315,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_down_shoot_225,0.2)}   
  }
 }   

 ///horizontal
 if sprite_index=spr_mc_dash_horizontal or sprite_index=spr_mc_dash_horizontal_shoot_0 or sprite_index=spr_mc_dash_horizontal_shoot_45
 or sprite_index=spr_mc_dash_horizontal_shoot_90 or sprite_index=spr_mc_dash_horizontal_shoot_135 or sprite_index=spr_mc_dash_horizontal_shoot_180
 or sprite_index=spr_mc_dash_horizontal_shoot_225 or sprite_index=spr_mc_dash_horizontal_shoot_270 or sprite_index=spr_mc_dash_horizontal_shoot_315
 {
  if shoot_dir=90  {set_image_step(spr_mc_dash_horizontal_shoot_90,0.2)} 
  if shoot_dir=270 {set_image_step(spr_mc_dash_horizontal_shoot_270,0.2)}
  ///////////////////////////////////////////////////////////////////////// 
  if image_xscale=1
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_horizontal_shoot_0,0.2)}
   if shoot_dir=180 {set_image_step(spr_mc_dash_horizontal_shoot_180,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_horizontal_shoot_45,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_horizontal_shoot_135,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_horizontal_shoot_225,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_horizontal_shoot_315,0.2)}  
  }
   else
  {
   if shoot_dir=0   {set_image_step(spr_mc_dash_horizontal_shoot_180,0.2)} 
   if shoot_dir=180 {set_image_step(spr_mc_dash_horizontal_shoot_0,0.2)} 
   if shoot_dir=45  {set_image_step(spr_mc_dash_horizontal_shoot_135,0.2)} 
   if shoot_dir=135 {set_image_step(spr_mc_dash_horizontal_shoot_45,0.2)}
   if shoot_dir=225 {set_image_step(spr_mc_dash_horizontal_shoot_315,0.2)} 
   if shoot_dir=315 {set_image_step(spr_mc_dash_horizontal_shoot_225,0.2)}   
  }
 } 
 
}
