/// @description release
fric=0
state=0
vspd = -jumpheight;
if obj_player.b_movespeed<0 {obj_player.b_movespeed+=1}
choose(left=true,right=true)
alarm[1]=50

