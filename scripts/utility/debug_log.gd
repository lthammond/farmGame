extends Node
class_name DebugLog

const LOG_FILE_PATH = "res://log.txt"


static func log(message: String):
	var file = FileAccess.open(LOG_FILE_PATH, FileAccess.READ_WRITE)
	if file:
		var timestamp = Time.get_datetime_string_from_system()
		file.seek_end()
		file.store_line(timestamp + ": " + message)
		file.close()


static func clear():
	var file = FileAccess.open(LOG_FILE_PATH, FileAccess.WRITE)
	if file:
		file.store_line("")
		file.close()
