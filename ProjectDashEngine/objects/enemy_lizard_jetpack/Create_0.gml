/// @description init
randomize()
state=0
movespeed=3
left=false
right=false
down=false
up=false
jumpheight=7.5
collide=0
color=make_colour_rgb(random_range(0,155),random_range(155,255),random_range(0,155))
//normal config
dir=0
grav=0
hspd=0
vspd=0
jump=false
accel=0
fric=0
fricmax=8
accelmax=6

//ai
sticked=false
h_range=random_range(280,320)
stick_range=random_range(90,110)
v_range=150
jetpack=false

//spawn
if instance_exists(enemy_spawn)
{
 start_x=enemy_spawn.x
 start_y=enemy_spawn.y
}
 else
{
 start_x=obj_player.x
 start_y=obj_player.y
}

