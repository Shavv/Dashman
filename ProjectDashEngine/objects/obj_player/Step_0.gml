/// @description Step event
key_init()

///movement and sprite

#region State0: Movement
///State0: Movement
if state=0 or state=1 //ground movement
{
 if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru)) // if we are in the air
 {  
     if state!=1
     {
      grav = .4;
      vspd += grav;
     }
	  else
	 {
	  grav=0	 
	 }
 }
  else // 
 {
     grav = 0; 
     vspd = 0; 
     //if keyboard_check_pressed(key_up) 
     //{
     //    vspd = -10.5;
     //}
     if (keyboard_check_pressed(key_down) or pad_down) and place_meeting(x,y+1,obj_jumpthru)
     {
      //y+=1
     }
     
 }
 
 if state=0
 {
  if (keyboard_check_released(key_up)&& vspd < 0)  
  {
      vspd *= .5; 
  }
  if vspd > 15 
  {
      vspd = 15; 
  }
  repeat(abs(vspd)) 
  {
      if sign(vspd) < 0
      {
          if !place_meeting(x,y-1,obj_block)
          {
              y += sign(vspd);
          }
          else
          {
              vspd = 0;
          }
      }
      else 
      {
          if state=0
 		 {
 		  if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru))
           {
               y += sign(vspd);
           }
 		 }
      }
  }
 }
}

if state=0
{
 alarm[2]=-1
 hspd = ((keyboard_check(key_right) or pad_right)-(keyboard_check(key_left) or pad_left))*f_movespeed; //<-- speed
 repeat(abs(hspd)) 
 {  
     if !place_meeting(x+sign(hspd),y,obj_block) 
     {
         x += sign(hspd); 
     }
 }
}  



#endregion
#region State1: Dash
///State1: Dash
if state=0 and alarm[1]=-1
{
 if keyboard_check(key_up)    or pad_up    {dir=90} 
 if keyboard_check(key_down)  or pad_down  {dir=270}
 if keyboard_check(key_left)  or pad_left  {dir=180}
 if keyboard_check(key_right) or pad_right {dir=0}
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_left)  or pad_left)  {dir=135}
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_right) or pad_right) {dir=45}
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_left)  or pad_left)  {dir=225}
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_right) or pad_right) {dir=315}
 //
 shake=shakex
 gamepad_set_vibration(0,0,0)
 if (keyboard_check(key_dash) or pad_dash)
 {
  if dir=180 {if !place_meeting(x-1,y,obj_block) {image_xscale=-1 set_image_step(spr_mc_dash_horizontal,0.3)   hspd=-longdash vspd=0 alarm[4]=10 olddir=dir state=1}}
  if dir=0   {if !place_meeting(x+1,y,obj_block) {image_xscale= 1 set_image_step(spr_mc_dash_horizontal,0.3)   hspd= longdash vspd=0 alarm[4]=10 olddir=dir state=1}}
  if dir=135 {if place_meeting(x-1,y,obj_block) and place_meeting(x,y+1,obj_block){} else {image_xscale=-1 set_image_step(spr_mc_dash_diagnal_up,0.3)   hspd=-longdash/1.5 vspd=-longdash/1.5 alarm[4]=10 olddir=dir state=1}}
  if dir=45  {if place_meeting(x+1,y,obj_block) and place_meeting(x,y+1,obj_block){} else {image_xscale= 1 set_image_step(spr_mc_dash_diagnal_up,0.3)   hspd= longdash/1.5 vspd=-longdash/1.5 alarm[4]=10 olddir=dir state=1}}
  if dir=225 {if !place_meeting(x,y+1,obj_block) {image_xscale=-1 set_image_step(spr_mc_dash_diagnal_down,0.3) hspd=-longdash/1.5 vspd= longdash/1.5 alarm[4]=10 olddir=dir state=1}}
  if dir=315 {if !place_meeting(x,y+1,obj_block) {image_xscale= 1 set_image_step(spr_mc_dash_diagnal_down,0.3) hspd= longdash/1.5 vspd= longdash/1.5 alarm[4]=10 olddir=dir state=1}}
  if dir=270 {if !place_meeting(x,y+1,obj_block) {set_image_step(spr_mc_dash_down,0.3) vspd=longdash hspd=0 alarm[4]=10 olddir=dir state=1} else {hspd=0 vspd=0 state=0}}
  if dir=90  {/*if !place_meeting(x,y-1,obj_block)*/ {set_image_step(spr_mc_dash_up,0.3) vspd=-longdash hspd=0 alarm[4]=10 olddir=dir state=1}}
 }
}

