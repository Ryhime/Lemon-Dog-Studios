sprite_index = sprplayeridle
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
if(jumpbuttonpressed and canjump and maxjumps)vspeed=-jumpspeed;
//variable height
if(jumpbuttonreleased and vspeed<0 and canjump) vspeed*=.5;
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
//Crouching
if keyboard_check(ord("S")) or keyboard_check(vk_down)
{
	sprite_index = sprplayercrouch
	crouching = true
}
else crouching = false
//Change Values on for Crouching
if crouching
{
	jumpspeed = 0
	spd = 1
}
else if !crouching
{
	jumpspeed = 15
	spd = 5
}
//Running
if keyboard_check(vk_shift)
{
	show_debug_message("Dashing")
	if (spd < 10) spd += 1
	if (spd > 10) spd = 10
}
else
{
	if (spd	> 5) spd--
	if (spd < 5) spd = 5
}
show_debug_message(hspeed)
	gravity = scrgravity()
	if (scrgravity() == 0) canjump = 5
	if (scrgravity() == 0) maxjumps = 1
	else if (scrgravity() == 2) maxjumps = 0


