/// @description physics
if state=0
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

///AI: state 0 [Normal]
if state=0
{
 if left=true  {dir=0}
 if right=true {dir=180} 

 if distance_to_point(obj_player.x,y)>h_range
 {
  if obj_player.x>x
  {
   right=true
   left=false
   jump=false
  }
   else
  {
   right=false
   left=true
   jump=false
  }
 }  

 if distance_to_point(obj_player.x,y)<stick_range
 {
  if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru)) 
  {
   //
  }
   else
  {
   if jump=false
   {
    if x<obj_player.x {if right=true{up=true}else{up=false}}
    if x>obj_player.x {if left=true {up=true}else{up=false}}
    jump=true
   }
    else
   {
    up=false
   }
  }
 }
  else
 {
  up=false
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

///reset location if to far
if distance_to_point(start_x,start_y)>2000
{
 state=0
 alarm[0]=1
 blurr(100,5)
 x=start_x
 y=start_y
}