if state=1
{
 //olddir=dir 
 ///horizontal collsiion
 if place_meeting(x+hspd,y,obj_block)
 {
  repeat(abs(hspd))
  if !place_meeting(x+sign(hspd),y,obj_block)
  {
   x+=sign(hspd)
  }
   else
  {
   break;  
  }
  hspd=0
 }
 
 ///vertical collision
 if place_meeting(x,y+vspd,obj_block)
 {
  repeat(abs(vspd))
  if !place_meeting(x,y+sign(vspd),obj_block)
  {
   y+=sign(vspd)
  }
   else
  {
   break;  
  }
  vspd=0
 }
 
 //friction
 if alarm[4]=-1
 {
  hspd=lerp(hspd,0, 0.1)
  vspd=lerp(vspd,0, 0.1)
 }
 
 ///stick to walls
 if (keyboard_check(key_dash) or pad_dash)
 {
  if (dir=0 or dir=45 or dir=315) and place_meeting(x+1,y,obj_block) {state=1.5 exit;}
  if (dir=180 or dir=135 or dir=225) and place_meeting(x-1,y,obj_block) {state=1.5 exit;}
  if (dir=90 or dir=135 or dir=45) and place_meeting(x,y-1,obj_block) {state=1.5 exit;}
  
  
  //if (keyboard_check(key_right) or pad_right) and place_meeting(x+1,y,obj_block) {state=1.5 exit;}
  //if (keyboard_check(key_left) or pad_left) and place_meeting(x+1,y,obj_block) {state=1.5 exit;}
  //if (keyboard_check(key_up) or pad_up) and place_meeting(x,y-1,obj_block) {state=1.5 exit;}
 }
 
 //actual movement
 x+=hspd
 y+=vspd
 
 if  hspd<2 and hspd>-2 
 and vspd>-2 and vspd<2
 {
  state=0	 
 }
}

//Old dashing
/*
if state=0 and alarm[1]=-1
{
 if keyboard_check(key_up)    or pad_up    {dir=90} 
 if keyboard_check(key_down)  or pad_down  {dir=270}
 if keyboard_check(key_left)  or pad_left  {dir=180}
 if keyboard_check(key_right) or pad_right {dir=0}
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_left)  or pad_left)  {dir=135}
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_right) or pad_right) {dir=45}
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_left)  or pad_left)  {dir=225}
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_right) or pad_right) {dir=315}
 //
 shake=shakex
 gamepad_set_vibration(0,0,0)
 if (keyboard_check(key_dash) or pad_dash)
 {
  //direction=dir
  //speed=longdash
  state=1
  //image
  if dir=180 {image_xscale=-1 set_image_step(spr_mc_dash_horizontal,0.3)   hspd=-longdash}
  if dir=0   {image_xscale= 1 set_image_step(spr_mc_dash_horizontal,0.3)   hspd= longdash}
  if dir=135 {image_xscale=-1 set_image_step(spr_mc_dash_diagnal_up,0.3)   hspd= longdash vspd=-longdash}
  if dir=45  {image_xscale= 1 set_image_step(spr_mc_dash_diagnal_up,0.3)   hspd=-longdash vspd=-longdash}
  if dir=225 {image_xscale=-1 set_image_step(spr_mc_dash_diagnal_down,0.3) hspd=-longdash vpsd= longdash}
  if dir=315 {image_xscale= 1 set_image_step(spr_mc_dash_diagnal_down,0.3) hspd= longdash vspd= longdash}
  if dir=270 {if !place_meeting(x,y+1,obj_block) {set_image_step(spr_mc_dash_down,0.3)} else {hspd=0 vspd=0 state=0}}
  if dir=90  {set_image_step(spr_mc_dash_up,0.3)}
 }
}

if state=1
{
 if hspd>0 {hspd-=hspd/20}
 if hspd<0 {hspd+=hspd/20}
 if vpsd>0 {vspd-=vspd/20}
 if vspd<0 {vspd+=vspd/20}
}



if state=1
{
 //if speed>0 {blurr(80,15)}
 //if keyboard_check_released(key_dash) or pad_dash_release {speed=speed/2}
 if shake>0 {shake-=0.03}
 gamepad_set_vibration(0,shake,shake)
 grav=0
 vspd=0
 hspd=0
 
 if !place_meeting(x+1,y,obj_block) and !place_meeting(x-1,y,obj_block) {if keyboard_check(key_up)     or pad_up    {if !place_meeting(x,y-movespeed/2,obj_block) {y-=movespeed/2}}}
 if !place_meeting(x+1,y,obj_block) and !place_meeting(x+1,y,obj_block) {if keyboard_check(key_down)   or pad_down  {if !place_meeting(x,y+movespeed/2,obj_block) {y+=movespeed/2}}}
 if !place_meeting(x,y+1,obj_block) {if keyboard_check(key_left)   or pad_left  {if !place_meeting(x-movespeed/2,y,obj_block) {x-=movespeed/2}}}
 if !place_meeting(x,y+1,obj_block) {if keyboard_check(key_right)  or pad_right {if !place_meeting(x+movespeed/2,y,obj_block) {x+=movespeed/2}}} 
 
 //slow down dash
 if abs(speed) > 0
 {
  friction=0.5;
 }
 else
 {
  friction=0;
  state=0
 }
 
 if place_meeting(x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),obj_block)
 {
  speed=0
  if direction!=270 and direction!=225 and direction!=315 {state=1.5}
 }
  else
 {
 
 }
 //if place_meeting(x-1,y,obj_block) {speed=0}
 //if place_meeting(x+1,y,obj_block) {speed=0}
 //if place_meeting(x,y-1,obj_block) {speed=0}
 //if place_meeting(x,y+1,obj_block) {speed=0}
 //
}
*/

