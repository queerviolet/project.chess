class Board
  attr_reader :pieces, :width, :height

  LAYOUT = [
      [:♜, :♞, :♝, :♛, :♚, :♝, :♞, :♜,],
      [:♟, :♟, :♟, :♟, :♟, :♟, :♟, :♟,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:♙, :♙, :♙, :♙, :♙, :♙, :♙, :♙,],
      [:♖, :♘, :♗, :♕, :♔, :♗, :♘, :♖,]
    ]

  # pieces is a hash of {[row:(0..7), col:(0..7)] => Chesspiece}
  def initialize(width=8, height=8)
    @width, @height = width, height
    height = LAYOUT.length
    width = LAYOUT[0].length
    @pieces = {}
    LAYOUT.each_with_index do |row, row_idx|
      row.each_with_index do |sym, column_idx|
        if piece = Piece[sym]
          @pieces[[row_idx, column_idx]] = piece
        end
      end
    end
    @pieces.each { |pos, piece| piece.square = self[*pos] }
  end

  #Board finds the Piece at that square. If there is no
  #Piece at that square, or the Piece does not belong to
  # user, Board replies to Game with an empty list of moves.
  def find_piece(coordinates)
    @pieces[coordinates]
  end

  def check_square(coordinates)
    # p @pieces[coordinates].square
  end

  def move!(coordinates, move_coordinates)
    puts @pieces[coordinates]
    puts @pieces[move_coordinates]

    piece_moved = @pieces[coordinates]
    @pieces[move_coordinates] = nil
    @pieces[coordinates] = nil
    @pieces[move_coordinates] = piece_moved

    puts @pieces[coordinates]
    puts @pieces[move_coordinates]
    puts @board

    # check if the piece is allowed to move in the end coordinates in that direction
    # pieces.valid?


  end

  def check_path(coordinates, move_coordinates)
    object = find_piece(coordinates)
    object.move_possibilities(coordinates).each do |coordinate|
      puts find_piece(coordinate)
    end
    #  (Board) Will take start and end coordinates of move and will check path for validity
    #  (Board) Calculate dx (end_x - start_x) and dy (end_x - start_x)
  end

  def update_board
    #  (Board) If valid, will write over Board with new placement of specific piece
  end

  #Game asks Board for moves for the user at the board_square
  # Board filters the list of moves to only those which
  #  are allowed given the current state of the board
  def moves

  end

  # def clear(coordinates)
  #   @pieces.delete(coordinates)
  # end

  def [](row, col)
    Square.new(self, row, col)
  end

  def to_s
    (0..7).map do |r|
      (0..7).map do |c|
        if self[r, c].piece
          " #{self[r, c].piece.symbol} "
        else
          "   "
        end
      end.join
    end.join("\n")
  end

end

class Square
  attr_reader :board, :row, :col
  attr_accessor :piece
  def initialize(board, row, col)
    @board, @row, @col = board, row, col
    @piece = piece
  end

  def valid?
    row > 0 && row < board.height && col > 0 && col < board.width
  end

  def piece
    board.pieces[[row, col]]
  end

  def empty?
    piece == nil
  end

  def +((dr, dc))
    board[row + dr, col + dc]
  end

  def to_s
    "#{('a'..'z').to_a[row]}#{board.height - col}"
  end

  def has_piece?
  end
end
