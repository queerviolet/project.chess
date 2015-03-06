class Chesspiece
  attr_reader :color
  attr_accessor :square

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

  def initialize(color, square=nil)
    @color, @square = color, square
  end

  def symbol
    self.class::SYMBOLS[color]
  end

  def to_s
    "#{symbol}#{pos}"
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
end

class Pawn < Chesspiece
  symbols white: '♙', black: '♟'
end

class Rook < Chesspiece
  symbols white: '♖', black: '♜'
end

class Knight < Chesspiece
  symbols white: '♘', black: '♞'
end

class Bishop < Chesspiece
  symbols white: '♗', black: '♝'
end

class Queen < Chesspiece
  symbols white: '♕', black: '♛'
end

class King < Chesspiece
  symbols white: '♔', black: '♚'
end