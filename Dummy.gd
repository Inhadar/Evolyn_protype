extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var qelem
var direction 

export var flash_modifier = 0.0

onready var Player = get_tree().current_scene.get_node("Player")
# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
		
	$Sprite.material.set_shader_param("flash_modifer",flash_modifier)
	#var now_rad  = $CollisionShape2D.get_shape().get_height() * $CollisionShape2D.scale.x
	#print(now_rad)

		
	

	
	
	if Input.is_action_pressed("ui_right"):
		#global_position.x += 1
		direction = 1
	else:
		direction =0
		#apply_central_impulse(Vector2(200,0))
		#linear_velocity.x = 200* delta
	if Input.is_action_pressed("ui_left"):
		#global_position.x += -1
		direction = -1
	else:
		direction = 0
		#apply_central_impulse(Vector2(-200,0))
		#linear_velocity.x = - 200* delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_area_entered(area):
	if area.is_in_group("m_weapon"):
		#linear_velocity.y += 10
		#$Sprite.stop()
		if Globals.m_weapon_hit_count <3:
			Globals.m_weapon_hit_count +=1
			if Globals.m_weapon_hit_count <=2:
				$AnimationPlayer.play("Flash")
		
		if Globals.m_weapon_hit_count ==3:
		
			var player_anim = Player.get_node("Anime_Set/AnimationPlayer")
			#Player.get_node("Anime_Set/Attack/Node2D").get_child(0).get_node("effect").emitting = true
			player_anim.set_animation_process_mode(2)
			flash_modifier = 1.0
			yield(get_tree().create_timer(0.5),"timeout")
			#Player.get_node("Anime_Set/Attack/Node2D").get_child(0).get_node("effect").emitting = false
			player_anim.set_animation_process_mode(1)
			flash_modifier = 0.0
			Globals.m_weapon_hit_count = 0
		#player_anim.play()
		"""
		$Sprite.modulate = Color(1, 0, 0)
		yield(get_tree().create_timer(0.3),"timeout") #Do is this with Tween 
		$Sprite.modulate = Color(1, 1, 1)
		"""
		#$Sprite.play("move")
		"""
		var tween = get_node("Tween")
		tween.interpolate_property(self, "rotation_degrees",0,-Player.last_x_dir*15,10,
				Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()
		tween.interpolate_property(self, "rotation_degrees",-Player.last_x_dir*15,15,10,
				Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		"""
		print(Player.last_x_dir)
		apply_central_impulse(Vector2(150 * Player.last_x_dir,-25))
		#linear_velocity.y -= 50
		#
		#body.velocity.x = -50


