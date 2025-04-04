extends Node2D

@export var MaxNumber = 5
@export var Number = 0
@export var Direction = true
@export var LevelID = 0
@export var InLevelID = 0

func _physics_process(delta: float) -> void:
	visible=get_parent().get_parent().get_parent().get_node('.').visible
	$CollisionShape2D.disabled=not get_parent().get_parent().get_parent().get_node('.').visible
