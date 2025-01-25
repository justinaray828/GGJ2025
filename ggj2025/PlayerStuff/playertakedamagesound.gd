extends AudioStreamPlayer2D

@export var damsound1: AudioStream  = null
@export var damsound2: AudioStream = null
@export var damsound3: AudioStream = null
@export var damsound4: AudioStream  = null
@export var damsound5: AudioStream = null
@export var damsound6: AudioStream = null
@export var damsound7: AudioStream  = null
@export var damsound8: AudioStream = null

func DamageSound():
	var mysound = randi_range(1,8)
	print("Damage sound should be playing")
	match mysound:
		1:
			stream = damsound1
		2: 
			stream = damsound2
		3: 
			stream = damsound3
		4:
			stream = damsound4
		5:
			stream = damsound5
		6:
			stream = damsound6
		7:
			stream = damsound7
		8: 
			stream = damsound8
	play()
