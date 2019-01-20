if distance_to_object(objplayer) < 500 and created = false and objplayer.flaring{
	instance_create_layer(x,y+10,layer,objcrystalslanted)
	created = 1
}
if created = true and counter >= 100
{
	instance_destroy(objcrystalslanted)
	counter = 0
	created =  false
}
if created = true
{
	counter++
}
