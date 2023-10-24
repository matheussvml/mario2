extends Node

const serial_res = preload("res://bin/gdserial.gdns")
var serial_port = serial_res.new()
var is_port_open = false
signal direita
signal esquerda
signal parado
signal pulo

func _ready():
	is_port_open = serial_port.open_port('COM3', 115200) #COLOCAR A PORTA QUE O ESP TÁ CONECTADO
	print(is_port_open)

func _process(delta):
	if (is_port_open):
		var message = serial_port.read_text()
		if (message.length() > 0):
			for i in message:
				if(i == '\n'):
					_text_interpreter(message)
					message = ''
				else:
					message = message + i

func _text_interpreter(message):
	var command = message.split(' ')
	if(command[0] == 'Direita'):
		emit_signal("direita")
	if(command[0] == 'Esquerda'):
		emit_signal("esquerda")
	if(command[0] == 'Parado'):
		emit_signal("parado")
	if(command[0] == 'Pulo'):
		emit_signal("pulo")
	if(command[0] == 'NaoPulo'):
		emit_signal("naoPulo")
