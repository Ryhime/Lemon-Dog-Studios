//Save
if (file_exists("Room.sav")) file_delete("Room.sav")
var savefile = file_text_open_write("Room.sav")
var savedroom = room
file_text_write_real(savefile,savedroom)
file_text_close(savefile)
