if (place_meeting(x,y,objrope)) return 0 
if (place_meeting(x,y - (vspeed - 75),objwall)) 
{
	return 0
}
else
{
	return 2
}