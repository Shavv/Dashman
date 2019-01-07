/// @description view follow cam
__view_set( e__VW.XView, 0, x-__view_get( e__VW.WView, 0 )/2 );
__view_set( e__VW.YView, 0, y-__view_get( e__VW.HView, 0 )/2 );
__view_set( e__VW.XView, 0, median(0, __view_get( e__VW.XView, 0 ), room_width - __view_get( e__VW.WView, 0 )) )
__view_set( e__VW.YView, 0, median(0, __view_get( e__VW.YView, 0 ), room_height - __view_get( e__VW.HView, 0 )) ) 

//screenshake
if screenshake>0
{
 scr_shake_view(screenshake)
 screenshake-=1
}

///stop cam moving to far
if yy> 300 yy=300
if yy<-300 yy=-300
if xx> 300 xx=300
if xx<-300 xx=-300