#endregion
#region State2: Dodge
///State2: Dodge
if state=0 or state=1
{
 if (keyboard_check_pressed(key_roll) or pad_roll)
 {
  if stamina>=3
  {
   stamina-=3
   if keyboard_check(key_up)    or pad_up    {dir=90}
   if keyboard_check(key_down)  or pad_down  {dir=270}
   if keyboard_check(key_left)  or pad_left  {dir=180}
   if keyboard_check(key_right) or pad_right {dir=0}
   if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_left)  or pad_left)  {dir=135}
   if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_right) or pad_right) {dir=45}
   if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_left)  or pad_left)  {dir=225}
   if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_right) or pad_right) {dir=315}  
   direction=dir
   speed=longdash
   state=2
  }
 }
}

if state=2
{
 if dir=0 or dir=180   {set_image_stop(spr_mc_dodge_horizontal,1)}
 if dir=90  {set_image_stop(spr_mc_dodge_up,1)}
 if dir=270 {set_image_stop(spr_mc_dodge_down,1)}
 if dir=135 or dir=45  {set_image_stop(spr_mc_dodge_diagnal_up,1)}
 if dir=225 or dir=315 {set_image_stop(spr_mc_dodge_diagnal_down,1)}
 blurr(50,5) i.color=c_black
 grav=0
 vspd=0
 //slow down dash
 if abs(speed) > 0
 {
  friction=1;
 }
 else
 {
  friction=0;
  state=0
 }
 if place_meeting(x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),obj_block) {speed=0}
 //
}

