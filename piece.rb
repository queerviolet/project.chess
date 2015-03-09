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

  def move_possibilities(coordinates)
    moves = []
    (-7..7).each do |dx|
      (-7..7).each do |dy|
            # moves << [dx, dy]
            new_x = coordinates[0] + dx
            new_y = coordinates[1] + dy
            if ((new_x >= 0 && new_x <= 7) && (new_y >= 0 && new_y <= 7)) && (dx == 0 && dy.abs <= 7) || (dy == 0 && dx.abs <= 7)
              moves << [new_x, new_y]
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

  def move_possibilities(coordinates)
    moves = []
    (-1..1).each do |dx|
      (-1..1).each do |dy|
            # moves << [dx, dy]
            new_x = coordinates[0] + dx
            new_y = coordinates[1] + dy
            moves << [new_x, new_y]
          end
        end
        return moves

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

  def move_possibilities(coordinates)
    moves = []
    (-7..7).each do |dx|
      (-7..7).each do |dy|
          # moves << [dx, dy]
          new_x = coordinates[0] + dx
          new_y = coordinates[1] + dy
          if (dx.abs == dy.abs) && (new_x <= 7 && new_y <= 7) && (new_x >=0 && new_y >= 0)
            moves << [new_x, new_y]
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

  def move_possibilities(coordinates)
    moves = []
    (-7..7).each do |dx|
      (-7..7).each do |dy|
          # moves << [dx, dy]
          new_x = coordinates[0] + dx
          new_y = coordinates[1] + dy
          if (new_x >= 0 && new_y >= 0 && new_x <= 7 && new_y <= 7) && ((dx.abs == dy.abs) || (dx.abs == 0 && dy.abs <= 7) || (dy.abs == 0 && dx.abs <= 7))
            moves << [new_x, new_y]
          end
        end
      end
      return moves
    end

  #  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
  #  (subclass of Piece) Will return that move is valid to Board
end

class King < Piece
  attr_reader :color

  symbols white: '♔', black: '♚'

  def initialize(color)
    @color = color
    @possible_moves = []
  end

  def move_possibilities(coordinates)
    moves = []
    (-1..1).each do |dx|
      (-1..1).each do |dy|
          # moves << [dx, dy]
          new_x = coordinates[0] + dx
          new_y = coordinates[1] + dy
          moves << [new_x, new_y]
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
