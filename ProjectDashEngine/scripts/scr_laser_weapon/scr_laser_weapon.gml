//if stamina>=0.05
{
 //stamina-=0.05 
 var max_length = 700;
 var solid_object = obj_block;
 var laser_height=30;
 
 laserindex+=.5
 
 for(var i = 0; i < max_length; i++){
 
     var lx = x + lengthdir_x(i, shoot_dir_r);
     var ly = y + lengthdir_y(i, shoot_dir_r);
     var llx = x + lengthdir_x(i+1, shoot_dir_r);
     var lly = y + lengthdir_y(i+1, shoot_dir_r);
     
     if(collision_point(lx, ly-(laser_height/2), solid_object, false, true)){
         break;
     }
     if(collision_point(lx, ly-(laser_height/2), enemy_parent, false, true)){
         obj=collision_point(llx, lly-(laser_height/2), enemy_parent, false, true)
         with (obj)
         {
          hp-=0.15
         }
         break;
     }    
 
 }
 //draw_line_width_colour(x,y,lx,ly,random_range(5,10),c_purple,c_purple);
 if shoot_dir_r=0   {draw_sprite_part_ext(spr_laser,laserindex,0,0,lx-(x+xxx),laser_height,x+xxx,(y+yyy)-(laser_height/2),1,1,c_white,1)}
 if shoot_dir_r=180 {draw_sprite_part_ext(spr_laser,laserindex,0,0,(x+xxx)-lx,laser_height,x+xxx,(y+yyy)-(laser_height/2),-1,1,c_white,1)}
}
