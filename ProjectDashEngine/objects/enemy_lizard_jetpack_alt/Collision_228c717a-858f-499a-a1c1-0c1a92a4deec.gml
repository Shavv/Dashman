/// @description move outside
if state=0
{
 if other.x<x cc=0
 if other.x>x cc=180
 if other.x=x cc=choose(0,180)
 move_outside_all(cc,1)
}

