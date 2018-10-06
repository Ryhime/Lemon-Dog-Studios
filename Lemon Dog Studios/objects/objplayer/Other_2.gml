//Loading
if file_exists("Room.sav")
{
	var loadfile = file_text_open_read("Room.sav")
	var loadroom = file_text_read_real(loadfile)
	file_text_close(loadfile)
	room_goto(loadroom)
}