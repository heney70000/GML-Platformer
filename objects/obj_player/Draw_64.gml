draw_set_halign(fa_left);
draw_text(10, 10, "Score: " + string(global.score));
draw_text(10, 42, "Time: " + string(global.time));

if (death == 1)
{
	draw_set_halign(fa_center);
	draw_text(room_width/2, 64, "Oops...\nPress 'R' to restart");
}

//if keyboard_check(ord("E"))
//{
//	draw_rectangle(x+(image_xscale*13), y-sprite_height/4 * image_yscale, x+(image_xscale*44), y+sprite_height/2, false);
//}