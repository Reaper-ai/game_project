extends Area2D

signal win
var tiles = []  # 3x3 array for tiles
var solved = []  # 3x3 solved state
var mouse = false
var offset = Vector2(288, 27)

# Called when the node enters the scene tree for the first time.
func _ready():
	start_game()

func start_game():
	# Create a 3x3 board using a 2D array (instead of a flat array)
	tiles = [
		[$Tile1, $Tile2, $Tile3],
		[$Tile4, $Tile5, $Tile6],
		[$Tile7, $Tile8, $Tile9]
	]
	# Duplicate the initial state for solved configuration
	solved = tiles.duplicate(true)
	# Shuffle the tiles to start the game
	shuffle_tiles()
	
# Function to shuffle the tiles using Fisher-Yates shuffle
func shuffle_tiles():
	var flat_tiles = []

	# Flatten the 3x3 array into a 1D array (excluding the empty space)
	for row in tiles:
		flat_tiles += row

	# Shuffle the tiles randomly and check if the puzzle is solvable
	var solvable = false
	while not solvable:
		# Fisher-Yates shuffle
		var n = flat_tiles.size()
		for i in range(n - 1, 0, -1):
			var j = randi() % (i + 1)
			var temp = flat_tiles[j]
			flat_tiles[j] =  flat_tiles[i]
			flat_tiles[i] = temp

		# Check if the shuffled state is solvable
		solvable = is_solvable(flat_tiles)

	# Rebuild the 3x3 grid with shuffled tiles
	for i in range(3):
		for j in range(3):
			tiles[i][j] = flat_tiles[i * 3 + j]
			# Update the tile's visual position based on its new index
			tiles[i][j].position = Vector2((j + -1 )* 192, (i -1)* 192)


# Function to count inversions and check if the puzzle is solvable
func is_solvable(flat_tiles):
	var inversions = 0
	var tiles_no_empty = []
		
# Flatten tiles array excluding the empty space (Tile9)
	for tile in flat_tiles:
		if tile != $Tile9:
			tiles_no_empty.append(tile)

	# Count inversions
	for i in range(tiles_no_empty.size()):
		for j in range(i + 1, tiles_no_empty.size()):
			if tiles_no_empty[i].get_index() > tiles_no_empty[j].get_index():
				inversions += 1

# A puzzle is solvable if the inversion count is even
	return inversions % 2 == 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse:
		var mouse_position = get_global_mouse_position()

		var pos = mouse_position - offset
		
		var rows = int((mouse_position.y - offset.y ) / 192)
		var cols = int((mouse_position.x - offset.x ) / 192)
		check_neighbours(rows, cols)

		if check_win():
			emit_signal("win")

# Check if the tiles are in the solved configuration
func check_win() -> bool:

	for i in range(3):
		for j in range(3):
			if tiles[i][j] != solved[i][j]:
				return false
	return true

# Function to check for adjacent tiles that can move into the empty space
func check_neighbours(rows, cols):
	var empty_pos = find_empty_tile()
	var empty_row = empty_pos.x
	var empty_col = empty_pos.y
	
	if abs(empty_row - rows) + abs(empty_col - cols) == 1:  # Check if tile is adjacent
		$"../AudioStreamPlayer2D".play()
		swap_tiles(rows, cols, empty_row, empty_col)

# Find the position of the empty tile (tile 9)
func find_empty_tile() -> Vector2:
	for i in range(3):
		for j in range(3):
			if tiles[i][j] == $Tile9:
				return Vector2(i, j)
	return Vector2(-1, -1)  # Should never reach here if the empty tile exists

# Swap the positions of two tiles
func swap_tiles(row1, col1, row2, col2):
	var temp_tile = tiles[row1][col1]
	tiles[row1][col1] = tiles[row2][col2]
	tiles[row2][col2] = temp_tile

	# Update the positions of the tiles visually
	tiles[row1][col1].position = Vector2((col1-1) * 192, (row1-1) * 192)
	tiles[row2][col2].position = Vector2((col2-1) * 192, (row2-1) * 192)

# Input event handling (if needed)
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event
