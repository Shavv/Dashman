key_up=ord("W")
key_down=ord("S")
key_left=ord("A")
key_right=ord("D")
key_dash=vk_space 
key_roll=vk_shift
key_shoot=ord("K")
key_shooti=ord("J")
key_weapon=ord("L")

key_cam_up=vk_up
key_cam_down=(vk_down)
key_cam_left=(vk_right)
key_cam_right=(vk_left)

key_pause=ord('P')



////////////////////////////////////////////////////////////////
/////////CONTROLLER/////////////////////////////////////////////
////////////////////////////////////////////////////////////////
gamepad_set_axis_deadzone(0,0.5)
pad_right=(gamepad_axis_value(0,gp_axislh)>0)
pad_left=(gamepad_axis_value(0,gp_axislh)<0)
pad_down=(gamepad_axis_value(0,gp_axislv)>0)
pad_up=(gamepad_axis_value(0,gp_axislv)<0)

pad_2left=(gamepad_axis_value(0,gp_axisrh)>0)
pad_2right=(gamepad_axis_value(0,gp_axisrh)<0)
pad_2down=(gamepad_axis_value(0,gp_axisrv)>0)
pad_2up=(gamepad_axis_value(0,gp_axisrv)<0)
pad_cam=(gamepad_button_check_pressed(0,gp_stickr))
pad_pause=(gamepad_button_check_pressed(0,gp_start))

pad_dash=(gamepad_button_check(0,gp_face2))
pad_dash_press=(gamepad_button_check_pressed(0,gp_face2))
pad_dash_release=(gamepad_button_check_released(0,gp_face2))
pad_shoot=(gamepad_button_check(0,gp_face1))
pad_shoot_release=(gamepad_button_check_released(0,gp_face1))
pad_shoot_pressed=(gamepad_button_check_pressed(0,gp_face1))
pad_shooti=(gamepad_button_check(0,gp_face3))
pad_shooti_release=(gamepad_button_check_released(0,gp_face3))
pad_shooti_pressed=(gamepad_button_check_pressed(0,gp_face3))

pad_weapon_left=gamepad_button_check_pressed(0,gp_shoulderlb)
pad_weapon_right=gamepad_button_check_pressed(0,gp_shoulderrb)
pad_roll=gamepad_button_check_pressed(0,gp_face4)
