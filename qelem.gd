extends KinematicBody2D

var velocity = Vector2()
var spd = 600
onready var  Player = get_tree().current_scene.get_node("Player")
var dummy 
var deydi = false
var now_pos
var deyisim
func _ready():
	#self.scale.x *= Player.scale.x/abs(Player.scale.x)
	pass




func _physics_process(_delta):

	if dummy != null:
		global_position.x = dummy.global_position.x - deyisim
	
	var _value = move_and_slide(velocity,Vector2.UP)
		

func _on_Area2D_body_entered(body):
	if body.is_in_group("dummy"):
		dummy = body
		velocity.x = 0
		now_pos = global_position
		deyisim = dummy.global_position.x - global_position.x