#endregion
#region State1.5: Dash Stick
///State 1.5: Dash Stick
if state=1.5
{
 if place_meeting(x,y+1,obj_block) {state=0 exit;}
 //if alarm[2]=-1 {alarm[2]=100}
 if keyboard_check(key_up)    or pad_up    {dir=90}
 if keyboard_check(key_down)  or pad_down  {dir=270}
 if keyboard_check(key_left)  or pad_left  {dir=180}
 if keyboard_check(key_right) or pad_right {dir=0}
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_left)  or pad_left)  {dir=135}
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_right) or pad_right) {dir=45}
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_left)  or pad_left)  {dir=225}
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_right) or pad_right) {dir=315}
 ///
 if place_meeting(x,y-1,obj_block) {set_image_stop(spr_mc_roof_stick,0.3)}
 if place_meeting(x-1,y,obj_block) {set_image_stop(spr_mc_wall_stick,0.3) image_xscale=-1}
 if place_meeting(x+1,y,obj_block) {set_image_stop(spr_mc_wall_stick,0.3) image_xscale= 1}
 
 
 if keyboard_check_pressed(key_dash) or pad_dash_press
 {
  //if place_meeting(x+lengthdir_x(15,dir),y+lengthdir_y(15,dir),obj_block)
  {
   if !place_meeting(x,y-1,obj_block)
   {
    if place_meeting(x+1,y,obj_block) and (dir!=0 and dir!=45 and dir!=315)    {state=0}
    if place_meeting(x-1,y,obj_block) and (dir!=180 and dir!=135 and dir!=225) {state=0}
    if place_meeting(x,y+1,obj_block) and (dir!=270 and dir!=225 and dir!=315) {state=0}
    if place_meeting(x,y-1,obj_block) and (dir!=90) {state=0}
   }
   //if place_meeting(x,y-1,obj_block) and (dir!=135 and dir!=90 and dir!=45)   {state=0}
   
   //*
   if place_meeting(x,y-1,obj_block) and (dir!=135 and dir!=90 and dir!=45)
   {
	if !place_meeting(x-1,y,obj_block) and (dir=180 or dir=225) {state=0} 
	if !place_meeting(x+1,y,obj_block) and (dir=0 or dir=315) {state=0} 
	if dir!=180 and dir!=0 and dir!=225 and dir!=335 and dir!=90 {state=0}
   }
   //*/
  }
 }
}

#endregion
#region State10: Hit stun
///State10: Hit stun
if state!=10
{
 if place_meeting(x,y,obj_electric_field) and state!=2
 {
  oth=instance_nearest(x,y,obj_electric_field);
  move_outside_solid(point_direction(oth.x+sprite_width/2,oth.y+sprite_height/2,x,y),1)
  direction=point_direction(oth.x+sprite_width/2,oth.y+sprite_height/2,x,y)
  screen_shake(15)
  obj_player.hp-=2
  speed=4
  friction=0.1
  state=10
 }

 if place_meeting(x,y,obj_electric_field_strong)
 {
  oth=instance_nearest(x,y,obj_electric_field_strong);
  move_outside_solid(point_direction(oth.x+sprite_width/2,oth.y+sprite_height/2,x,y),1)
  direction=point_direction(oth.x+sprite_width/2,oth.y+sprite_height/2,x,y)
  screen_shake(15)
  obj_player.hp-=2
  speed=4
  friction=0.1
  state=10
 } 
}

if state=10
{
 if collision_rectangle( x-(sprite_width/2)+speed,y-(sprite_height/2)+speed,x+(sprite_width/2)+speed,y+(sprite_height/2)+speed,obj_block,0,1)
 {
  speed=0
 }
 grav = 0; 
 vspd = 0; 
 if speed=0
 {
  state=0
 }
}

#endregion

//weapons
#region Weapon Base
///weapon base
//if charging=false {shoot_dir=dir}

//direction
//if weapon!=2
 if keyboard_check(key_up)    or pad_up    {shoot_dir=90}                                                //up
 if keyboard_check(key_down)  or pad_down  {shoot_dir=270}                                               //down
 if keyboard_check(key_left)  or pad_left  {shoot_dir=180 shoot_dir_r=180}                               //left
 if keyboard_check(key_right) or pad_right {shoot_dir=0 shoot_dir_r=0}                                   //right
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_left)  or pad_left)  {shoot_dir=135}  //up left
 if (keyboard_check(key_up)   or pad_up)   and (keyboard_check(key_right) or pad_right) {shoot_dir=45}   //up right
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_left)  or pad_left)  {shoot_dir=225}  //down left
 if (keyboard_check(key_down) or pad_down) and (keyboard_check(key_right) or pad_right) {shoot_dir=315}  //down right
 if crouching=true {if image_xscale=1 {shoot_dir=0 shoot_dir_r=0} else {shoot_dir=180 shoot_dir_r=180}}
 if place_meeting(x,y+1,obj_block) {if image_xscale=1 {if shoot_dir=270 or shoot_dir=225 or shoot_dir=315 {shoot_dir=0 shoot_dir_r=0}} else {if shoot_dir=270 or shoot_dir=225 or shoot_dir=315 {shoot_dir=180 shoot_dir_r=180}}}

