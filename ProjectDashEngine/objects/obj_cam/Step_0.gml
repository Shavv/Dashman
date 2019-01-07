/// @description move towards player
move_towards_point(obj_player.x+xx,obj_player.y+yy,(distance_to_point(obj_player.x+xx,obj_player.y+yy)/3)/**(global.zoomfactor/2)*/)

/* */
///zoomfactor
dh=window_get_height()
dw=window_get_width()

__view_set( e__VW.WView, 0, dw/global.zoomfactor )
__view_set( e__VW.HView, 0, dh/global.zoomfactor )
//zoom with keys
if keyboard_check(vk_pageup) or gamepad_button_check(0,gp_padd)
{
 if global.zoomfactor>0.5 {global.zoomfactor-=0.1}
}
if keyboard_check(vk_pagedown) or gamepad_button_check(0,gp_padu)
{
 if global.zoomfactor<15 {global.zoomfactor+=0.1}
}

/* */
///move cam
if obj_player.pad_2right or keyboard_check(obj_player.key_cam_right) xx-=10
if obj_player.pad_2left  or keyboard_check(obj_player.key_cam_left)  xx+=10
if obj_player.pad_2up    or keyboard_check(obj_player.key_cam_up)    yy-=10
if obj_player.pad_2down  or keyboard_check(obj_player.key_cam_down)  yy+=10

if obj_player.pad_cam {xx=0 yy=0}


/* */
/*  */
