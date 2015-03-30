require 'matrix'

class Chesspiece
  SYMBOLS = {}

  def self.symbols(symbols)
    self.const_set(:SYMBOLS, symbols)
    symbols.each do |color, symbol|
      Chesspiece::SYMBOLS[symbol.to_sym] = [self, color]
      Chesspiece::SYMBOLS[symbol.to_s] = [self, color]
    end
  end

  def self.[](symbol)
    type, color = SYMBOLS[symbol]    
    return nil unless type
    type.new(color)
  end

  attr_reader :color
  attr_accessor :square

  def initialize(color, square=nil)
    @color, @square = color, square
  end

  def symbol
    self.class::SYMBOLS[color]
  end

  def to_s
    "#{symbol}#{square}"
  end

  def describe
    "#{color} #{self.class.to_s.downcase} #{to_s}"
  end

  def white?
    color == :white
  end

  def black?
    color == :black
  end

  def opposite
    white?? :black : :white
  end

  NORTH, SOUTH = Vector[-1, 0], Vector[1, 0]
  EAST, WEST = Vector[0, 1], Vector[0, -1]
  NORTHEAST, NORTHWEST = NORTH + EAST, NORTH + WEST
  SOUTHEAST, SOUTHWEST = SOUTH + EAST, SOUTH + WEST

  def ride(vec, **opts)
    min = opts[:min] || 1
    max = opts[:max] || (1.0 / 0.0)
    capture = opts[:capture].nil?? true : opts[:capture]
    steps = []
    (min..max).each do |step|
      sq = square + step * vec
      break unless sq.valid?
      break unless sq.empty? or capture && sq.piece.color == opposite
      steps << {piece: self, from: square, to: sq, capture: capture ? sq : false}
      break if sq.piece && sq.piece.color == opposite
    end
    steps
  end

  def moves
    []
  end
end

class Pawn < Chesspiece
  symbols white: '♙', black: '♟'

  def initialize(*args)
    super
    @has_moved = false
  end

  def moves
    step = black?? SOUTH : NORTH
    basic = ride(step, max: 1, capture: false)
    stabby = [step + EAST, step + WEST].map do |stab|
      square + stab
    end.reject { |sq| sq.empty? || sq.piece.color == color }
    advance = []
    unless @has_moved
      advance = ride(step * 2, max: 1, capture: false)
    end
    basic + advance + stabby
  end
end

class Rook < Chesspiece
  symbols white: '♖', black: '♜'

  def moves
    [NORTH, SOUTH, EAST, WEST].flat_map(&method(:ride))
  end
end

class Knight < Chesspiece
  symbols white: '♘', black: '♞'
end

class Bishop < Chesspiece
  symbols white: '♗', black: '♝'

  def moves
    [NORTHEAST, NORTHWEST,
     SOUTHEAST, SOUTHWEST].flat_map(&method(:ride))
  end
end

class Queen < Chesspiece
  symbols white: '♕', black: '♛'

  def moves
    [NORTH, SOUTH, EAST, WEST,
     NORTHEAST, NORTHWEST,
     SOUTHEAST, SOUTHWEST].flat_map(&method(:ride))
  end
end

class King < Chesspiece
  symbols white: '♔', black: '♚'

  def moves
    [NORTH, SOUTH, EAST, WEST,
     NORTHEAST, NORTHWEST,
     SOUTHEAST, SOUTHWEST].flat_map do |vec|
      ride(vec, max: 1)
    end
  end
end