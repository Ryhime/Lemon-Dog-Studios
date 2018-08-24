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
//Jumping vars
jumpbuttonreleased = keyboard_check_released(vk_space) or keyboard_check_released(ord("W")) or keyboard_check_released(vk_up)
jumpbuttonpressed = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)
canjump--
//Jumping
if(jumpbuttonpressed and canjump > 0)vspeed=-jumpspeed;
//variable height
if(jumpbuttonreleased and vspeed<0 and canjump > 0) vspeed*=0.5;
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
if (place_meeting(x,y - (vspeed - 25),objwall)) 
{
	gravity = 0
	canjump = 5
}
else gravity = 1.5
//Running
if keyboard_check(vk_shift)
{
	spd = 10	
}
else spd = 5