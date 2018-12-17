if objplayer.x <= x + 250 and objplayer.x >= x - 250 and objplayer.y <= y + 250 and objplayer.y >= y - 250 and created = false and keyboard_check(ord("Q"))
{
	created = true
	instance_create_layer(cryactive.x,cryactive.y,layer,objcrystal)
	instance_create_layer(cryactive.x+60,cryactive.y,layer,objcrystal)
	instance_create_layer(cryactive.x+120,cryactive.y,layer,objcrystal)
	instance_create_layer(cryactive.x+180,cryactive.y,layer,objcrystal)
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
