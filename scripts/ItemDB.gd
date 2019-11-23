extends Node

const ICON_PATH = "res://assets/icons/"
const SCENE_PATH = "res://scenes/items/"

const ITEMS = {
	"dagger": {
		"icon": ICON_PATH + "dagger.png",
		"slot": "MAIN_HAND",
		"scene": SCENE_PATH + "weapons/Dagger.tscn"
	},
	"error": {
		"icon": ICON_PATH + "icon.png",
		"slot": "NONE"
	}
}

func get_item(id):
	if id in ITEMS:
		return ITEMS[id]
	else:
		return ITEMS["error"]