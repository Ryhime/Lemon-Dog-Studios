//Movement
if (keyboard_check(vk_left) or keyboard_check(ord("A"))) hspeed = -5
else if (keyboard_check(vk_right) or keyboard_check(ord("D"))) hspeed = 5
else hspeed = 0
//Jumping
if (keyboard_check_pressed(vk_space) and gravity = 0) jump = true
if jump = true
{
	vspeed = jumppower
	jumpcool += 1
	if jumpcool >= 25
	{
		jump = false
		jumpcool = 0
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
