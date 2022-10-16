extends KinematicBody

var velocidade = Vector3(0,0,0)
var player_velocity = 500
var player_rotation_velocity = 5
const gravidade = 20

func _ready():
	pass

func _physics_process(delta):
	velocidade.y -= gravidade * delta
		
	var vert_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var hor_mov = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	velocidade.z = vert_mov	* player_velocity * delta
	rotation.y += hor_mov * delta * player_rotation_velocity
	velocidade = Vector3(0,velocidade.y, velocidade.z).rotated(Vector3(0,1,0), rotation.y)

	velocidade = move_and_slide(velocidade, Vector3.UP)
	
	#get_parent().get_node("cam")
