/// @description physics
if state=0 or state=1
{
 if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru)) // if we are in the air
  {
        if jetpack=false
        {
         if state=0 {grav = .2;}
         if state=1 {grav = .4;}
         vspd += grav;
        }
         else
        {
         grav = 0;
         vspd = 0;         
        }
  }
  else // 
  {
      grav = 0; 
      vspd = 0; 
      if up=true
      {
       vspd = -jumpheight;
      }
      if (down) and place_meeting(x,y+1,obj_jumpthru)
      {
       y+=1
      }
      
  }
  
  //if (up=false && vspd < 0)  
  //{
  //    vspd *= .5; 
  //}
  if state=0
  {
   if vspd > 5 
   {
       vspd = 5; 
   }
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
          if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru))
          {
              y += sign(vspd);
          }
      }
  }
  hspd = ((right)-(left))*movespeed; //<-- speed
  repeat(abs(hspd)) 
  {  
     if !place_meeting(x+sign(hspd),y,obj_block)
     {
         x += sign(hspd); 
     }
  }
}

///AI: state 0 [Normal]
if state=0
{
 if left=true  {dir=0}
 if right=true {dir=180} 
 y-=accel
 if distance_to_point(x,obj_player.y-200)>20
 {
  if obj_player.y-200<y
  {
   jetpack=true
   if accel<accelmax {accel+=0.1}
   down=false
  }
   else
  {
   jetpack=false
   down=true
  }
 }
  else
 {
  if accel>0 {accel-=(accel/10)}
 }
 //h movement
 if distance_to_point(obj_player.x,y)>10
 {
  
 }
  else
 {
  //
 }
  if obj_player.x>x
  {
   fric+=0.1
  }
  if obj_player.x<x
  {
   fric-=0.1
  }
 x+=fric
 
 
 //dropdown
 if distance_to_point(obj_player.x,obj_player.y-200)<20 and obj_player.state!=2 and sticked=false
 {
  jetpack=false
  state=1
 }
}

if fric>fricmax  {fric=fricmax}
if fric<-fricmax {fric=-fricmax}
if floor(accel)<0 {accel=0}

///AI: state 1 [Jetpack disabled]
if state=1
{
 accel=0
 if place_meeting(x,y+1,obj_block) or (place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru))
 {
  if alarm[0]=-1 {alarm[0]=100}
 }
}




///AI: state 10 [Cling]
if state=10
{
 if alarm[0]=-1 {alarm[0]=100}
 x=obj_player.x+(xx*ix)
 y=obj_player.y+(yy*iy)
 if alarm[0]=33 {screen_shake(5) obj_player.hp-=0.5}
 if alarm[0]=66 {screen_shake(5) obj_player.hp-=0.5}
 if alarm[0]=99 {screen_shake(5) obj_player.hp-=0.5}
 if obj_player.state=2 {alarm[0]=1 state=0
 if obj_player.b_movespeed<0 {obj_player.b_movespeed+=1}}
}

///reset location if to far [DISABLED]
/*
if distance_to_point(start_x,start_y)>1000
{
 state=0
 alarm[0]=1
 blurr(100,5)
 x=start_x
 y=start_y
}

/* */
/*  */
