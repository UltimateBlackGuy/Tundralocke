extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()

var width = 32
var height = 32

const WALL_TILE = Vector2(0,0)
const FLOOR_TILE = Vector2(1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _initialize_noise():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()

func generate_chunk():
	var tile_pos = local_to_map(Vector2(0,0))
	for x in range(width):
		for y in range(height):
			# this is finding the world position
			var world_x = tile_pos.x - width / 2 * x
			var world_y = tile_pos.y - height / 2 * y
			
			var moist = moisture.get_noise_2d(world_x, world_y) * 10
			var temp = temperature.get_noise_2d(world_x, world_y) * 10
			var alt = altitude.get_noise_2d(world_x, world_y) * 10
			
			var atlas_coords: Vector2
			if alt < 2:
				atlas_coords = WALL_TILE
			
			
