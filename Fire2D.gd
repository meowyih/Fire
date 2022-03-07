extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stage : int = 0
var interval = [10,3,3,5,5,1,3,3,3,3,3,0];

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.material.set_shader_param("strength", 3.0)
	$ColorRect.material.set_shader_param("speed", 1.0)
	$Timer.start( interval[stage] )
	$Timer2.start( 1 )


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	
	match stage:
		0:
			$ColorRect.material.set_shader_param("speed", 0.0)
			$ColorRect2.material.set_shader_param("speed", 1.0)
		1:
			$ColorRect2.material.set_shader_param("speed", 0.0)
			$ColorRect4.material.set_shader_param("y_height", 1.5)
			$ColorRect4.material.set_shader_param("speed", 1.0)
			$Tween.interpolate_property( $ColorRect4.material, "shader_param/power", 1, 10, interval[stage], Tween.TRANS_LINEAR, Tween.EASE_IN_OUT )
			$Tween.start()
		2:
			$ColorRect4.material.set_shader_param("speed", 0.0)
			$ColorRect4.material.set_shader_param("power", 1.0)
			$ColorRect5.material.set_shader_param("speed", 1.0)
			$Tween.interpolate_property( $ColorRect5.material, "shader_param/contrast", 1, 3, interval[stage], Tween.TRANS_LINEAR, Tween.EASE_IN_OUT )
			$Tween.start()
		3:
			$ColorRect5.material.set_shader_param("speed", 0.0)
			$ColorRect6.material.set_shader_param("speed", 3.0)
		4:
			$ColorRect6.material.set_shader_param("speed", 0.0)
			$ColorRect6.material.set_shader_param("height", 1.3)
			$Tween.interpolate_property( $ColorRect7.material, "shader_param/c_v", 0.25, 0.5, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT )
			$Tween.start()
		5:
			$ColorRect7.material.set_shader_param("c_v", 0.25)
			$ColorRect8.material.set_shader_param("strength", 1.0)
			$ColorRect8.material.set_shader_param("speed", 1.0)
		6:
			$ColorRect8.material.set_shader_param("strength", 2.0)
			$ColorRect8.material.set_shader_param("speed", 3.0)
		7:
			$ColorRect8.material.set_shader_param("strength", 3.0)
			$ColorRect8.material.set_shader_param("speed", 5.0)
		8:
			$ColorRect8.material.set_shader_param("strength", 3.0)
			$ColorRect8.material.set_shader_param("speed", 5.0)
		9:
			$Tween.interpolate_property( $ColorRect8.material, "shader_param/c_h", 0.0, 9.0, interval[stage], Tween.TRANS_LINEAR, Tween.EASE_IN_OUT )
			$Tween.start()
		10:
			$ColorRect8.material.set_shader_param("speed", 0.0)
			$ColorRect9.material.set_shader_param("speed", 7.0)
		11:
			$ColorRect9.material.set_shader_param("speed", 0.0)
		_:
			pass
			
	stage = stage + 1
	
	if stage >= interval.size():
		return
	
	$Timer.start( interval[stage] )

func _on_Timer2_timeout():
	print( '_on_Timer2_timeout ' + str(stage) )
	match stage:
		0:
			var strength : float = $ColorRect.material.get_shader_param("strength")
			$ColorRect.material.set_shader_param("strength", strength + 0.5 )
		1:
			var color : int = $ColorRect2.material.get_shader_param("crgb")
			$ColorRect2.material.set_shader_param("crgb", ( color + 1 ) % 3 )
		4:
			var height : float = $ColorRect6.material.get_shader_param("height")
			$ColorRect6.material.set_shader_param("height", height - 0.1 )
			print( '_on_Timer2_timeout get height' + str(height) )
