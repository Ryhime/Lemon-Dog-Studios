if (objplayer.bbox_bottom > bbox_top or objplayer.crouching)
{
	instance_create_layer(x,y,layer,objcrouchthrough)
	instance_destroy()
}
