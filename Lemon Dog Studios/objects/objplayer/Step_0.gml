//Movement
if keyboard_check(vk_left) or keyboard_check(ord("A"))
{
	hspeed = -spd
}
else if keyboard_check(vk_right) or keyboard_check(ord("D"))
{
	hspeed = spd
}
else 
{
	hspeed = 0
}
//Jumping
if(keyboard_check_pressed(vk_space))vspeed=-jumpspeed;
//variable height
if(keyboard_check_released(vk_space) and vspeed<0) vspeed*=0.5;
//Collision With Solid
if hspeed != 0
if !place_free(x + hspeed, y)
{
 if hspeed > 0 move_contact_solid(0,hspeed)
 if hspeed < 0 move_contact_solid(180,-hspeed)
 hspeed = 0
}
///////
if vspeed != 0
if !place_free(x + hspeed, y + vspeed)
{
 if vspeed > 0 move_contact_solid(270,vspeed)
 if vspeed < 0 move_contact_solid(90,-vspeed)
 vspeed = 0
}
//Check for Gravity
if (place_meeting(x,y - (vspeed - 25),objwall)) gravity = 0
else gravity = .5
//Running
if keyboard_check(vk_shift)
{
	spd = 10	
}
else spd = 5
//Crouching
if keyboard_check(ord("S"))
{
	image_yscale = .5	
}
else image_yscale = 1