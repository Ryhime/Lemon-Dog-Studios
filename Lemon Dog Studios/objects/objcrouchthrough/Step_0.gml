if !(objplayer.bbox_bottom > bbox_top or objplayer.crouching)
{
	instance_create_layer(x,y,layer,objcrouchthroughsolid)
	instance_destroy()
}
