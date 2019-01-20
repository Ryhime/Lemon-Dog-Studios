if distance_to_object(objplayer) < 500 and created = false and objplayer.flaring
{
	created = true
	instance_create_layer(x,y,layer,objcrystal)
	instance_create_layer(x-60,y,layer,objcrystal)
	instance_create_layer(x-120,y,layer,objcrystal)
	instance_create_layer(x-180,y,layer,objcrystal)
}	

if created = true and counter >= 100
{
	instance_destroy(objcrystal)
	counter = 0
	created =  false
}
if created = true
{
	counter++
}
