/// @description Rain System
partRain_sys = part_system_create();
storm        = true
//Rain Particle
partRain = part_type_create();
part_type_shape(partRain,pt_shape_line);
part_type_size(partRain,0.05,0.15,0,0);
part_type_color2(partRain,make_color_rgb(8,138,203),make_color_rgb(135,216,255));
part_type_alpha2(partRain,1,1);
part_type_speed(partRain,8,12,0,0);
part_type_direction(partRain,270,270,0,0);
part_type_orientation(partRain,270,270,0,0,0);
part_type_life(partRain,180,180);

//Set Sequence

//Create Emitter
partRain_emit = part_emitter_create(partRain_sys);
part_system_depth(partRain_sys,-10000)
//Advance System
repeat (room_speed * 3){ part_system_update(partRain_sys);
}

alarm[0]=100


