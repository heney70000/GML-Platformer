//Chance to drop gem
if random(100) >= 25
{
	instance_create_layer(x, y, "Instances", obj_gem);
}
