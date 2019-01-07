/// @description physics
if state=0 or state=1
{
 if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru)) // if we are in the air
  {
       grav = .4;
       vspd += grav;
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

///AI: state 0 [flying]
if state=0
{
 if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru)) {walked=false}
 if distance_to_point(obj_player.x,obj_player.y-range)<random_range(5,15)
 {
  state=1
 }
 //y movement
 if distance_to_point(x,obj_player.y-range)>random_range(5,15)
 {
  
 }
}


///AI: state 1 [Jetpack disabled]
if state=1
{
 speed=0
 if place_meeting(x,y+1,obj_block) or (place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru))
 {
  if walked=false
  { 
   if obj_player.x<x {right=true left=false} else {left=true right=false}
   alarm[3]=150
   walked=true
  }
 }
}




///AI: state 10 [Cling]
if state=10
{
 alarm[1]=-1
 alarm[2]=-1
 alarm[3]=-1
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
if distance_to_point(start_x,start_y)>3000
{
 state=0
 alarm[0]=1
 blurr(100,5)
 x=start_x
 y=start_y
}

/* */
/*  */
