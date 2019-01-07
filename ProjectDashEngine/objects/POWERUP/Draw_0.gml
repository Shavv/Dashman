/// @description draw UI
draw_sprite(spr_UI_powerup,-1,UI_x,UI_y)

///bottle
draw_sprite(spr_UI_bottle,-1,UI_bottle_x[0],UI_bottle_y[0])
draw_sprite(spr_UI_bottle,-1,UI_bottle_x[1],UI_bottle_y[1])
draw_sprite(spr_UI_bottle,-1,UI_bottle_x[2],UI_bottle_y[2])


draw_sprite_ext(spr_UI_bottle_fill,UI_bottle_index[0],UI_bottle_x[0],UI_bottle_y[0],1,1,0,UI_bottle_color[0],1)
draw_sprite_ext(spr_UI_bottle_fill,UI_bottle_index[1],UI_bottle_x[1],UI_bottle_y[1],1,1,0,UI_bottle_color[1],1)
draw_sprite_ext(spr_UI_bottle_fill,UI_bottle_index[2],UI_bottle_x[2],UI_bottle_y[2],1,1,0,UI_bottle_color[2],1)

draw_set_alpha(0.5)
draw_sprite(spr_UI_bottle,-1,UI_bottle_x[0],UI_bottle_y[0])
draw_sprite(spr_UI_bottle,-1,UI_bottle_x[1],UI_bottle_y[1])
draw_sprite(spr_UI_bottle,-1,UI_bottle_x[2],UI_bottle_y[2])
draw_set_alpha(1)

if selecting="color"
{
 draw_sprite(spr_UI_colors,sel_color,UI_colors_x,UI_colors_y)
}
 else
{
 draw_sprite(spr_UI_hand,image_index,cursor_x,cursor_y)
 draw_sprite(spr_UI_colors,0,UI_colors_x,UI_colors_y)
}


draw_sprite(spr_UI_infobox,-1,UI_x,UI_y)

