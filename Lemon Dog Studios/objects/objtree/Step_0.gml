if objplayer.x > x + 100
{
	sprite_index = sprtreefell	
}
if getbox and distance_to_object(objplayer) < 50 and !rope
{
	rope = true
	instance_create_layer(x+100,y+200,layer,objrope)
}