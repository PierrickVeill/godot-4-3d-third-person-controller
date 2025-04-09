extends Path3D

@onready var listenerToFollow = $"../Player"
@onready var follow = $PathFollow3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var listenerPosition = to_local(listenerToFollow.position)
	var newEmitterPosition = curve.get_closest_offset(listenerPosition)
	var tween = get_tree().create_tween()
	tween.tween_property(follow, "progress", newEmitterPosition, 0.6)
