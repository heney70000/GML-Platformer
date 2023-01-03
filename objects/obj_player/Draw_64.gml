//Display the score and time
if finish = false
{
	draw_set_halign(fa_left);
	draw_text(10, 10, "Score: " + string(global.score));
	draw_text(10, 42, "Time: " + string(global.time));
}
else
{
	draw_set_halign(fa_center);
	draw_text(640, 360 - 32, "You made it!");
	draw_text(640, 360 + 10, "Score: " + string(global.score));
	draw_text(640, 360 + 42, "Time: " + string(global.time));
}

//Death message
if (death == 1)
{
	draw_set_halign(fa_center);
	draw_text(room_width/2, 64, "Press 'R' to restart");
}

//Shows the hitbox of the punch (uncomment lines below to toggle)
//if keyboard_check(ord("E"))
//{
//	draw_rectangle(x+(image_xscale*13), y-sprite_height/4 * image_yscale, x+(image_xscale*44), y+sprite_height/2, false);
//}