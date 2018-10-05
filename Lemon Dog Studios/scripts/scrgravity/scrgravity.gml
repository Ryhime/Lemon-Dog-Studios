if (place_meeting(x,y+1,objwall) or place_meeting(x,y+1,objcrouchthroughsolid) or place_meeting(x,y+1,objtree)) 
{
	return 0
}
else
{
	return 2
}