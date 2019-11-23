extends Control

onready var slots = get_children()
var items = {}

func _ready():
	for slot in slots:
		items[slot.name] = null
		
func insert_item(item):
	var item_pos = item.rect_global_position + item.rect_size / 2
	var slot = get_slot_under_pos(item_pos)
	if slot == null:
		return false
		
	var item_slot = ItemDB.get_item(item.get_meta("id"))["slot"]
	if item_slot != slot.name:
		return false
	if items[item_slot] != null:
		return false
	items[item_slot] = item
	item.rect_global_position = slot.rect_global_position + slot.rect_size / 2 - item.rect_size / 2
	equip_item(item)
	return true
		
func grab_item(pos):
	var item = get_item_under_pos(pos)
	if item == null:
		return null
		
	var item_slot = ItemDB.get_item(item.get_meta("id"))["slot"]
	items[item_slot] = null
	unequip_item(item)
	return item

func get_slot_under_pos(pos):
	return get_thing_under_pos(slots, pos)
	
func get_item_under_pos(pos):
	return get_thing_under_pos(items.values(), pos)
	
func get_thing_under_pos(arr, pos):
	for thing in arr:
		if thing != null and thing.get_global_rect().has_point(pos):
			return thing
	return null
	
func equip_item(item):
	var scene_path = ItemDB.get_item(item.get_meta("id"))["scene"]
	var scene = load(scene_path)
	var slot = ItemDB.get_item(item.get_meta("id"))["slot"]
	
	var inst = scene.instance()
	if slot == "MAIN_HAND":
		for c in get_tree().get_current_scene().get_node("Player/WeaponPosition").get_children():
			c.queue_free()
		get_tree().get_current_scene().get_node("Player/WeaponPosition").add_child(inst)
		
func unequip_item(item):
	var slot = ItemDB.get_item(item.get_meta("id"))["slot"]
	if slot == "MAIN_HAND":
		for c in get_tree().get_current_scene().get_node("Player/WeaponPosition").get_children():
			c.queue_free()
	