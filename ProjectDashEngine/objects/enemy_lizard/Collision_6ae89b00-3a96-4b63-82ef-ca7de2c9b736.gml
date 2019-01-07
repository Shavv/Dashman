/// @description reverse
if state=0 and (place_meeting(x,y+1,obj_block) && (place_meeting(x,y+1,obj_jumpthru) or !place_meeting(x,y,obj_jumpthru)))
{
 if left=true {right=true left=false} else {left=true right=false}
 if place_meeting(x,y,other) {move_outside_all(dir,sprite_width*2)}
}

