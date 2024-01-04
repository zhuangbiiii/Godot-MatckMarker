extends Control
## 可点击翻面，自动复原的卡片基类


# 点击的信号
signal clicked(icon)

# 公共变量卡片正面的图片
var face
# 私有变量卡片的翻面状态
var _faced = false

# 常量卡片背面
const BACK = preload("res://icon.svg")

# 子节点引用
@onready var anima = $AnimationPlayer
@onready var card = $TextureRect


# 初始化卡片正面图片
func init(inface):
	face = inface
	_faced = false
	card.texture = BACK


# 鼠标左键点击事件处理
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not _faced:
			flip()
		


# 公共函数翻面
func flip():
	anima.play("flip")
	


# 公共函数翻回背面
func reset():
	anima.play("RESET")
	


# 私有函数翻面更改图片
func _flip():
	card.texture = face
	


# 私有函数翻回背面更改图片
func _reset():
	card.texture = BACK
	


# 私有函数锁定输入
func _lockinput():
	_faced = true
	


# 私有函数解锁输入
func _resetinput():
	_faced = false
	


# 广播信号
func _emit():
	clicked.emit(self)
	
