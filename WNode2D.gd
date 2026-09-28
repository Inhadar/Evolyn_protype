extends Node2D

export var coldis = true
# Called when the node enters the scene tree for the first time.


func _ready():
	print(get_children())

func _process(_delta):
	#print(get_children())
	if get_parent().get_parent().get_parent().picking_weapon:
		get_child(0).get_node("CollisionShape2D").disabled = coldis
	pass
