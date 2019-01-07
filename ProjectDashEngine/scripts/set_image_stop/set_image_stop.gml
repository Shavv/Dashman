/// @description set_image_stop(image,speed)
/// @param image
/// @param speed
if  image_ignore!=argument0
{
 var imageindexrounded = floor(image_index)
 end_animation=true
 /////////////////////////////
 if sprite_index!=argument0
 {
  image_speed=argument1
  sprite_index=argument0
  image_index=0
 }
  else
 {
  if imageindexrounded>=image_number-1 {image_index=image_number-1 image_speed=0 }
 }
}
