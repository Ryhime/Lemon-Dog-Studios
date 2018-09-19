if objplayer.x > x + 100 and created = false
{
	created = true
	instance_create_layer(550,560,layer,objwall)
	instance_create_layer(600,560,layer,objwall)
}
if getbox and distance_to_object(objplayer) < 50 and !rope
{
	rope = true
	instance_create_layer(x+100,y+200,layer,objrope)
}
if objplayer.y < 160 and objplayer.x > 510 and objplayer.x < 620
{
	instance_create_layer(x-100,y+200,layer,objrope)
}	