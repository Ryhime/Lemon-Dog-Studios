
//Movement
if keyboard_check(vk_left) or keyboard_check(ord("A"))hspeed = -spd
if keyboard_check(vk_right) or keyboard_check(ord("D"))hspeed = spd

//Jumping
if (keyboard_check(vk_space) and gravity = 0) jump = true
if jump = true
{
	jumppower++
	if (jumppower < 25)jumppower = 25
	if (jumppower > 100)jumppower = 100
	if keyboard_check_released(vk_space)
	{
		vspeed = -jumppower/2
		jumpcool++
		if jumpcool >= jumppower
		{
			jump = false
			jumpcool = 0
			jumppower = 5
		}	
	}
}
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
if (place_meeting(x,y - (vspeed - 1),objwall)) gravity = 0
else gravity = .5
//Charged the Overcharged
if keyboard_check(vk_shift) and !charged
{
	chargedcool++	
}
if chargedcool >= 50 and !charged 
{
	
	charged = true
	chargedcool = 0
}
//Charged Affects
if charged
{
	sprite_index = sprwall
	jumppower = 10
	spd = 10
	chargedcool++
	if chargedcool >= 100
	{
		charged = false
		chargedcool = 0
	}
}
else if !charged
{
	sprite_index = sprplayeridle
	jumppower = 5
	spd = 5
}