/// @description -
if alarm[1]=-1
{
 image_angle-=rotate
 if rotate>0 {rotate-=0.03}
}
 else
{
 image_alpha-=0.01
 if image_alpha<=0 {instance_destroy()}
}

