/// @description sprite
if charge<6
{
 draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
}
 else
{
 if charge<obj_player.chargemax
 {
  sprite_index=spr_bullet_2
  draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
 }
  else
 {
  sprite_index=spr_bullet_3
  draw_sprite_ext(sprite_index,image_index,x,y,1,1,direction,c_white,1)
  //blurr(80,5)
 }
}

draw_set_color(c_white)
//draw_text(x,y,charge)

