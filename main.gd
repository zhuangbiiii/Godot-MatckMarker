extends Control


@export var icon_textures:Array[Texture2D]

var pre_icon


@onready var box = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	_new_game()
	


func _new_game():
	var icons:Array
	icons.append_array(icon_textures)
	icons.append_array(icon_textures)
	icons.shuffle()
	
	var cards = box.get_children()
	for card in cards:
		if card is Control:
			card.init(icons.pop_front())
			

func _on_icon_clicked(icon):
	# 点击的是第二张卡片
	if pre_icon:
		# 如果两张卡片不匹配，翻回背面
		if pre_icon.face != icon.face:
			pre_icon.reset()
			icon.reset()
			
		pre_icon = null
	# 点击的是第一张图片
	else:
		pre_icon = icon
			


func _on_button_pressed():
	_new_game()
