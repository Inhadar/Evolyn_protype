extends Node2D


var Ground_Blast_perms = false

#Run
onready var leg1  =preload("res://Legs/legtype1.png")
onready var leg2  =preload("res://Legs/legtype2.png")
onready var arms1 =preload("res://arms/armtype1.png")
onready var arms2 =preload("res://arms/armtype2.png")
onready var body1 =preload("res://Bodies/Bodytype1.png")
onready var body2 =preload("res://Bodies/Bodytype2.png")

#Idle
onready var idleLeg1 = preload("res://Legs/idleleg1.png")
onready var idleLeg2 = preload("res://Legs/idleleg2.png")
onready var idleBody1 = preload("res://Bodies/idlebody1.png")
onready var idleBody2 = preload("res://Bodies/idlebody2.png")
onready var idleArm1 = preload("res://arms/idlearm1.png")
onready var idleArm2 = preload("res://arms/idlearm2.png")

#export(PackedScene) var blood: PackedScene

func _ready():
	pass
	#$Player/AnimationPlayer.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta: float) -> void:
	if Ground_Blast_perms == true:
		for i in $Boss1.get_slide_count():
			var colls = $Boss1.get_slide_collision(i)
			if colls.collider.name == "floor":
				$Player.velocity.x -= 1000
				$Player.velocity.y -= 300
				Ground_Blast_perms = false
				$Boss1/AnimationPlayer.play("Angry")

	
	
"""
func _physics_process(delta: float) -> void:
	if(Input.is_action_just_pressed("mb_left")):
		for i in range(55):
			var blood_instance : Area2D = blood.instance()
			blood_instance.global_position = get_global_mouse_position()
			add_child(blood_instance)

"""
	
func _on_Run_pressed():
	$Player/Anime_Set/AnimationPlayer.play("Run")







func _on_Arms1_pressed():
	$Player/Anime_Set/Run/Arm1.texture = arms1
	$Player/Anime_Set/Run/Arm2.texture = arms1
	$Player/Anime_Set/Idle/Arm1.texture = idleArm1
	$Player/Anime_Set/Idle/Arm2.texture = idleArm1
	
func _on_Arms2_pressed():
	$Player/Anime_Set/Run/Arm1.texture = arms2
	$Player/Anime_Set/Run/Arm2.texture = arms2
	$Player/Anime_Set/Idle/Arm1.texture = idleArm2
	$Player/Anime_Set/Idle/Arm2.texture = idleArm2

func _on_Body1_pressed():
	$Player/Anime_Set/Run/Body.texture = body1
	$Player/Anime_Set/Idle/Body.texture = idleBody1
func _on_Body2_pressed():
	$Player/Anime_Set/Run/Body.texture = body2
	$Player/Anime_Set/Idle/Body.texture = idleBody2
	
	

func _on_Legs1_pressed():
	$Player/Anime_Set/Run/Legs.texture = leg1
	$Player/Anime_Set/Idle/Legs.texture = idleLeg1

func _on_Legs2_pressed():
	$Player/Anime_Set/Run/Legs.texture = leg2
	$Player/Anime_Set/Idle/Legs.texture = idleLeg2
	
	

	




func _on_Idle_pressed():
	$Player/Anime_Set/AnimationPlayer.play("Idle")


func _on_WRun_pressed():
	$Player/Anime_Set/AnimationPlayer.play("WRun")

func _on_Restart_pressed():
	var _restart = get_tree().reload_current_scene()


func _on_Attack_pressed():
	$Player/Anime_Set/Attack/Node2D.modulate = Color(1, 1, 1)
	$Player/Anime_Set/AnimationPlayer.play("Attack")





func _on_Fall_pressed():
	$Player/Anime_Set/AnimationPlayer.play("Fall")


func _on_jump_pressed():
	$Player/Anime_Set/AnimationPlayer.play("Jump")




func _on_Door_locker_body_entered(body):
	if body.name == "Player":
		$Boss_area/AnimationPlayer.play("door")
		$Boss_area/Door_locker/CollisionShape2D.set_deferred("disabled",true)



func _on_Boss_dedect_body_entered(body):
	if body.name == "Player":
		$Boss_area/Boss_dedect/CollisionShape2D.set_deferred("disabled",true)
		$Boss_patform/StaticBody2D/CollisionShape2D.set_deferred("disabled",true)



func _on_Ground_wave_body_entered(body):
	if body.name == "Player":
		$Boss_area/Ground_wave/CollisionShape2D.set_deferred("disabled",true)
		Ground_Blast_perms = true
		yield(get_tree().create_timer(2),"timeout")
		$Boss_patform/StaticBody2D/CollisionShape2D.set_deferred("disabled",false)
