class Game
  def initialize
    
  end
  #Finally, we need something to handle the REPL—getting 
  #input from the user and printing the board. A Game 
  #class would be a good place to keep this code.

  #Game gets a board_square from the user.
  def ask_for_move
    #  (Game) User will input the coordinate of the piece 
    # she/he wants to move first via gets.chomp (start location)
    coordinates = gets.chomp
  end

  def to_s
    #Game presents the moves list to the user and says,
    # "user, your move?"
  end

  # Move logic

end

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
      [:♖, :♘, :♗, :♕, :♔, :♗, :♘, :♖,],
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
    puts @pieces[coordinates]
  end

  def check_path
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

  def [](row, col)
    Square.new(self, row, col)
  end

  def to_s
    (0..height - 1).map do |r|
      (0..width - 1).map do |c|
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
  def initialize(board, row, col)
    @board, @row, @col = board, row, col
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

class Piece
  attr_reader :color
  attr_accessor :square

  SYMBOLS = {}

  def self.symbols(symbols)
    self.const_set(:SYMBOLS, symbols)
    symbols.each do |color, symbol|
      Piece::SYMBOLS[symbol.to_sym] = [self, color]
      Piece::SYMBOLS[symbol.to_s] = [self, color]
    end
  end

  def self.[](symbol)
    type, color = SYMBOLS[symbol]    
    return nil unless type
    type.new(color)
  end

  def initialize(color, square=nil)
    @color, @square = color, square
  end

  def symbol
    self.class::SYMBOLS[color]
  end

  def to_s
    "#{symbol}"
  end

  def describe
    "#{color} #{self.class.to_s.downcase} #{to_s}"
  end

  def ride(step, min_steps=1, max_steps=nil)
    steps = []
    sq = square
    while board.in_bounds?(p)

    end
  end

  #  (Piece) If valid, will reset square to new square
   
  #Some pieces can jump over other pieces.
  # Some pieces can turn into other pieces.

  # Takes a square (an array [row:0..7, col:0..7]) and
  # returns true if it is a valid movement for this piece from its
  # current square, false otherwise.
  def can?(square)
  end

  # Returns an enumerable of moves (instances of Move) for this
  # piece from its current square.

  #Board asks the Piece for a list of its moves
  def moves(square)
    #May return moves which are off
    #the board or overlap other pieces.
  end

end

# add module or to class the coordinate comparison
class Rook < Piece
  attr_reader :color

  symbols white: '♖', black: '♜'

  def initialize(color)
    @color = color
  end

  def moves
    moves = []
    (0..7).each do |x|
      (0..7).each do |y|
        [[1, 0], [0, 1], [0, -1], [-1, 0]].each do |dx, dy|
          moves << [dx, dy]
        end
      end
    end
    return moves
  end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board
end

class Knight < Piece
  attr_reader :color

  symbols white: '♘', black: '♞'

  def initialize(color)
    @color = color
  end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board

end

class Bishop < Piece
  attr_reader :color

  symbols white: '♗', black: '♝'

  def initialize(color)
    @color = color
  end

  def moves
    moves = []
    (0..7).each do |x|
      (0..7).each do |y|
        [[1, 1], [1, -1], [-1, -1], [-1, 1]].each do |dx, dy|
          moves << [dx, dy]
        end
      end
    end
    return moves
  end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board
end

class Queen < Piece
  attr_reader :color

  symbols white: '♕', black: '♛'

  def initialize(color)
    @color = color
  end

  def moves
    moves = []
    (0..7).each do |x|
      (0..7).each do |y|
        [[1, 0], [1, 1], [1, -1], [0, 1], [0, -1], [-1, 0], [-1, -1], [-1, 1]].each do |dx, dy|
          moves << [dx,dy]
        end
      end
    end
    moves
  end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board
end

class King < Piece
  attr_reader :color

  symbols white: '♔', black: '♚'

  def initialize(color)
    @color = color
  end

  def moves
    moves = []
    (0..7).each do |x|
      (0..7).each do |y|
        [[1, 0], [0, 1], [0, -1], [-1, 0]].each do |dx, dy|
          moves << [dx, dy]
        end
      end
    end
    return moves
  end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board

end

class Pawn < Piece
  attr_reader :color

  symbols white: '♙', black: '♟'

  def initialize(color)
    @color = color
  end

  def moves

  end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board

end

board = Board.new
board.find_piece([7,7])
board.find_piece([1,2])
board.find_piece([7,5])
board.find_piece([6,6])
p king = King.new(:black).moves
p rook = Rook.new(:black).moves.length
p biship = Bishop.new(:white).moves.length
p queen = Queen.new(:black).moves.length



