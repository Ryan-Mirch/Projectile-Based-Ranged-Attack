extends Node2D


export var speed:float = 5
export var lifetime:float = 3

onready var timer:Timer = $"%Timer"
onready var hurtbox = $"%HurtBox"

var direction:Vector2

func _ready():
	look_at(position + direction)
	timer.start(lifetime)
	
	
func _physics_process(delta):
	position += direction * speed * delta * 100


func _on_HurtBox_body_entered(body):
	var enemy = body.get_parent()
	enemy.hit()
	queue_free()
	

func _on_Timer_timeout():
	queue_free()
