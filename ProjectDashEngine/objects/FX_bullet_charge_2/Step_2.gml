/// @description stay at player
dir=obj_player.shoot_dir

if dir=90
{
 x=obj_player.x
 y=obj_player.y-24
}

if dir=270
{
 x=obj_player.x
 y=obj_player.y+24
}

if dir=180
{
 x=obj_player.x-24
 y=obj_player.y
}

if dir=0
{
 x=obj_player.x+24
 y=obj_player.y
}

if dir=135
{
 x=obj_player.x-24
 y=obj_player.y-24
}

if dir=45
{
 x=obj_player.x+24
 y=obj_player.y-24
}

if dir=225
{
 x=obj_player.x-24
 y=obj_player.y+24
}

if dir=315
{
 x=obj_player.x+24
 y=obj_player.y+24
}

