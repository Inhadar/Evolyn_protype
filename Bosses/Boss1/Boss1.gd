extends KinematicBody2D

onready var Player = get_tree().current_scene.get_node("Player")

var move_permision = false
var move_spd = 100
var player_direction 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	
	get_player_direction()
	
	velocity.y += 200 * delta
	
	move_and_slide(velocity,Vector2.UP)
	
	if move_permision == true:
		Walk(move_spd,delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Walk(walk_spd,delta):
	#velocity.x -= walk_spd * delta * #player_direction
	#$AnimationPlayer.play("walk")
	pass

func get_player_direction():
	if global_position.x - Player.global_position.x >0:
		player_direction = 1
		self.set_scale(Vector2(1,1))
		self.rotation_degrees = 0
	elif global_position.x - Player.global_position.x<0:
		player_direction = -1
		self.set_scale(Vector2(1,-1))
		rotation_degrees = 180
	#scale.y = player_direction
		

	print(self.get_scale())

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		move_permision = true
