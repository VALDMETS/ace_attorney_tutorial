extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

const CHARACTER_FRAMES = {
	"Phoenix": preload("res://resources/phoenix_talking.tres"),
	"Trucy" : preload("res://resources/trucy.tres")
}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func change_character(character_name: String, is_talking : bool = true):
	if character_name == "Apollo":
		animated_sprite.play("idle")
	else:
		animated_sprite.sprite_frames = CHARACTER_FRAMES[character_name]
		if is_talking:
			animated_sprite.play("talking")
		else:
			animated_sprite.play("idle")
