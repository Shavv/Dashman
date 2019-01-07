/// @description scr_shake_view(strengt)
/// @param strengt
//scr_shake_view(20)
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (-(argument0/2)+random(argument0)) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (-(argument0/2)+random(argument0)) );

