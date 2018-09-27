if objplayer.y > 606 and image_yscale > 0
{
	image_alpha -= .1
}
else if objplayer.y < 606 and image_alpha < 1
{
	image_alpha += .1
}
image_xscale = image_yscale