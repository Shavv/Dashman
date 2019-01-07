/// @description menu selection
if selecting="bottles"
{
 if keyboard_check_pressed(vk_up)    {sel_y-=1}
 if keyboard_check_pressed(vk_down)  {sel_y+=1}
}

if selecting="color"
{
 if keyboard_check_pressed(vk_up)    {sel_color-=1}
 if keyboard_check_pressed(vk_down)  {sel_color+=1}
}

///selecting 
if keyboard_check_pressed(vk_enter)
{
 if selecting="bottles"
 {
  bottle_selected=sel_y
  selecting="color"
 }
  else
 { 
  if selecting="color"
  {
   yy=sel_y
  
   UI_bottle_index[yy]=0
   
   if sel_color=1 {if UI_bottle_color[yy]=c_purple {UI_bottle_color[yy]=c_white} else {UI_bottle_color[yy]=c_purple}}   
   
   selecting="bottles"
  }
 }
}


///bottle selections
if selecting="bottles"
{
 sel_x=clamp(sel_x,0,0)
 sel_y=clamp(sel_y,0,2)
 ////////////////////////////
 cursor_x=UI_bottle_x[0]-25
 cursor_y=UI_bottle_y[sel_y]+6
}

///color selections
if selecting="color"
{
 sel_color=clamp(sel_color,1,8)
}
 else
{
 //sel_color=0
}


///
if UI_bottle_color[0]!=c_white {if UI_bottle_index[0]<8 {UI_bottle_index[0]+=1}}
if UI_bottle_color[1]!=c_white {if UI_bottle_index[1]<8 {UI_bottle_index[1]+=1}}
if UI_bottle_color[2]!=c_white {if UI_bottle_index[2]<8 {UI_bottle_index[2]+=1}}


