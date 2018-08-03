//Left/Right Movement
if (keyboard_check(ord("D"))) hspeed = 5
else if (keyboard_check(ord("A"))) hspeed = -5
else hspeed = 0
//Jumping
if (keyboard_check(vk_space) and grounded) jumping = 1
//Charging
if jumping = 1
{
	jumppower ++
	//Max Jumppower
	if (jumppower >= 120) jumppower = 120
}
//Final Jump
if keyboard_check_released(vk_space)
{
		jumping = 0
		//Min Jumppower
		if (jumppower <= 30) jumppower = 30
		vspeed = -jumppower /5
		jumpcool ++
		if jumpcool >= jumppower
		{
			jumping = 0
			vspeed = 0
			jumppower = 0
			jumpcool = 0
		}	
}
//Collision
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
//Gravity
if (place_meeting(x,y - (vspeed - 1),objwall)) grounded = true
else grounded = false
if (grounded) gravity = 0
else if (!grounded) gravity = .5