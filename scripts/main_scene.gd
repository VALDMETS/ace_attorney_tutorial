extends Node2D

@onready var character = %Character
@onready var dialog_ui = %DialogueUI

var dialog_index : int = 0

const dialog_lines : Array[String] = [
	"Phoenix: Hi! My name is Phoenix Wright. I'm not a sex offender, yet.",
	"Trucy: Hey there! you're going to jail!",
	"Apollo: Hello, it's nice to meet you two. Are y'all fucking?",
	"Phoenix: No, but I'm interested. Maybe Trucy is too!",
	"Phoenix: What do you think, Trucy?",
	"Trucy: Go fuck yourself first, try that!"
]
func _ready():
	# Process first line of dialog
	dialog_index = 0
	process_current_line()

func _input(event):
	if event.is_action_pressed("next_line"):
		if dialog_index < len(dialog_lines) - 1:
			dialog_index += 1
			process_current_line()

func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return {
		"speaker_name": line_info[0],
		"dialog_line": line_info[1]
	}

func process_current_line():
	var line = dialog_lines[dialog_index]
	var line_info2 = parse_line(line)
	dialog_ui.speaker_name.text = line_info2["speaker_name"]
	dialog_ui.dialog_line.text = line_info2["dialog_line"]
	character.change_character(line_info2["speaker_name"])
