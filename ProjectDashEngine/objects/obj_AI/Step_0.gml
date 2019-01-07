/// @description Platform movement
if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru)) // if we are in the air
{
      grav = .4;
      vspd += grav;
}
 else // 
{
     jumped=false
     grav = 0; 
     vspd = 0;    
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
         if !place_meeting(x,y+1,obj_block) && (!place_meeting(x,y+1,obj_jumpthru) or place_meeting(x,y,obj_jumpthru))
         {
             y += sign(vspd);
         }
     }
}

hspd = (right-left)*movespeed; //<-- speed
repeat(abs(hspd)) 
{  
     if !place_meeting(x+sign(hspd),y,obj_block) 
     {
         x += sign(hspd); 
     }
}  

///BASIC AI
if distance_to_point(obj_player.x,y)>128
{
 if obj_player.x<x {left=true right=false}
 if obj_player.x>x {right=true left=false}
}

if obj_player.y<=y+sprite_height/2
{
 if distance_to_point(x,obj_player.y)<64
 {
  if distance_to_point(obj_player.x,y)<48
  {
   if jumped=false
   {
    vspd=-10
    jumped=true
   }
  }
 }
}


