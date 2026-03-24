extends Marker2D

func _ready():
	center_marker()
	get_viewport().size_changed.connect(center_marker)

func center_marker():
	position = get_viewport_rect().size / 2 
