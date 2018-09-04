//Jumping vars
jumpbuttonreleased = keyboard_check_released(vk_space) or keyboard_check_released(ord("W")) or keyboard_check_released(vk_up)
jumpbuttonpressed = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)
canjump--
//Jumping
if(jumpbuttonpressed and canjump and maxjumps)vspeed=-jumpspeed;
//variable height
if(jumpbuttonreleased and vspeed<0 and canjump) vspeed*=.5;
//Crouching
if keyboard_check_direct(ord("S")) or keyboard_check_direct(vk_down)
{
	crouching = true
}
else crouching = false
//Change Values on for Crouching
if crouching
{
	jumpspeed = 0
	spd = 2
}
else if !crouching
{
	jumpspeed = 15
	spd = 5
}
//Running and Start of Slide
if keyboard_check(vk_shift)
{
	if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) and hspeed != 0 and !sliding and betweenslidecool >= 20
	{
		sliding = true
		if hspeed > 0
		{
			slidingdirection = "right"
		}
		else if hspeed < 0
		{
			slidingdirection = "left"	
		}
	}
	else if !crouching and !sliding
	{
		dashing = true
		spd = 10
	}
}
else
{
	if !crouching
	{
		if (spd	> 5) spd--
		if (spd < 5) spd = 5	
	}
	dashing = false
}
show_debug_message(spd)
gravity = scrgravity()
if (scrgravity() == 0) canjump = 5
if (scrgravity() == 0) maxjumps = 1
else if (scrgravity() == 2) maxjumps = 0
//Movement
if keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"))
{
	hspeed = -spd
}
else if keyboard_check(vk_right) or keyboard_check_direct(ord("D"))
{
	hspeed = spd
}
else 
{
	hspeed = 0
}
//Actual Slide
if sliding
{
	slidecool++
	if slidecool>=10
	{
		sliding = false	
		slidecool = 0
	}
	if slidingdirection = "left"
	{
		hspeed = -15	
	}
	else if slidingdirection = "right"
	{
		hspeed = 15	
	}
}
//Sliding Speed
if (crouching) spd = 2
//In Between Slides
if (sliding) betweenslidecool = 0
else betweenslidecool++
//Sprite Index
if (sliding) sprite_index = sprplayerslide
else if (crouching) sprite_index = sprplayercrouch
else sprite_index = sprplayeridle
//Collision
scrcollision()