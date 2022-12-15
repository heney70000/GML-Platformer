//@desc Movement
x += movesp * -spawn_direction;

image_angle += (movesp * spawn_direction)/2;

vsp = vsp + grv;

if (place_meeting(x,y+vsp,obj_invisible_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_invisible_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;


