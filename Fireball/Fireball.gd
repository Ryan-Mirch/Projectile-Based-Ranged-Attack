extends Node2D


export var speed:float = 5
export var lifetime:float = 3

onready var timer:Timer = $"%Timer"
onready var hurtbox = $"%HurtBox"
onready var collisionbox = $"%CollisionBox"

var direction:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	look_at(position + direction)
	timer.start(lifetime)
	
	
func _physics_process(delta):
	position += direction * speed * delta * 100


func _on_CollisionBox_body_entered(_body):
	for collisionBox in hurtbox.get_overlapping_bodies():
		var enemy = collisionBox.get_parent()
		enemy.hit()
	queue_free()
	
	
func _on_Timer_timeout():
	queue_free()