#endregion
#region Weapon0: Charge shooting
///Weapon0: Charge shooting
if state=0 or state=1
{
 if !keyboard_check(key_shooti) and !pad_shooti
 {
  if alarm[0]=-1
  {
   if (keyboard_check(key_shoot) or pad_shoot)
   {
    charging=true
    if charge<chargemax {charge+=0.1}
    if charge>2 and creation=false {f=instance_create(x,y,FX_bullet_charge) creation=true}
    if charge>chargemax-5 and !instance_exists(FX_bullet_charge_2) {v=instance_create(x,y,FX_bullet_charge_2) creation=true}
   }
  }   

  if alarm[0]=-1
  {
   if keyboard_check_released(key_shoot) or pad_shoot_release
   {
    //sprite
    xxx=0
    yyy=0
    sprite_bullet_shooting()
    //bolt
    alarm[0]=shoot_delay
    charging=false
    effect_create_fx(x+xxx,y+yyy,FX_bullet_shot)
    i=instance_create(x+xxx,y+yyy,obj_bullet)
    i.charge=charge
    i.direction=shoot_dir
    i.speed=bullet_speed
    i.image_angle=shoot_dir
    if charge>5
    {
     alarm[1]=15
     if charge=chargemax
     {
      i.bounce=2
      state=0
      speed=0
      direction=shoot_dir-180
      speed=30
      friction=3
     }
      else
     {
      i.bounce=1
      state=0
      speed=0
      direction=shoot_dir-180
      speed=10
      friction=1
     }
    }
    charge=1
    creation=false
    if instance_exists(f) 
    {
     with (f)
     {
      instance_destroy()
     }
    }
    if instance_exists(v) 
    {
     with (v)
     {
      instance_destroy()
     }
    }
   }
  }
  if charge>=5 gamepad_set_vibration(0,0.1,0.1)
  if charge>18 gamepad_set_vibration(0,0.7,0.7)
  ///cancel charge if not holding button
  if !keyboard_check(key_shoot) and !pad_shoot
  {
   charge=false
  }
 }
  else
 {
  charge=false	 
 }
}

#endregion
#region Weapon1: Saw gun
///Weapon1: Saw gun
if weapon=1
{
 if alarm[0]=-1 and stamina>=3
 {
  if (keyboard_check(key_shoot) or pad_shoot)
  {
   charging=true
   i=instance_create(x,y,obj_saw)
   i.direction=shoot_dir
   i.speed=saw_speed
   alarm[0]=saw_delay
   stamina-=3
  }
  else
  {
   charging=false
  }
 }
  else
 {
  if !(keyboard_check(key_shoot) or pad_shoot)
  {
   charging=false
  }
 } 
}

#endregion
#region Weapon2: Rapid Shooting
///Weapon2: Rapid Shooting

if weapon=234983
{
 if shoot_dir!=180{if shoot_dir!=0{shoot_dir=0}}
 if keyboard_check(key_shoot) or pad_shoot
 {
  charging=true
  if alarm[0]=-1
  {
   alarm[0]=shoot_delay/2
   i=instance_create(x,y,obj_bullet)
   i.charge=charge
   i.direction=shoot_dir
   i.speed=bullet_speed
   i.color=c_blue
   if charge>5
   {
    if charge=chargemax
    {
     i.bounce=2
    }
     else
    {
     i.bounce=1
    }
   }
   charge=1
   creation=false
   if instance_exists(f) 
   {
    with (f)
    {
     instance_destroy()
    }
   }
   if instance_exists(v) 
   {
    with (v)
    {
     instance_destroy()
    }
   }
  }
 }
 if keyboard_check_released(key_shoot) or pad_shoot_release
 {
  charging=false
 }
}

#endregion
#region Powerup1: Giant Arms
if state=1.5
{
 if place_meeting(x-1,y,obj_block) or place_meeting(x+1,y,obj_block) {armxscale=image_xscale*-1} else {armxscale=image_xscale}
}
 else
{
 armxscale=image_xscale 	
}
#endregion
#region stats
///Stats Base

//stamina regen
if stamina>mstamina
{
 stamina=mstamina
}
 else
{
 stamina+=0.01+(stamina/1000)
}
//hp
if hp<0
{
 hp=0
}
//movespeed
f_movespeed=movespeed+b_movespeed
if b_movespeed < -movespeed {b_movespeed=-movespeed}
longdash=(f_movespeed*2)+6

#endregion


//etc
#region Blur
///blur
if state!=2
{
 if alarm[11]=-1 {alarm[11]=5}
}
 else
{
 alarm[11]=-1
}

#endregion
