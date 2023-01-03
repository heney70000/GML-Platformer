/// @description Check if this object can collide or not
//Collidable when player is above the platform
if instance_exists(obj_player)
{
	if (round(obj_player.y + (obj_player.sprite_height/2)) > y or (obj_player.key_down))
	{
	mask_index = -1
	}
	else mask_index = spr_passthrough_platform;
}