/// @desc Core Player Logic

//Get player inputs

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_down = keyboard_check_pressed(vk_down);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

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
x = x + hsp;


//Vertical Collision
if (place_meeting(x,y+vsp,obj_invisible_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_invisible_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

//Vertical Collision (Platforms)
if !key_down
{
	if (place_meeting(x,y+vsp,obj_passthrough_platform))
	{
		while (!place_meeting(x,y+sign(vsp),obj_passthrough_platform))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
}
y = y + vsp;

//Animation
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

if (hsp != 0) image_xscale = 2*(sign(hsp));	

//Change Rooms
if (x > room_width) and (room_exists(room_next(room)))
{
	room_instance_add(room_next(room), 32, y, obj_player);
	instance_destroy();
	room_goto_next();
}

if (x < 0) and (room_exists(room_previous(room)))
{
	room_instance_add(room_previous(room), (1280 - 32), y, obj_player);
	instance_destroy();
	room_goto_previous();
}

