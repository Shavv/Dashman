var chainWidth, chainLength, chain_sprite, chainAngle;
chainWidth = 700//sprite_get_width(chain_sprite); //Your chain sprite here
chainLength = abs(sqrt( sqr(chainWidth) + sqr(y) )); //Get the length of the entire chain.
chainAngle = shoot_dir_r //get the angle of the chain and convert it from degrees to radians

for(var i = 0; i < chainLength; i += chainWidth) //Run a loop so we draw every chain-segment
{
     // This is the big one. We draw the chain segment at the proper rotated angle, with an x-coordinate multiplied by cos(chainAngle), and a y-coordinate multiplied by sin(chainAngle).
     // They're both multiplied by cos/sin so the chain-segments each appear at the correct x/y coordinates, given by the angle of the chain.
     draw_sprite_ext(spr_laser, 0, x + ( cos(chainAngle) * i ) + ( cos(chainAngle) * (chainWidth/2) ), (y - ( sin( chainAngle ) * i )) + (sin( chainAngle ) * (chainWidth/2) ), 1, 1, radtodeg(chainAngle), c_white, 1);
}
