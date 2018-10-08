//Save
if (file_exists("Save.sav")) file_delete("Save.sav")
var savefile = file_text_open_write("Save.sav")
var savedroom = room
file_text_write_real(savefile,savedroom)
file_text_close(savefile)
