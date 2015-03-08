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
  attr_reader :color, :moves

  symbols white: '♖', black: '♜'

  def initialize(color)
    @color = color
    @moves = []
    @pieces_in_path = []
  end

  def move!(move_to)
    p move_to

  end

  def moves(board)
    @board = board
    (0..7).each do |x|
      (0..7).each do |y|
        [[1, 0], [0, 1], [0, -1], [-1, 0]].each do |dx, dy|
          # puts "Found at #{[dx,dy]}: #{@board.find_piece([dx,dy])}"
          @moves << [dx,dy]
        end
      end
    end
    return @moves

    @squares =
    7.times do
      x += dx
      y += dy
    end

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

  def move_possibilities
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

  def move_possibilities
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

  def move_possibilities
    moves = []
    (-1..1).each do |dx|
      (-1..1).each do |dy|
          moves << [dx, dy]
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

  def move_possibilities

  end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board

end
