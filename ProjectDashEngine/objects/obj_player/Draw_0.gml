///@description Draw
#region Powerup0: Giantarms //PLAYER DRAWN IN THIS REGION//
///Powerup0:
if global.powerup[1]=true
{
 if state=1 {punchstate+=0.3} else {punchstate=0}
 if state=2 {pp+=0.3} else {pp=0} 

 //image_xscale=1
 if state!=2
 {
  if state=1.5 {arm_alpha=0.3} else {arm_alpha=0.8}
  if olddir=0   or olddir=180 {draw_sprite_ext(spr_backarm_punch_straight,punchstate,x+(8*armxscale),y-10,armxscale,1,0,c_white,arm_alpha)     draw_self() draw_sprite_ext(spr_arm_punch_straight,punchstate,x+(-20*armxscale),y-10,armxscale,1,0,c_white,arm_alpha)}
  if olddir=45  or olddir=135 {draw_sprite_ext(spr_backarm_punch_diagnal_up,punchstate,x+(8*armxscale),y-10,armxscale,1,0,c_white,arm_alpha)   draw_self() draw_sprite_ext(spr_arm_punch_diagnal_up,punchstate,x+(-20*armxscale),y-10,armxscale,1,0,c_white,arm_alpha) }
  if olddir=90             {draw_sprite_ext(spr_backarm_punch_up,punchstate,x+(8*armxscale),y-10,armxscale,1,0,c_white,arm_alpha)           draw_self() draw_sprite_ext(spr_arm_punch_up,punchstate,x+(-20*armxscale),y-10,armxscale,1,0,c_white,arm_alpha) }
  if olddir=270            {draw_sprite_ext(spr_backarm_punch_down,punchstate,x+(8*armxscale),y-10,armxscale,1,0,c_white,arm_alpha)         draw_self() draw_sprite_ext(spr_arm_punch_down,punchstate,x+(-20*armxscale),y-10,armxscale,1,0,c_white,arm_alpha) }
  if olddir=315 or olddir=225 {draw_sprite_ext(spr_backarm_punch_diagnal_down,punchstate,x+(8*armxscale),y-10,armxscale,1,0,c_white,arm_alpha) draw_self() draw_sprite_ext(spr_arm_punch_diagnal_down,punchstate,x+(-20*armxscale),y-10,armxscale,1,0,c_white,arm_alpha) }
 }
  else
 {
  if state=2 {draw_sprite_ext(spr_backarm_dodge,pp,x+(8*image_xscale),y-10,image_xscale,1,0,c_white,0.8)     draw_self() draw_sprite_ext(spr_arm_dodge,pp,x+(-20*image_xscale),y-10,image_xscale,1,0,c_white,0.8)} else {draw_self()}
 }
}
 else
{
 draw_self()	
}

#endregion
#region Powerup1: Laser weapon
if !keyboard_check(key_shoot)
{
 if (state=0 or state=1)
 {
  if keyboard_check(key_shooti) or pad_shooti
  {
   scr_laser_weapon()
  }
 }
}
#endregion

draw_text(x,y,sprite_get_name(sprite_index))