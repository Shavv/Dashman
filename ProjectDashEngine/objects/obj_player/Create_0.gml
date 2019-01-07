/// @description platform init
image_speed=0.15
end_animation=true
dashing=true
crouching=false
grav = 0;
vspd = 0;
hspd = 0;

///powerups
global.powerup[0]=false //???
global.powerup[1]=true //Giant arms
global.powerup[2]=true //Laser weapon
global.powerup[3]=false //


//other
movespeed=7
f_movespeed=0
b_movespeed=0
acc=0.2
state=0
dir=0
shoot_dir=0
shoot_dir_r=0
longdash=25//25
shortdash=40
shakex=0
shake=shakex
charge=0
chargemax=10
shoot_delay=15
bullet_speed=15
saw_speed=10
saw_delay=40
imm=1
creation=false
f=FX_bullet_charge
v=FX_bullet_charge_2
charging=false
weapon=0
weaponmax=3
punchstate=0
arm_alpha=0.8
olddir=dir
armxscale=1
///stats
mstamina=20
stamina=mstamina
mhp=20
hp=mhp

//etc.
oth=obj_cam
image_ignore=spr_mc_hitbox

