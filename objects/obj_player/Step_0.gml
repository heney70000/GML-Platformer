/// @desc Core Player Logic

//Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_down = keyboard_check(vk_down);
key_attack = keyboard_check(ord("E"));

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp * stopMovement;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_invisible_wall)) && (key_jump)
{
	vsp = -jumpsp
}

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_invisible_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_invisible_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

if (death != 1)
{
	x = x + hsp;
}

//Vertical Collision
if (place_meeting(x,y+vsp,obj_invisible_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_invisible_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	falling = false;
}
else
{
	falling = true;
}

if (death != 1)
{
	y = y + vsp;
}
//Kill Wall Collision
if (place_meeting(x+hsp,y,obj_kill_wall)) || (place_meeting(x,y+vsp,obj_kill_wall))
{
	death = 1;
}

//Falling into void
if y > room_height
{
	death = 1;
}

//Death
if (death == 1) && keyboard_check_pressed(ord("R"))
{
	game_restart();
}

if death != 0
{
	draw_text(room_width/2, 64, "Oops...\nPress 'R' to restart");
}

//Animation
if (death != 1)
{
	if !attacking
	{
		if (!place_meeting(x,y+1,obj_invisible_wall))
		{
			sprite_index = spr_cowegg_jump;
			image_speed = 0;
			if (vsp < 0) image_index = 1; else image_index = 3;
		}
		else
		{
			image_speed = 1;
			if (hsp == 0)
			{
				sprite_index = spr_cowegg_idle;
			}
			else
			{
				sprite_index = spr_cowegg_run;
			}
		}
	}
}
else
{
	hsp = 0;
	vsp = 0;
	sprite_index = spr_cowegg_death;
}

if (hsp != 0) image_xscale = 2*(sign(hsp));	

//Punch Attack
if key_attack and !attacking and !falling
{
	sprite_index = spr_cowegg_punch_windup;
}

if (sprite_index = spr_cowegg_punch_windup) or (sprite_index = spr_cowegg_punch)
{
	stopMovement = 0;
}
else
{
	stopMovement = 1;
}

if keyboard_check_released(ord("E")) and !attacking and !falling
{
	instance_destroy(collision_rectangle(x+(image_xscale*13), y-sprite_height/4 * image_yscale, x+(image_xscale*44), y+sprite_height/2, obj_destroyable, false, true))
	sprite_index = spr_cowegg_punch;
	attacking = true;
}