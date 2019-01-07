/// @description moving
x += hspd
y += vspd

///push player
if place_meeting(x+hspd,y+vpsd,obj_player)
{
 obj_player.x=x+hspd*2
 obj_player.y=y+vspd*2
}



/*
if place_meeting(x,y-1,obj_player)
{
 obj_player.x=x+hspd/2
}

/* */
/*  */
