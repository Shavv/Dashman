/// @description destroy
if other.state!=2
{
 effect_create_above(ef_flare,x,y,1,c_white)
 obj_cam.screenshake=20
 instance_destroy()
}

