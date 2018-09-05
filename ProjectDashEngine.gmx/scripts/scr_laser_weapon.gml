//if stamina>=0.05
{
 //stamina-=0.05 
 var max_length = 700;
 var solid_object = obj_block;
 
 for(var i = 0; i < max_length; i++){
 
     var lx = x + lengthdir_x(i, shoot_dir_r);
     var ly = y + lengthdir_y(i, shoot_dir_r);
     var llx = x + lengthdir_x(i+1, shoot_dir_r);
     var lly = y + lengthdir_y(i+1, shoot_dir_r);
     
     if(collision_point(lx, ly, solid_object, false, true)){
         break;
     }
     if(collision_point(lx, ly, enemy_parent, false, true)){
         obj=collision_point(llx, lly, enemy_parent, false, true)
         effect_create_above(ef_flare,llx,lly,0,c_lime)
         with (obj)
         {
          hp-=0.15
         }
         break;
     }    
 
 }
 draw_line_width_colour(x,y,lx,ly,random_range(5,10),c_green,c_lime);
}
