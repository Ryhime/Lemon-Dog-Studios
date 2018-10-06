//Crouching
if keyboard_check(ord("S")) or keyboard_check(vk_down) or gamepad_button_check(4,gp_shoulderlb) or gamepad_button_check(0,gp_shoulderlb)
{
	if (scrgravity() = 0) crouching = true
}
else if place_free(x,y - 30)
{
	crouching = false
}
//Change Values on for Crouching
if crouching
{
	jumpspeed = 0
	spd = 2
}
else if !crouching
{
	jumpspeed = 1
	spd = 5
}
//Running and Start of Slide
if keyboard_check(vk_shift) or gamepad_button_check(0,gp_face3) or gamepad_button_check(4,gp_face3)
{
	if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(0,gp_shoulderlb) or gamepad_button_check_pressed(4,gp_shoulderlb) and !sliding and betweenslidecool >= 10
	{
		if scrgravity() = 0 and (hsp > 0 or hsp < 0)  
		{
			sliding = true
			if hsp > 0
			{
				slidingdirection = "right"
			}
			else if hsp < 0
			{
				slidingdirection = "left"	
			}	
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
if (scrgravity() == 0) canjump = 10
if (scrgravity() == 0) maxjumps = 1
else if (scrgravity() == 2) maxjumps = 0
//Movement
if keyboard_check(vk_left) or keyboard_check(ord("A")) or gamepad_axis_value(0,gp_axislh) < 0 or gamepad_axis_value(4,gp_axislh) < 0
{
	hsp = -spd
}
else if keyboard_check(vk_right) or keyboard_check(ord("D")) or gamepad_axis_value(0,gp_axislh) > 0 or gamepad_axis_value(4,gp_axislh) > 0
{
	hsp = spd
}
else hsp = 0
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
		hsp = -15
	}
	else if slidingdirection = "right"
	{
		hsp = 15
	}
	else hsp = 0
}
//Jumping vars
jumpbuttonpressed = keyboard_check(vk_space) or gamepad_button_check(4,gp_face1) or gamepad_button_check(0,gp_face1)
canjump--
//Jumping
if(jumpbuttonpressed and canjump and maxjumps)
{
	physics_apply_impulse(x,y-1,0,-1000*jumpspeed)
	jumping = true
}
else
{
	jumping = false
}	
//Sliding Speed
if (crouching) spd = 2
//In Between Slides
if (sliding) betweenslidecool = 0
else betweenslidecool++
if place_meeting(x,y,objrope) and (keyboard_check(vk_up) or keyboard_check(ord("W")) or gamepad_axis_value(0,gp_axisrv) < 0 or gamepad_axis_value(4,gp_axisrv) < 0 or gamepad_button_check(0,gp_padu) or gamepad_button_check(4,gp_padu))
{
	vsp = -10
	physics_world_gravity(0,0)
}
else 
{
	vsp = 0
	physics_world_gravity(0,100)
}
//Collision
if !dashing
{
	if (hsp > 0 and place_free(phy_position_x + hsp,phy_position_y)) phy_position_x += hsp
	else if (hsp < 0 and place_free(phy_position_x + hsp,phy_position_y)) phy_position_x += hsp	
}
if dashing
{
	if (hsp > 0 and place_free(phy_position_x + hsp-5,phy_position_y)) phy_position_x += hsp
	else if (hsp < 0 and place_free(phy_position_x + hsp+5,phy_position_y)) phy_position_x += hsp	
}
phy_position_y += vsp
//Sprite Index
if (sliding) sprite_index = sprplayerslide
else if (crouching) sprite_index = sprplayercrouch
else sprite_index = sprplayeridle