class Piece
  def initialize(location, state, move_pattern, args={})
    @location = location
    @state = state
    @move_pattern = move_pattern
    @capture_pattern = args.fetch(:capture_pattern, move_pattern)
    @can_jump = args.fetch(:can_jump, false)
    @can_reverse = args.fetch(:can_reverse, true)
  end

  def move(row,col)
    if @move_pattern == [@location[0] - row, @location[1] - col].map { |el| el.abs}

      return row,col
    end
    return @location
  end

  def victim_capturable?(victim_state)
    @state == victim_state
    #board asks self state
    #compares to state of attacking piece
    #if self.state != attacking_piece.state
    #return true
  end

end

# test_piece = Piece.new([0,0], "black", [1,0])
# p test_piece.move(1,0)

class Board
attr_accessor :board, :captured_pieces
  def initialize
    @board = [["♜""♞""♝""♛""♚""♝""♞""♜"],
    ["♟"*8],
    [" "*8],
    [" "*8],
    [" "*8],
    [" "*8],
    ["♙"*8],
    ["♖""♘""♗""♕""♔""♗""♘""♖"]].split("")
    @captured_pieces = []
  end

  def cell_empty?(y,x)
    @board[y][x] == " "
  end

  def remove(y,x)
    @board[y][x] = " "
  end

  def send_piece(y,x)
    @captured_pieces << @board[y][x]
  end

  def update_board
    #scans every piece's new location and updates on board
  end

end