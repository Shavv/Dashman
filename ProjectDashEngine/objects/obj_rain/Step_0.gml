/// @description particle
part_emitter_region(partRain_sys,partRain_emit,-10,room_width+10,-20,-20,ps_shape_line,ps_distr_linear);
//part_system_position(partRain_sys,view_xview-view_wview,view_yview-20)
part_emitter_burst(partRain_sys,partRain_emit,partRain,10);



///lighning
if alarm[1]=-1
{
 alarm[1]=random_range(0,2000)
}


